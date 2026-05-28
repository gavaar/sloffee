extends AnimatedSprite2D

func _ready() -> void:
	connect("animation_finished", select_new_animation);
	
func select_new_animation() -> void:
	var rng = randf();

	if rng >= 0.8:
		self.play("deep_breath");
	else:
		self.play("idle");
