@tool
class_name CardNode extends Area2D

const TYPEICONS_PATH = "res://assets/cards/types/%s.png"

@export var resource:Card = Card.new()

@onready var name_node:Label = $Sprite/CardName
@onready var frame:TextureRect = $Sprite/Frame
@onready var bulk:TextureRect = $Sprite/Bulk
@onready var bottom_band:TextureRect = $Sprite/BottomBand

@onready var foreground_art:TextureRect = $Sprite/Art/Foreground
@onready var background_art:TextureRect = $Sprite/Art/Background

@onready var type_icon:TextureRect = $Sprite/Borders/Type
@onready var cost_icon:TextureRect = $Sprite/Borders/Cost

@onready var band:TextureRect = $Sprite/Band
@onready var parameters_brackets:Label = $Sprite/Band/Brackets
@onready var parameters_label:Label = $Sprite/Band/Parameters

var is_dragging:bool :
	get:
		return $DraggableComponent.is_dragging

var default_scale = scale

# ========================================================================== #

func _process(_delta:float) -> void:
	configure()

# ========================================================================== #

func _on_drag_start() -> void:
	z_index = 1

func _on_dragging(delta:float) -> void:
	rotation = lerp(rotation, 0.0, delta * 5)
	scale = lerp(scale, default_scale * 1.3, delta * 5)

func _on_drag_end() -> void:
	z_index = 0

# ========================================================================== #

func configure() -> void:
	name_node.text = resource.name
	frame.self_modulate = resource.style.frame_color
	bulk.self_modulate = resource.style.bulk_color

	foreground_art.texture = resource.foreground_texture
	background_art.texture = resource.background_texture

	type_icon.texture = load(TYPEICONS_PATH % Card.Icon.keys()[resource.type])
	cost_icon.self_modulate = Card.COST_COLOR[resource.cost]

	if resource.parameters.size() > 0:
		band.visible = true
		bottom_band.visible = true
		band.self_modulate = resource.style.frame_color
		bottom_band.self_modulate = resource.style.frame_color
		parameters_brackets.self_modulate = Card.ICON_COLOR[resource.type]
		parameters_label.text = ', '.join(resource.parameters.map(func(param): return param.get('name')))
		parameters_label.self_modulate = resource.style.accent_color
	else:
		band.visible = false
		bottom_band.visible = false
