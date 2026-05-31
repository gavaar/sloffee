extends Node

@onready var username_input: LineEdit = $username_input;
@onready var password_input: LineEdit = $password_input;
@onready var login_button: Button = $login_button;
@onready var signup_button: Button = $sign_up_button;
@onready var error_label: Label = $error_label;

func _ready() -> void:
	login_button.pressed.connect(_on_login_pressed);

func _on_login_pressed() -> void:
	var username = username_input.text.strip_edges();
	var password = password_input.text.strip_edges();
	
	if username == "" || password == "":
		_display_error("username and password are required")
		return;
	
	login_button.disabled = true;
	signup_button.disabled = true;
	
	Http.request("login", { "username": username, "password": password }, _on_logged_in);


func _on_logged_in(res: Dictionary) -> void:
	var body = res.body;
	var code = res.code;

	login_button.disabled = false;
	signup_button.disabled = false;

	if code != 200:
		_display_error(body.error);
		return;

	Auth.set_token(body.token);
	
func _display_error(error: String) -> void:
	var timer = Timer.new();
	timer.wait_time = 5;
	timer.one_shot = true;
	
	add_child(timer);
	error_label.visible = true;
	error_label.text = error;

	timer.start();
	timer.connect("timeout", func ():
		timer.queue_free();
		error_label.text = "";
		error_label.visible = false;
	);
