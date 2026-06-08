class_name SolffInput extends LineEdit

const COLOR_RED = "#e9381e";

@onready var info_label: Label = $info_label;

func _ready() -> void:
	self.text_changed.connect(_on_write_text);

func _on_write_text(_text: String):
	if info_label.visible:
		self.set_error("");

func set_info(info: String):
	info_label.text = info;
	info_label.visible = info != "";

func set_error(error: String):
	info_label.text = error;
	info_label.visible = error != "";

	if info_label.visible:
		var input_error_style_override = self.get_theme_stylebox("normal").duplicate();
		input_error_style_override.border_color = COLOR_RED;
		info_label.add_theme_color_override("font_color", COLOR_RED);
		self.add_theme_color_override("font_placeholder_color", COLOR_RED);
		self.add_theme_stylebox_override("normal", input_error_style_override);
	else:
		info_label.remove_theme_color_override("font_color");
		self.remove_theme_color_override("font_placeholder_color");
		self.remove_theme_stylebox_override("normal");	
