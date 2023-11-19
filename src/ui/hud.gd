extends CanvasLayer


var seconds = 0
var minutes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func set_current_experience(experience):
	get_node("ExpProgressBar").value = experience


func set_minmax_experience(min, max):
	get_node("ExpProgressBar").min_value = min
	get_node("ExpProgressBar").max_value = max


func _on_level_time_timer_timeout():
	seconds += 1
	if seconds >= 60:
		seconds = 0
		minutes += 1
	get_node("TimeDisplay").text = "%02d:%02d" % [minutes, seconds]


func _on_set_level(level):
	get_node("Level").text = "Level: %s" % level
	


func _on_set_hp(hp):
	get_node("HealthPoints").value = hp
	pass # Replace with function body.


func _on_set_max_hp(max_hp):
	get_node("HealthPoints").max_value = max_hp
	pass # Replace with function body.


func _on_set_kill_count(kill_count):
	get_node("KillCount").text = "%d: Kills" % kill_count
	pass # Replace with function body.
