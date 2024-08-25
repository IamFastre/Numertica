@tool
class_name CardNode extends Area2D

const TYPEICONS_PATH = "res://assets/cards/types/%s.png"

@export var resource:Card = Card.new()

@onready var name_node:Label = $Sprite/CardName
@onready var frame:TextureRect = $Sprite/Frame
@onready var bulk:TextureRect = $Sprite/Bulk
@onready var top_notch: TextureRect = $Sprite/Frame/TopNotch

@onready var foreground_art:TextureRect = $Sprite/Art/Foreground
@onready var background_art:TextureRect = $Sprite/Art/Background

@onready var type_icon:TextureRect = $Sprite/Borders/Type
@onready var cost_icon:TextureRect = $Sprite/Borders/Cost

@onready var band:TextureRect = $Sprite/Band
@onready var parameters_brackets:Label = $Sprite/Band/Brackets
@onready var parameters_label:Label = $Sprite/Band/Parameters

@export var default_scale:Vector2 = Vector2(0.6, 0.6)

@onready var is_dragging:bool :
	get:
		return $DraggableComponent.is_dragging

# ========================================================================== #

func _ready() -> void:
	if resource is NumberCard:
		print(resource.name + " " + str(resource.value))

func _process(delta:float) -> void:
	configure()

	if not is_dragging:
		scale = lerp(scale, default_scale, delta * 5)

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
	frame.modulate = resource.style.frame_color
	bulk.self_modulate = resource.style.bulk_color

	foreground_art.texture = resource.foreground_texture
	background_art.texture = resource.background_texture

	type_icon.texture = load(TYPEICONS_PATH % Card.Type.keys()[resource.type])
	cost_icon.self_modulate = Card.COST_COLOR[resource.cost]

	if resource is ActionCard and resource.parameters.size() > 0:
		var func_res:ActionCard = resource
		band.visible = true
		band.self_modulate = func_res.style.frame_color
		parameters_brackets.self_modulate = Card.ICON_COLOR[func_res.type]
		parameters_label.text = ', '.join(func_res.parameters.map(func(param): return param.get('name')))
		parameters_label.self_modulate = func_res.style.accent_color
	else:
		band.visible = false

	top_notch.visible = not band.visible
