extends Node

@export var hand:HandNode
@export var health_component:HealthComponent
@export var health_label:Label

func update_health() -> void:
	health_label.text = "HP: %s/%s" % [health_component.points, health_component.max_points]

	if health_component.points > 0:
		health_label.label_settings.font_color = Color("3680ff")
	else:
		health_label.label_settings.font_color = Color("ff8000")

func _ready() -> void:
	health_component.on_health_changed.connect(update_health)
	health_component.on_max_health_changed.connect(update_health)

func _on_add_button_pressed() -> void:
	var new_card:CardNode = hand.card_scene.instantiate()
	hand.add_card(new_card)

func _on_remove_button_pressed() -> void:
	var last_card = hand.card_group.get_child(-1)
	hand.card_group.remove_child(last_card)

func _on_add_health_pressed() -> void:
	health_component.heal(5)

func _on_remove_health_pressed() -> void:
	health_component.damage(5)
