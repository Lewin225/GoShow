extends Tree

var plugin_path = "res://Node Plugins"

func _ready():
	print(plugin_path)
	var root = self.create_item()
	root.set_text(0, "Nodes")
	
	var internal = self.create_item(root)
	internal.set_text(0, "Included")
	
	var external = self.create_item(root)
	external.set_text(0, "Plugins")
	
	self.set_hide_root(false)
	
	for plugin in get_installed_node_plugins(plugin_path):
		var item = self.create_item(external)
		item.set_text(0, plugin.capitalize())
	
func get_installed_node_plugins(path) -> Array:
  var files := [] # accumulated png paths to return
  var dir_queue := [path] # directories remaining to be traversed
  var dir: Directory # current directory being traversed

  var file: String # current file being examined
  while file or not dir_queue.empty():
    # continue looping until there are no files or directories left
    if file:
      # there is another file in this directory
      if dir.current_is_dir():
        # found a directory, append it to the queue.
        dir_queue.append("%s/%s" % [dir.get_current_dir(), file])
      elif file.ends_with(".tscn"):
        # found a .png.import file, append its corresponding png to our results
        files.append("%s/%s" % [dir.get_current_dir(), file.get_basename()])
    else:
      # there are no more files in this directory
      if dir:
        # close the current directory
        dir.list_dir_end()

      if dir_queue.empty():
        # there are no more directories. terminate the loop
        break

      # there are more directories. open the next directory
      dir = Directory.new()
      dir.open(dir_queue.pop_front())
      dir.list_dir_begin(true, true)
    file = dir.get_next()

  return files
	
