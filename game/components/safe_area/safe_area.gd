extends MarginContainer

const PADDING = 16;

func _ready() -> void:
	get_viewport().size_changed.connect(_update_margins);
	_update_margins();

func _update_margins() -> void:
	var viewport_rect := get_viewport().get_visible_rect();
	var safe_rect := viewport_rect;
	if OS.has_feature("android") or OS.has_feature("ios"):
		# Display safe areas use physical pixels; controls use stretched viewport units.
		var display_safe_rect := Rect2(DisplayServer.get_display_safe_area());
		var screen_to_viewport := get_viewport().get_screen_transform().affine_inverse();
		var intersection := viewport_rect.intersection(screen_to_viewport * display_safe_rect);
		if intersection.has_area():
			safe_rect = intersection;

	add_theme_constant_override("margin_left", ceili(safe_rect.position.x - viewport_rect.position.x) + PADDING);
	add_theme_constant_override("margin_top", ceili(safe_rect.position.y - viewport_rect.position.y) + PADDING);
	add_theme_constant_override("margin_right", ceili(viewport_rect.end.x - safe_rect.end.x) + PADDING);
	add_theme_constant_override("margin_bottom", ceili(viewport_rect.end.y - safe_rect.end.y) + PADDING);
