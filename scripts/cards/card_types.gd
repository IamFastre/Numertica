class_name Card extends Node2D

enum Icons {
	heal,
	arithmetic,
}

enum Types {
	effect,
}

const ICON_COLOR = [
   Color("df003e"), # Icons.heal
   Color("ffa80d"), # Icons.arithmetic
]

const COST_COLOR = [
   Color("76e86a"),
   Color("ffa80d"),
   Color("df003e"),
]
