extends Node3D

# set collision mask world & props (not ball)

@onready var player = $Game/Player

var current_level = null

func _ready():
	#current_level = load("res://level_1.tscn")
	var level1_scene = load("res://level_1.tscn")
	if (level1_scene != null):
		current_level = level1_scene.instantiate()
	if (current_level == null):
		get_tree().quit()
	current_level.connect("my_signal", _on_my_signal)
	add_child(current_level)
	print("Main is ready !")

func _input(event):
	if (event is InputEventMouseButton) and (event.button_index == MOUSE_BUTTON_LEFT) and (not event.pressed):
		print("Clic gauche souris terminé")
		select_object(get_viewport().get_mouse_position(), player.camera)
		

func _on_button_quit_pressed():
	get_tree().quit()

func _on_my_signal(param:int):
	print("Signal emitted with value : %d" % param)

func select_object(mouse_pos:Vector2, camera:Camera3D):
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = camera.project_ray_origin(mouse_pos)
	ray_query.to = ray_query.from + camera.project_ray_normal(mouse_pos) * 1000
	var iray = get_world_3d().direct_space_state.intersect_ray(ray_query)
	if (iray.size() > 0):
		print(iray.collider)
		print(iray.collider.get_path())
