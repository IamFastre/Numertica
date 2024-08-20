class_name DraggableComponent extends Button

@export var custom_parent:Node2D

signal on_drag_start()
signal on_dragging(delta:float)
signal on_drag_end()

var parent:Node2D = custom_parent
var is_dragging:bool = false
var drag_offset:Vector2 = Vector2(0, 0)

func _ready() -> void:
	if not parent:
		parent = get_parent()

func _process(delta:float) -> void:
	if is_dragging:
		parent.global_position = get_global_mouse_position() - drag_offset
		on_dragging.emit(delta)

func _on_button_down() -> void:
	is_dragging = true
	drag_offset = get_global_mouse_position() - parent.global_position
	on_drag_start.emit()

func _on_button_up() -> void:
	is_dragging = false
	on_drag_end.emit()
