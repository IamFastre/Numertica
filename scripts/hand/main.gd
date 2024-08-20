class_name HandNode extends Node2D

@export_group("Cards")
@export var card_scene:PackedScene
@export var card_spacing:float = 60.0
@export var card_count:int = 5
@export_group("Placement")
@export var fan_max_height:float = 25.0
@export_range(0, 90) var fan_angle:float = 15.0
@export var fan_duration:float = 2.0

@onready var card_group:Node = $Cards

var cards:Array[Node] :
	get:
		return card_group.get_children()


func calculate_target_position(index:int) -> Vector2:
	var x := index * card_spacing - (card_spacing * (card_count - 1))/2
	var y := -fan_max_height * sin((float(index) / float(cards.size() - 1)) * PI) if card_count != 1 else 0.0
	return Vector2(x, y)

func calculate_target_rotation(index:int) -> float:
	if card_count == 1:
		return 0
	return -deg_to_rad(fan_angle) * cos((float(index) / float(cards.size() - 1)) * PI)

func add_card(card:CardNode) -> void:
	card.name = 'card#%s' % cards.size()
	card.global_position.x = -get_viewport().get_visible_rect().size.x / 2
	card_group.add_child(card)

# ========================================================================== #

func _ready() -> void:
	for i in range(card_count):
		var card:CardNode = card_scene.instantiate()
		add_card(card)

func _process(delta: float) -> void:
	var el_cards := card_group.get_children()
	for i in range(el_cards.size()):
		var card := el_cards[i]
		card.position = lerp(card.position, calculate_target_position(i), delta * 3)
		card.rotation = lerp(card.rotation, calculate_target_rotation(i), delta * 3)

# ========================================================================== #

func _on_add_button_pressed() -> void:
	var card:CardNode = card_scene.instantiate()
	card_count += 1
	add_card(card)


func _on_remove_button_pressed() -> void:
	var last_card = card_group.get_child(-1)
	card_count -= 1
	card_group.remove_child(last_card)
