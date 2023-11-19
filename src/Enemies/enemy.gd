extends CharacterBody2D

@export var SPEED : int = 25
@export var hp : int = 10
@export var exp : int = 1

@onready var player = get_tree().get_first_node_in_group('player')
@onready var level = get_tree().get_first_node_in_group('level')

func _ready():
	get_node("AnimationPlayer").play('walk')
	
func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	#move_and_slide(direction * SPEED)
	velocity = direction * SPEED
	move_and_slide()
	pass
	#get_node("AnimationPlayer").play('walk')

func die():
	var chance = randi_range(1, 100)
	if chance > 20:
		drop_exp()
	queue_free()

func drop_exp():
	var gem_scene = load("res://src/objects/exp_gem.tscn")
	var gem = gem_scene.instantiate()
	gem.global_position = self.global_position
	level.add_child(gem)
	pass
	

func _on_hurtbox_hurt(damage):
	hp -= damage
	if hp >= 0:
		die()
