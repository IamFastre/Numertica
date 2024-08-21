class_name Card extends Resource

enum Icon {
	arithmetic,
	heal,
}

enum Type {
	effect,
}

const ICON_COLOR = [
   Color("ffa80d"), # Icon.arithmetic
   Color("df003e"), # Icon.heal
]

const COST_COLOR = [
   Color("76e86a"),
   Color("ffa80d"),
   Color("df003e"),
]

@export var id:String = "card"
@export var name:String = "Card"
@export var description:String = "Card template"

@export_group("Looks")
@export var icon:Icon = Icon.arithmetic
@export var style:CardStyle = CardStyle.new()
@export var foreground_texture:Texture2D = preload("res://assets/cards/foregrounds/hash.png")
@export var background_texture:Texture2D = preload("res://assets/cards/backgrounds/dot_grid.png")

@export_group("Function")
@export_range(0, 2) var cost:int = 0
@export var type:Type = Type.effect
@export var parameters:Array[CardParameter] = []
