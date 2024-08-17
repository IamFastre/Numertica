extends Button

@export var custom_parent:Node2D

var parent:Node2D = custom_parent
var is_dragging:bool = false
var drag_offset = Vector2()

func _ready() -> void:
	if not parent:
		parent = get_parent()

func _process(_delta:float) -> void:
	if is_dragging:
		parent.position = get_global_mouse_position() - drag_offset

func _on_button_down() -> void:
	is_dragging = true
	drag_offset = get_global_mouse_position() - parent.global_position


func _on_button_up() -> void:
	is_dragging = false
