class_name HealthComponent extends Node

const DEFAULT_MAX_POINTS := 100


signal on_health_changed()
signal on_max_health_changed()

@export var max_points:int = DEFAULT_MAX_POINTS :
	get:
		return max_points
	set(value):
		if value > 0:
			max_points = value
		else:
			printerr("Cannot set max health points below 0.")
		on_max_health_changed.emit()

@export var points:int = max_points :
	get:
		return points
	set(value):
		points = clampi(value, 0, max_points)
		on_health_changed.emit()

var is_alive:bool :
	get:
		return points > 0
	set(value):
		points = points if value else 0

# ========================================================================== #

func damage(amount:int):
	points -= amount

func heal(amount:int):
	points += amount

func kill():
	points = 0

func reanimate():
	points = max_points

# ========================================================================== #

func _ready() -> void:
	reanimate()
