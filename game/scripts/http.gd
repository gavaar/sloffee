extends Node

const CONVEX_URL = "https://modest-caiman-918.convex.site/";

# callable is a function that takes a dictionary with { headers, body, code }
func request(action: String, body: Dictionary, callback: Callable) -> void:
	var http = HTTPRequest.new();
	add_child(http);

	var headers := ["Content-Type: application/json"];
	if Auth.token != "":
		headers.append("Authorization: Bearer " + Auth.token);

	http.request(
		CONVEX_URL + action,
		headers,
		HTTPClient.METHOD_POST,
		JSON.new().stringify(body),
	);

	http.request_completed.connect(_handle_callback.bind(http, callback));

func _handle_callback(result: int, code: int, headers: PackedStringArray, body: PackedByteArray, http: HTTPRequest, callback: Callable) -> void:
	http.queue_free();
	Callable(callback).call({ "code": code, "body": JSON.new().parse_string(body.get_string_from_utf8()), "headers": headers });
