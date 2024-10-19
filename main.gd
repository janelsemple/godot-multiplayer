extends Node2D

@onready var player = $Player

func _ready():
	# Ensure the player is above the landscape and decorations in drawing order
	player.z_index = 10
	

#func _process(delta):
	## Add your game logic here
	#pass
