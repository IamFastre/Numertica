class_name BlueprintCentralGrid extends Control

@export var parent:Blueprint

func _draw() -> void:
	var dim:float = parent.grid_cell_dimention
	var padding:int = parent.grid_cell_padding
	var line_width:float = parent.grid_line_width
	var line_color:Color = parent.color

	var screensize = get_viewport().get_visible_rect().size

	var x_count = floor(screensize.x / dim) - padding
	var y_count = floor(screensize.y / dim) - padding

	var width = x_count * dim
	var height = y_count * dim

	var new_position = Vector2((screensize.x - width) / 2, (screensize.y - height) / 2)
	set_position(new_position)

	for x in range(x_count + 1):
		var start  = Vector2(x * dim, 0)
		var finish = Vector2(x * dim, height)
		draw_line(start, finish, line_color, line_width)

	for y in range(y_count + 1):
		var start  = Vector2(0, y * dim)
		var finish = Vector2(width, y * dim)
		draw_line(start, finish, line_color, line_width)
