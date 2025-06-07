extends LoggableNode
# Autoload global_entry_point.tscn

@export_file("*.tscn") var loading_screen_path: String 

var loading_screen: LoadingScreen
var load_wrapper: LoadWrapper
var spawnable_pool: SpawnablePool
var content_loader: ContentLoader


func _ready() -> void:
	log_stream.info("Entry point start! Loading core bindings. . .")
	_load_core_bindings()
	log_stream.info("Core bindings loaded! Loading asynchronous content. . .")
	spawnable_pool.init_load()


func _load_core_bindings():
	load_wrapper = LoadWrapper.new()
	add_child(load_wrapper)
	loading_screen = (ResourceLoader.load(loading_screen_path) as PackedScene).instantiate()
	add_child(loading_screen)
	spawnable_pool = SpawnablePool.new()
	add_child(spawnable_pool)
	content_loader = ContentLoader.new()
	add_child(content_loader)
