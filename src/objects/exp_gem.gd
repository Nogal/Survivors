extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")

var speed = 100
var exp = 1
var following = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if following == true:
		follow_player(delta)
	pass


func follow_player(delta):
	var target = player.global_position
	var angle = global_position.direction_to(target)
	global_position += angle * speed * delta


func _on_area_entered(area):
	print(area)
	if area.is_in_group('suction'):
		following = true
	if area.is_in_group('collection'):
		player.exp += exp
		queue_free()
