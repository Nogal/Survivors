extends Node2D

@export var spawns : Array[SpawnInfo] = []
@onready var player = get_tree().get_first_node_in_group('player')

var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_timer_timeout():
	time += 1
	var enemy_spanwns = spawns
	for spawn in enemy_spanwns:
		if time >= spawn.time_start and time <= spawn.time_end:
			if spawn.spawn_delay_counter < spawn.enemy_spawn_delay:
				spawn.spawn_delay_counter += 1
			else:
				spawn.spawn_delay_counter = 0
				#var new_enemy = load(str(spawn.enemy.resource_path))
				var new_enemy = spawn.enemy
				var counter = 0
				while counter < spawn.enemy_num:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					counter += 1
					
					
func get_random_position():
	var viewport_rect = get_viewport_rect().size * randf_range(1.7, 2.3)
	var top_left = Vector2(player.global_position.x - viewport_rect.x / 2, player.global_position.y - viewport_rect.y / 2)
	var top_right = Vector2(player.global_position.x + viewport_rect.x / 2, player.global_position.y - viewport_rect.y / 2)
	var bottom_left = Vector2(player.global_position.x - viewport_rect.x / 2, player.global_position.y + viewport_rect.y / 2)
	var bottom_right = Vector2(player.global_position.x + viewport_rect.x / 2, player.global_position.y + viewport_rect.y / 2)
	
	var pos_side = ['up', 'down', 'left', 'right'].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		'up':
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		'down':
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		'left':
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
		'right':
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
			
	var spawn_pos = Vector2.ZERO
	spawn_pos = Vector2(
		randf_range(spawn_pos1.x, spawn_pos2.x),
		randf_range(spawn_pos1.y, spawn_pos2.y)
	)
	
	return spawn_pos
	
