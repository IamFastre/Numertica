class_name Blueprint extends Control

@export var color:Color = Color("5ba7ff")
@export var background_color:Color = Color("1852a9")

@export_subgroup("Grid")
@export var grid_cell_dimention:float = 30
@export var grid_cell_padding:int = 5
@export var grid_line_width:float = 1

@export_subgroup("Ruler")
@export var ruler_dash_length:int = 10
@export var ruler_unit_length:float = grid_cell_dimention / 4
@export var ruler_big_unit_repetition:int = 4
@export var ruler_line_width:float = 1
