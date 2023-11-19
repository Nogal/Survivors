extends Node2D

var inventory = []

@onready var level = get_tree().get_first_node_in_group('level')

func _ready():
	inventory.append(get_tree().get_first_node_in_group('player').starting_weapon)
	new_weapon(inventory[0])

func new_weapon(weapon):
	var weapon_scene = load("res://src/Weapons/%s.tscn" % weapon)
	return weapon_scene.instantiate()
	
func _on_attack_timer_timeout(timer):
	var weapon = new_weapon(inventory[timer])
	level.add_child(weapon)
	get_node("Attack_%s/Attack%sTimer" % [timer +1, timer +1]).start()

