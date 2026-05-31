extends Node2D

const ROUTES = {
	login = "res://game/scenes/login/login.tscn",
	cafe = "res://game/scenes/cafe/cafe.tscn",
};

func _ready() -> void:
	Auth.valid_token.connect(_on_token_validity);

func _on_token_validity(valid: bool) -> void:
	if valid:
		get_tree().change_scene_to_file(ROUTES.cafe);
	else:
		get_tree().change_scene_to_file(ROUTES.login);
