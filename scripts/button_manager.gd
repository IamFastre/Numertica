extends Node

@export var player:PlayerNode

func _on_add_button_pressed() -> void:
	var new_card:CardNode = player.hand.card_scene.instantiate()
	player.hand.add_card(new_card)

func _on_remove_button_pressed() -> void:
	var last_card = player.hand.card_group.get_child(-1)
	player.hand.card_group.remove_child(last_card)
