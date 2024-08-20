class_name BlueprintRulers extends Control

@export var parent:Blueprint

func _draw() -> void:
	var unit_length:float = parent.ruler_unit_length
	var big_unit_repetition:int = parent.ruler_big_unit_repetition
	var dash_length:int = parent.ruler_dash_length
	var line_width:float = parent.ruler_line_width
	var line_color:Color = parent.color

	var screensize = get_viewport().get_visible_rect().size

	var y_count = round((floor(screensize.y / unit_length)) / 10) * 10
	var height = y_count * unit_length
	var y_padding = (screensize.y/2 - height/2)

	# =============================== Verticals =============================== #

	# Left side
	for l in range(y_count + 1):
		var y_level = l * unit_length + y_padding
		var start  = Vector2(0, y_level)
		var finish = Vector2(dash_length * 2 if l % big_unit_repetition == 0 else dash_length, y_level)
		draw_line(start, finish, line_color, line_width, true)

	# Right side
	for r in range(y_count + 1):
		var y_level = r * unit_length + y_padding
		var start  = Vector2(screensize.x, y_level)
		var finish = Vector2(screensize.x - (dash_length * 2 if r % big_unit_repetition == 0 else dash_length), y_level)
		draw_line(start, finish, line_color, line_width, true)

	# ============================== Horizontals ============================== #

	var x_count = round((floor(screensize.x / unit_length)) / 10) * 10
	var width = x_count * unit_length
	var x_padding = (screensize.x/2 - width/2)

	# Top side
	for t in range(x_count + 1):
		var x_level = t * unit_length + x_padding
		var start  = Vector2(x_level, 0)
		var finish = Vector2(x_level, dash_length * 2 if t % big_unit_repetition == 0 else dash_length)
		draw_line(start, finish, line_color, line_width, true)

	# Bottom side
	for b in range(x_count + 1):
		var x_level = b * unit_length + x_padding
		var start  = Vector2(x_level, screensize.y)
		var finish = Vector2(x_level, screensize.y - (dash_length * 2 if b % big_unit_repetition == 0 else dash_length))
		draw_line(start, finish, line_color, line_width, true)
