extends Node

var items

#takes the returned file content and stores it as a key item property(dictionary)
func _ready():
	items = read_from_json("res://Assets/JSON/items.json")
	for key in items.keys():
		items[key]["key"] = key
	
		
#retrieves the content of the file so that it can be returned as values in items variable		
func read_from_json(path):
	var file = File.new()
	if file.file_exists(path):
		file.open(path, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		return data
	else:
		printerr("Invalid path given")

#This function takes an item’s key as its parameter, then return a unique copy of the item if it exists.		
func get_item_by_key(key):
	if items and items.has(key):
		return items[key].duplicate(true)

		

