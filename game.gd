extends Node2D

var logged_in: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("logged_value: ", str(logged_in));
	var scene: PackedScene;
	
	if logged_in:
		scene = load("res://scenes/cafe/cafe.tscn");
	else:
		scene = load("res://scenes/login/login.tscn");
	add_child(scene.instantiate());
