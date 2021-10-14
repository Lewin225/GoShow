extends GraphNode

var input_nodes = []
var output_nodes = []

func _ready():
	input_nodes.resize(get_connection_input_count())
	output_nodes.resize(get_connection_output_count())
	
func _process(delta):
	if input_nodes[0] != null:
		$r.value = input_nodes[0].value
	if input_nodes[1] != null:
		$g.value = input_nodes[1].value
	if input_nodes[2] != null:
		$b.value = input_nodes[2].value
		
	$funny/image.modulate.r = $r.value
	$funny/image.modulate.g = $g.value
	$funny/image.modulate.b = $b.value
	
