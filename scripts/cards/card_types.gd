class_name Card extends Node2D

enum Icons {
	arithmetic,
	heal,
}

enum Types {
	effect,
}

const ICON_COLOR = [
   Color("ffa80d"), # Icons.arithmetic
   Color("df003e"), # Icons.heal
]

const COST_COLOR = [
   Color("76e86a"),
   Color("ffa80d"),
   Color("df003e"),
]
