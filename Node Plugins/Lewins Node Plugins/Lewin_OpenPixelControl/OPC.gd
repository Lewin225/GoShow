extends Node

onready var address = $"../address"
onready var input = $"../Input"
onready var reconnect = $"../Input/reconnect"
var client     # StreamPeerTCP
var packetpeer # PacketPeerStream
var channel = 0
var pixels = []
var last_pixels = []
var output_pixels = []


var command = {
	'SET_8_BIT_PIXEL':0,
	'SET_16_BIT_PIXEL':1,
	'SYSTEM_EXCLUSIVE':255,
}


func _ready():
	print("OPC innit")
	client = get_client()
	get_connection(address.text)
	
func _physics_process(_delta):
	if input.InPort != null and input.InValue != null:
		pixels = input.InValue
		send_pixels()

	
func _exit_tree():
	client.disconnect_from_host()

func get_client():
	if not client:
		client = StreamPeerTCP.new()
		client.set_no_delay(true)
	return client

func get_connection(address_and_port):
	if client.is_connected_to_host():
		return true
	else:
		var addr = address_and_port.split(":")[0]
		var port = address_and_port.split(":")[1]
		print("OPC connection attempt")
		client.connect_to_host(addr, int(port))
		if client.is_connected_to_host():
			print("OPC connection ok")
			packetpeer = PacketPeerStream.new()
			packetpeer.set_stream_peer(client)
			return true
		
func drop_connection():
	client.disconnect_from_host()
	
func _send(opcpacket):
	if client.is_connected_to_host():
		packetpeer.put_packet(opcpacket)
		var err = packetpeer.get_packet_error()
		if err != 0:
			print(err)
		
func send_pixels():
	# An OPC stream consists of a sequence of messages. 
	# Each message has a 4-byte header followed by a variable-length data block
	# channel(0 to 255) command(0 to 255) length(high byte   low byte)  data
	# TODO Use pool byte array?
	# See http://openpixelcontrol.org/
	
	#warning-ignore:integer_division
	var high_byte = int(len(pixels)*3 / 256)
	var low_byte = (len(pixels)*3) % 256
	
	var pool = PoolByteArray() #Todo init at correct size
		
	pool.append(0) # Channel
	pool.append(0) # Command
	pool.append(high_byte) # Length High Byte
	pool.append(low_byte) # Length Low byte
	
	for pixel in pixels:
		if pixel == null:
			return
		pool.append(int(clamp(int(pixel.x),0,255)))
		pool.append(int(clamp(int(pixel.y),0,255)))
		pool.append(int(clamp(int(pixel.z),0,255)))
	
	_send(pool)
	last_pixels = pixels

func _on_reconnect_pressed():
	drop_connection()
	get_connection(address.text)
