extends Area2D


@export_enum("Cooldown", "HitOnce", "DisableHitbox") var hurtboxtype : int = 1

@onready var collision = $CollisionShape2D
@onready var disable_timer = $Timer

signal hurt(damage)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.is_in_group("attack"):
		match hurtboxtype:
			0: # Cooldown
				collision.call_deferred("set", "disabled", true)
				disable_timer.start()
			1: # Cooldown
				pass
			2: #DisableHitbox
				if area.has_method("temp_disabled"):
					area.tempdisabled()
		#var damage_range = area.damage_range
		var damage = randi_range(area.min_damage, area.max_damage)
		hurt.emit(damage)
				


func _on_timer_timeout():
	collision.call_deferred("set", "disabled", false)
	pass # Replace with function body.
