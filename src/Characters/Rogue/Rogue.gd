extends CharacterBody2D

const SPEED = 150
@onready var _animation_player = $AnimationPlayer

var starting_weapon = 'magic_missle'

var hp = 80
var facing = "down"
var exp = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Inventory/Attack_1/Attack1Timer").start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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

func get_input():
	var velocity = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")
	


func _on_hurtbox_hurt(damage):
	hp -= damage
	print(hp)
	
