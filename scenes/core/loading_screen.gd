extends Control
class_name LoadingScreen

@onready var progress_bar: ProgressBar = get_node_or_null("ProgressBar")


func _process(delta: float) -> void:
	progress_bar.value = move_toward(progress_bar.value, GlobalEntryPoint.spawnable_pool.load_progress, delta * 20)
