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

@export_group("Main")
@export var id:String
@export var name:String
@export var description:String
@export_range(0, 2) var cost:int
@export var type:Type
@export var icon:Icon

@export_group("Others")
@export var parameters:Array[CardParameter]
@export var style:CardStyle
