class_name SloffErrorBanner extends Label

var timer_running = false;

func set_error(message: String) -> SloffErrorBanner:
	self.visible = message != "";
	self.text = message;
	return self;

func set_timer(time: int):
	if !self.visible || self.timer_running:
		return;
	
	self.timer_running = true;
	
	var timer = Timer.new();
	timer.wait_time = time;
	timer.one_shot = true;
	add_child(timer);

	timer.start();
	timer.connect("timeout", func():
		timer.queue_free();
		self.set_error("");
		self.timer_running = false;
	);
