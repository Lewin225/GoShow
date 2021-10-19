extends GraphEdit



func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	var f = get_node(from).get_portnode_for_slot(from_slot)
	var t = get_node(to).get_portnode_for_slot(to_slot)
	
	if f.set_outport_connection(t) and t.set_inport_connection(f):
		# This is just the visual for the line, Above connects the nodes
		connect_node(from, from_slot, to, to_slot)#
	else:
		assert(false)
		# Graphport connection failed, Why?
		
	


func _on_GraphEdit_disconnection_request(from, from_slot, to, to_slot):
	var f = get_node(from).get_portnode_for_slot(from_slot)
	var t = get_node(to).get_portnode_for_slot(to_slot)
	
	if f.disconnect_outport() and t.disconnect_inport():
		# This is just the visual for the line, Above disconnects the nodes
		disconnect_node(from, from_slot, to, to_slot)
	else:
		print("Opsee theres been a fuky wukky")
	
