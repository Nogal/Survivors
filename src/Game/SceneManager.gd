extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_scene(scene_path):
	get_node("AnimationPlayer").play('dissolve')
	await get_node("AnimationPlayer").animation_finished
	MusicManager.change_song(MusicManager.pick_random_song())
	get_tree().change_scene_to_file(scene_path)
	get_node("AnimationPlayer").play_backwards('dissolve')
