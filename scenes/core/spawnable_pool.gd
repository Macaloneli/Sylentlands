class_name SpawnablePool
extends LoggableNode
## Holds references to various dynamic scenes for later spawning.

signal init_load_finished

@export_file("*.tscn") var spawnable_paths: Array[String]

var load_progress: float = 0.0

var _cached_spawnables: Array[Node] = []
var _current_active: Array[Node] = []


func init_load() -> void:
	for item in spawnable_paths:
		var error = GlobalEntryPoint.scene_manager.load_resource_async(item)
		if error != OK:
			log_stream.error("Failed to load spawnable item %s! Error: %s" % [item, error_string(error)])
			continue


func _process(_delta: float) -> void:
	if len(GlobalEntryPoint.load_wrapper.progress_values) == 0:
		return
	
	for item in GlobalEntryPoint.load_wrapper.progress_values:
		load_progress = GlobalEntryPoint.load_wrapper.progress_values[item] / (len(GlobalEntryPoint.load_wrapper.progress_values) * 100) * 100
