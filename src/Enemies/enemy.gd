extends CharacterBody2D

@export var SPEED : int = 25
@export var hp : int = 6
@export var experience : int = 1

@onready var player = get_tree().get_first_node_in_group('player')
@onready var level = get_tree().get_first_node_in_group('level')

var dying = false

func _ready():
	get_node("AnimationPlayer").play('walk')
	
func _physics_process(_delta):
	if not dying:
		var direction = global_position.direction_to(player.global_position)
		#move_and_slide(direction * SPEED)
		velocity = direction * SPEED
		move_and_slide()
	
		#get_node("AnimationPlayer").play('walk')

func die():
	player.kill_count += 1
	get_node("Hitbox").set_deferred("monitorable", false)
	get_node("Hitbox").set_deferred("monitoring", false)
	get_node("AnimationPlayer").play('die')
	var chance = randi_range(1, 100)
	if chance > 20:
		drop_exp()

func free_enemy():
	queue_free()


func drop_exp():
	var gem_scene = load("res://src/objects/exp_gem.tscn")
	var gem = gem_scene.instantiate()
	gem.global_position = self.global_position
	level.call_deferred("add_child", gem)
	#level.add_child(gem)
	pass
	

func _on_hurtbox_hurt(damage):
	hp -= damage
	if hp <= 0:
		if not dying:
			dying = true
			die()
