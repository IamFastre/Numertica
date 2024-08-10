extends Control

@export var parent:Blueprint

func _draw():
	for i in get_children() as Array[ColorRect]:
		i.color = parent.color
