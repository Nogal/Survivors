extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.change_song(MusicManager.pick_random_song())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	SceneManager.change_scene("res://src/Levels/wraithwood_forest.tscn")
	pass # Replace with function body.
