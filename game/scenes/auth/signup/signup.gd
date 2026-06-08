extends Node2D

@onready var password_input = $password_input;
@onready var confirm_password_input = $confirm_password_input;
@onready var email_input = $email_input;
@onready var username_input: SolffInput = $username_input;
@onready var username_input_loading = $username_input/loading;
@onready var create_button = $create_button;
@onready var error_banner = $error_banner;
@onready var back_button = $back_button;

var throttler: Timer;
var username_valid = false;

func _ready() -> void:
	username_input.text_changed.connect(_check_for_username);
	email_input.text_changed.connect(_check_all_fields_are_valid);
	password_input.text_changed.connect(_check_all_fields_are_valid);
	confirm_password_input.text_changed.connect(_check_all_fields_are_valid);
	create_button.pressed.connect(_submit_signup);
	back_button.pressed.connect(func ():
		Game.route_to(Game.Route.Login);
	);

func _check_for_username(text: String) -> void:
	username_valid = false;
	username_input_loading.visible = true;

	if throttler:
		throttler.stop();
		throttler.queue_free();

	if text == "":
		username_input_loading.visible = false;
		return;
		
	throttler = Timer.new();
	throttler.one_shot = true;
	throttler.wait_time = 1.5;

	add_child(throttler);
	throttler.start();

	throttler.timeout.connect(func ():
		throttler.queue_free();
		_check_username_validity();
	)

func _check_username_validity() -> void:
	Http.request(
		"auth/verify-username",
		{ "username": username_input.text },
		_username_valid,
	);

func _username_valid(res) -> void:
	var code = res.code;
	var body = res.body;

	if code == 200:
		username_valid = true;
		username_input.set_info("username is available!");
		password_input.editable = true;
		confirm_password_input.editable = true;
		email_input.editable = true;
	else:
		username_valid = false;
		username_input.set_error(body.error);
		
	username_input_loading.visible = false;

func _check_all_fields_are_valid(_t: String) -> void:
	var email_valid = email_input.text != "";
	var password_valid = password_input.text != "";
	var confirm_password_valid = confirm_password_input.text != "";

	var all_inputs_validated = username_valid && email_valid && password_valid && confirm_password_valid;
	create_button.disabled = !all_inputs_validated;

func _submit_signup() -> void:
	var username = username_input.text;
	var password = password_input.text;
	var confirm_pass = confirm_password_input.text;
	var email = email_input.text;
	
	if password != confirm_pass:
		confirm_password_input.set_error("las contraseñas deben coincidir");
		return;
	
	create_button.disabled = true;
	Http.request("auth/signup",
		{ "username": username, "password": password, "confirmPassword": confirm_pass, "email": email },
		_signup_response,
	);

func _signup_response(res) -> void:
	var body = res.body;
	var code = res.code;
	
	if code > 300:
		error_banner.set_error(body.error);
		error_banner.set_timer(4);
		create_button.disabled = false;
		return;

	Auth.set_token(body.token);
