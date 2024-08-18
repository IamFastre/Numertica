@tool
class_name CardNode extends Area2D

const ICONS_PATH = "res://assets/cards/icon/%s.png"

@export var card_name:String = "Card"
@export var cost:int = 0
@export var card_icon:Card.Icons
@export var card_type:Card.Types
@export var foreground_texture:Texture2D
@export var background_texture:Texture2D
@export var canvas_color:Color = Color.BLACK
@export var sprite_color:Color = Color.WHITE
@export var parameters:Array[Dictionary]

@onready var sprite := $Sprite
@onready var canvas := $Sprite/Canvas
@onready var background := $Sprite/Canvas/Art/Background
@onready var foreground := $Sprite/Canvas/Art/Foreground
@onready var name_node := $Sprite/Canvas/CardName

@onready var type_icon := $Sprite/Corners/Left/Type
@onready var cost_icon := $Sprite/Corners/Right/Cost
@onready var type_background := $Sprite/Corners/Left
@onready var cost_background := $Sprite/Corners/Right

@onready var band := $Sprite/Canvas/Band
@onready var separator := $Sprite/Canvas/Separator
@onready var parameters_brackets := $Sprite/Canvas/Band/Brackets
@onready var parameters_label := $Sprite/Canvas/Band/Parameters

func configure():
	name_node.text = card_name
	canvas.self_modulate = canvas_color
	sprite.self_modulate = sprite_color

	parameters_label.text = ', '.join(parameters.map(func(param): return param.get('name')))
	parameters_label.self_modulate = canvas_color
	parameters_brackets.self_modulate = Card.ICON_COLOR[card_icon]
	band.self_modulate = sprite_color
	separator.color = sprite_color

	foreground.texture = foreground_texture
	background.texture = background_texture

	type_icon.texture = load(ICONS_PATH % Card.Icons.keys()[card_icon])
	cost_icon.self_modulate = Card.COST_COLOR[cost]
	type_background.self_modulate = sprite_color
	cost_background.self_modulate = sprite_color

func _process(_delta):
	configure()
