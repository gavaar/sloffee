extends Node

@onready var username_input: SolffInput = $username_input;
@onready var password_input: SolffInput = $password_input;
@onready var login_button: Button = $login_button;
@onready var signup_link: LinkButton = $sign_up_link;
@onready var error_banner: SloffErrorBanner = $error_banner;

const ERRORS = {
	required = "usario y contraseña son requeridos"
};

func _ready() -> void:
	signup_link.pressed.connect(_on_signup_pressed);
	login_button.pressed.connect(_on_login_pressed);

func _on_signup_pressed() -> void:
	Game.route_to(Game.Route.Signup);

func _on_login_pressed() -> void:
	var username = username_input.text.strip_edges();
	var password = password_input.text.strip_edges();
	
	if username == "":
		username_input.set_error("El campo usuario es requerido");
	if password == "":
		password_input.set_error("La contraseña es requerida");

	if username == "" || password == "":
		return;

	login_button.disabled = true;
	signup_link.disabled = true;
	
	Http.request("auth/login", { "username": username, "password": password }, _on_logged_in);


func _on_logged_in(res: Dictionary) -> void:
	var body = res.body;
	var code = res.code;

	login_button.disabled = false;
	signup_link.disabled = false;

	if code != 200:
		error_banner.set_error(body.error);
		error_banner.set_timer(4);
		return;

	Auth.set_token(body.token);
