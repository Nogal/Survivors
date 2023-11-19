extends AudioStreamPlayer2D

var song : int

var song_list = [
	"res://assets/music/Chiptune Techno.wav",
	"res://assets/music/Of Far Different Nature - Another Step Back [v2] (CC-BY 4.0).ogg",
	"res://assets/music/Of Far Different Nature - Liquid Flame [v2] (CC-BY 4.0).ogg",
	"res://assets/music/Of Far Different Nature - Oldskool [v2] (CC-BY 4.0).ogg"
]

func _get_song(requested):
	return load(song_list[requested])

func pick_random_song():
	song = randi_range(0, 3)
	return song

func queue_song(requested):
	song = requested
	return song

func change_song(requested):
	self.stream = _get_song(requested)
	self.play()

func _on_finished():
	self.play()
	pass # Replace with function body.
