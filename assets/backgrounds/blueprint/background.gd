class_name BlueprintBackgroud extends ColorRect

@export var parent:Blueprint

func _ready() -> void:
	color = parent.background_color

func _draw() -> void:
	color = parent.background_color
