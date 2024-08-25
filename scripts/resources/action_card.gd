class_name ActionCard extends Card

static var ACTIONS:Dictionary = {
	'add': func add(x:float, y:float) -> float: return x + y,
	'sub': func sub(x:float, y:float) -> float: return x - y,
}

@export var parameters:Array[CardParameter] = []
@export var action:Callable :
	get:
		return ACTIONS[id]
