extends Control

enum DTYPE{Float, Boolean, Vec3, Vec3Array} 
export(DTYPE) var InType
export(DTYPE) var OutType
export(bool) var HasInPort
export(bool) var HasOutPort
export(String, MULTILINE) var HelpText
export(bool) var PrintPortStats

var InPortConnection = null
var OutPortConnection = null

var InPort # Node connected to the inport
var OutPort # Node connected to the outport
var InValue # Node connected to the inport will set this when it updates, check physics process below
var OutValue # Output value of this node, Update it please to do shit

func _ready():
	self.hint_tooltip = HelpText
#	if OutType == DTYPE.Float:
#		OutValue = 0.0
#	if OutType == DTYPE.Boolean:
#		OutValue = false
#	if OutType == DTYPE.Vec3:
#		OutValue = Vector3.ZERO
#	if OutType == DTYPE.Vec3Array:
#		OutValue = []
var i = 0

func _physics_process(delta):
	if InPort != null:
		self.InValue = InPort.OutValue
	
	i = i+1
		
	if PrintPortStats and i > 144:
		i = 0
		var inportname = "Disconnected"
		if InPort != null:
			inportname = InPort.name
			
		var outportname = "Disconnected"
		if OutPort != null:
			outportname = OutPort.name
		print("Port:", self.name, "::: inport is [", inportname, "] Outport is [",outportname, "] Outvalue is - ", OutValue) 

	
# Could add listeners here
func set_inport_connection(BaseNodeShowComponent):
	assert(BaseNodeShowComponent.has_method("_j0vfg5943wukfug54893qw0"))
	print("Connected", BaseNodeShowComponent, "to", self)
	InPort = BaseNodeShowComponent
	InValue = InPort.OutValue
	return true
	
func set_outport_connection(BaseNodeShowComponent):
	assert(BaseNodeShowComponent.has_method("_j0vfg5943wukfug54893qw0"))
	OutPort = BaseNodeShowComponent
	return OutPort != null
	
func disconnect_inport():
	InPort = null
	InValue = null
	return true
	
func disconnect_outport():
	OutPort = null
	OutValue = null
	return true






# This is used to check that the node
# has this script attached via (has function)
# Don't remove it 
func _j0vfg5943wukfug54893qw0():
	return true
