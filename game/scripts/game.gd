extends Node2D

enum Route {
	Login,
	Signup,
	Cafe,
}

const ROUTES = {
	login = "res://game/scenes/auth/login/login.tscn",
	signup = "res://game/scenes/auth/signup/signup.tscn",
	cafe = "res://game/scenes/cafe/cafe.tscn",
};

func route_to(route: Route) -> void:
	match route:
		Route.Login:
			get_tree().change_scene_to_file(ROUTES.login);
		Route.Signup:
			get_tree().change_scene_to_file(ROUTES.signup);
		Route.Cafe:
			get_tree().change_scene_to_file(ROUTES.cafe);

func _ready() -> void:
	Auth.valid_token.connect(_on_token_validity);

func _on_token_validity(valid: bool) -> void:
	if valid:
		route_to(Route.Cafe);
	elif get_tree().current_scene.name != "signup":
		route_to(Route.Login);
