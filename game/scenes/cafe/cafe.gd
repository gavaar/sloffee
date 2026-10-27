extends Node2D

@onready var sweepdoku_button: Button = $ui/safe_area/sweepdoku_button;

func _ready() -> void:
	sweepdoku_button.pressed.connect(_on_sweepdoku_pressed);

func _on_sweepdoku_pressed() -> void:
	Game.route_to(Game.Route.Sweepdoku);
