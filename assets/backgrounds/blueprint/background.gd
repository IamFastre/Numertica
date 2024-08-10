class_name BlueprintBackgroud extends ColorRect

@export var parent:Blueprint

func _ready():
	color = parent.background_color

func _draw():
	color = parent.background_color
