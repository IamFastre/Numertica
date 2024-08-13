class_name CardNode extends Node2D

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

@onready var sprite = $Sprite
@onready var canvas = $Sprite/Canvas
@onready var content = $Sprite/Canvas/Content
@onready var background = $Sprite/Canvas/Content/Art/Background
@onready var foreground = $Sprite/Canvas/Content/Art/Foreground
@onready var name_node = $Sprite/Canvas/Content/Textual/CardName

@onready var icon = $Sprite/Type/Icon
@onready var icon_background = $Sprite/Type/IconBackground
@onready var type_name = $Sprite/Type/TypeName
@onready var type_box = $Sprite/Type/TypeBox

@onready var info_box = $Sprite/Canvas/Content/InfoBox
@onready var separator = $Sprite/Canvas/Content/Separator
@onready var parameters_brackets = $Sprite/Canvas/Content/Brackets
@onready var parameters_label = $Sprite/Canvas/Content/Parameters

func configure():
	name_node.text = card_name
	canvas.self_modulate = canvas_color
	sprite.self_modulate = sprite_color

	parameters_label.text = ', '.join(parameters.map(func(param): return param.get('name')))
	parameters_label.label_settings.font_color = canvas_color
	parameters_brackets.label_settings.font_color = Card.ICON_COLOR[card_icon]
	info_box.color = sprite_color
	separator.default_color = sprite_color

	foreground.texture = foreground_texture
	background.texture = background_texture

	icon.texture = load(ICONS_PATH % Card.Icons.keys()[card_icon])
	icon_background.self_modulate = sprite_color
	type_name.text = Card.Icons.keys()[card_icon].capitalize()
	type_name.label_settings.font_color = Card.ICON_COLOR[card_icon]
	type_box.color = sprite_color
	type_box.polygon[1] = Vector2(type_name.size.x + 45, type_box.polygon[1].y)
	type_box.polygon[2] = Vector2(type_name.size.x + 20, type_box.polygon[2].y)

func _process(_delta):
	configure()
