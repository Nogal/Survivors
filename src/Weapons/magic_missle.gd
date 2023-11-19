extends Weapon

@onready var player = get_tree().get_first_node_in_group("player")

@export var min_damage = 1
@export var max_damage = 2
	
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = player.position
	spawn_weapon()
#	spawn_weapon()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(angle)
	global_position += angle * speed * delta
	#level_up(level)
	
func enemy_hit(charge = 1):
	hp -= charge
	if hp >= 0:
		queue_free()

func spawn_weapon():
#	print(get_tree())
	var enemies = get_tree().get_nodes_in_group("enemy")
#	if enemies:
#		target = global_position.distance_to(enemies[0].global_position)
	for enemy in enemies:
		if global_position.distance_to(target) > global_position.distance_to(enemy.global_position):
			target = enemy.global_position
			#print(target)
		#print(global_position.distance_to(enemy.global_position))
	angle = global_position.direction_to(target)
	rotation = angle.angle() + deg_to_rad(135)
	

func _on_despawn_timer_timeout():
	if get_node("VisibleOnScreenNotifier2D").is_on_screen() == false:
		queue_free()



func _on_visible_on_screen_notifier_2d_screen_exited():
	get_node("DespawnTimer").start()
	pass # Replace with function body.
