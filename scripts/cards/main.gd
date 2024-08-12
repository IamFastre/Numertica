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
@onready var icon = $Sprite/Canvas/Content/Icon
@onready var info_box = $Sprite/Canvas/Content/InfoBox
@onready var separator = $Sprite/Canvas/Content/Separator
@onready var name_node = $Sprite/Canvas/Content/Textual/CardName
@onready var type_name = $Sprite/Canvas/Content/TypeName
@onready var parameters_brackets = $Sprite/Canvas/Content/Brackets

func configure():
	name_node.text = card_name
	type_name.text = Card.Icons.keys()[card_type].capitalize()
	type_name.label_settings.font_color = Card.ICON_COLOR[card_type]
	parameters_brackets.label_settings.font_color = Card.ICON_COLOR[card_type]
	sprite.self_modulate = sprite_color
	info_box.color = sprite_color
	separator.default_color = sprite_color
	canvas.self_modulate = canvas_color
	foreground.texture = foreground_texture
	background.texture = background_texture
	icon.texture = load(ICONS_PATH % Card.Icons.keys()[card_icon])

func _process(_delta):
	configure()
