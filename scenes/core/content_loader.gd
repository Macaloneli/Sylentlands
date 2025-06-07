class_name ContentLoader
extends Node
## Loads mods and other .pck bundles and verifies their format

const CONTENT_FOLDER: String = "./content/"
const BASE_GAME_FOLDER: String = "./content/base_game"


func _ready() -> void:
	if OS.has_feature("editor"):
		return # External content loading in the editor is unnecessary
	
	# TODO: Load and cache resources belonging to registration systems
