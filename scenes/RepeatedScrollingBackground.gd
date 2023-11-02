extends TextureRect

@export var scroll_speed: float = 1.0;
@export var tile_size: int = 0;
var current_rotation: float = rotation;
var start_position: Vector2 = position;
var offset: Vector2 = Vector2.ZERO;

func _ready():
	scroll_speed *= 50;

func _process(delta):
	offset += Vector2(scroll_speed, 0).rotated(current_rotation) * delta;
	if offset.length_squared() >= pow(tile_size, 2):
		offset = Vector2.ZERO;
	position = start_position + offset;
	
