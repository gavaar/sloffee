extends Control

@onready var back_button: Button = $safe_area/layout/header/back_button;

var _previous_quit_on_go_back: bool;
var _returning_to_cafe := false;

func _enter_tree() -> void:
	_previous_quit_on_go_back = get_tree().quit_on_go_back;
	get_tree().quit_on_go_back = false;

func _ready() -> void:
	back_button.pressed.connect(_return_to_cafe);

func _exit_tree() -> void:
	get_tree().quit_on_go_back = _previous_quit_on_go_back;

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST and is_node_ready():
		_return_to_cafe();

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled();
		_return_to_cafe();

func _return_to_cafe() -> void:
	if _returning_to_cafe:
		return;
	_returning_to_cafe = true;
	# Defer scene replacement until the button/input notification has finished.
	Game.route_to.call_deferred(Game.Route.Cafe);
