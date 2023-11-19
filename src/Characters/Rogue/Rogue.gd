extends CharacterBody2D

const SPEED = 150
@onready var _animation_player = $AnimationPlayer

var starting_weapon = 'magic_missle'

var hp = 10
var max_hp = 10
var facing = "down"
var level = 1
var experience = 0
var next_level = 5
var kill_count = 0

signal set_current_experience
signal set_minmax_experience
signal set_level
signal set_hp
signal set_max_hp
signal set_kill_count

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Inventory/Attack_1/Attack1Timer").start()
	set_hp.emit(hp)
	set_max_hp.emit(max_hp)
	pass # Replace with function body.

func level_up():
	var min = next_level
	next_level = (next_level * 2) + round(next_level * 0.1)
	
	max_hp += max_hp * 0.1
	hp = hp + (max_hp * 0.1)
	level += 1
	
	set_minmax_experience.emit(min, next_level)
	set_level.emit(level)
	set_max_hp.emit(max_hp)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_current_experience.emit(experience)
	set_kill_count.emit(kill_count)
	if experience >= next_level:
		level_up()
		
	velocity = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down") * SPEED
	if velocity.x > 0:
		facing = 'right'
	if velocity.x < 0:
		facing = 'left'
	
	if velocity.y < 0:
		facing = 'up'
	if velocity.y > 0:
		facing = 'down'
		
	if velocity == Vector2.ZERO:
		_animation_player.play("idle_%s" % facing)
	else:
		_animation_player.play("walk_%s" % facing)

	move_and_slide()
	#print(velocity)

func die():
	SceneManager.change_scene("res://src/menu/main_menu.tscn")

func _on_hurtbox_hurt(damage):
	hp -= damage
	set_hp.emit(hp)
	if hp <= 0:
		die()

	
