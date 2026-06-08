extends Node

const TOKEN_FILE = "user://sloffee_token.save";
var token: String = "";

signal valid_token(bool);

func _ready() -> void:
	token = get_token();
	if token: _verify_token();

func _verify_token() -> void:
	Http.request("auth/verify", { "token": token }, _on_token_verified);
	
func _on_token_verified(res: Dictionary) -> void:
	var valid = res.body.valid;
	if !valid:
		token = "";

	valid_token.emit(valid);

func set_token(new_token: String) -> void:
	var file = FileAccess.open(TOKEN_FILE, FileAccess.WRITE);
	file.store_string(new_token);
	self.token = new_token;
	valid_token.emit(true);

func get_token() -> String:
	if FileAccess.file_exists(TOKEN_FILE):
		var file = FileAccess.open(TOKEN_FILE, FileAccess.READ);
		return file.get_as_text();
	return "";
