extends Node
class_name LoadWrapper

signal resource_loaded(resource_or_null: Resource, path: String)

var progress_values: Dictionary = {}

var _current_resource_path: String


func load_resources_async(paths: Array[String]) -> Array[int]:
	return []


func load_resource_async(path: String) -> int:
	_current_resource_path = path
	return ResourceLoader.load_threaded_request(path)


func _process(_delta: float) -> void:
	if not _current_resource_path or _current_resource_path.is_empty():
		return
	
	var progress = []
	var status = ResourceLoader.load_threaded_get_status(_current_resource_path, progress)
	match status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress_values[_current_resource_path] = progress[0] * 100
		ResourceLoader.THREAD_LOAD_LOADED:
			progress_values[_current_resource_path] = 100
			resource_loaded.emit(ResourceLoader.load_threaded_get(_current_resource_path), _current_resource_path)
