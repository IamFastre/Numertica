@tool
class_name CardNode extends Area2D

const TYPEICONS_PATH = "res://assets/cards/types/%s.png"

@export var card_name:String = "Card"
@export var cost:int = 0
@export var card_icon:Card.Icon = Card.Icon.arithmetic
@export var card_type:Card.Type = Card.Type.effect
@export var foreground_texture:Texture2D = preload("res://assets/cards/foregrounds/hash.png")
@export var background_texture:Texture2D = preload("res://assets/cards/backgrounds/dot_grid.png")
@export var card_style:CardStyle = CardStyle.new()
@export var parameters:Array[CardParameter]


@onready var name_node:Label = $Sprite/CardName
@onready var frame:TextureRect = $Sprite/Frame
@onready var bulk:TextureRect = $Sprite/Bulk

@onready var foreground_art:TextureRect = $Sprite/Art/Foreground
@onready var background_art:TextureRect = $Sprite/Art/Background

@onready var type_icon:TextureRect = $Sprite/Corners/Type
@onready var cost_icon:TextureRect = $Sprite/Corners/Cost

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
	name_node.text = card_name
	frame.self_modulate = card_style.frame_color
	bulk.self_modulate = card_style.bulk_color

	foreground_art.texture = foreground_texture
	background_art.texture = background_texture

	type_icon.texture = load(TYPEICONS_PATH % Card.Icon.keys()[card_icon])
	cost_icon.self_modulate = Card.COST_COLOR[cost]

	if parameters.size() > 0:
		band.visible = true
		band.self_modulate = card_style.frame_color
		parameters_brackets.self_modulate = Card.ICON_COLOR[card_icon]
		parameters_label.text = ', '.join(parameters.map(func(param): return param.get('name')))
		parameters_label.self_modulate = card_style.accent_color
	else:
		band.visible = false
