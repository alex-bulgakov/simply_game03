extends CanvasLayer

# colors
var green: Color = Color("1ac91f")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laser_label: Label = $MarginContainer2/HBoxContainer/LaserCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $MarginContainer2/HBoxContainer/LaserCounter/VBoxContainer/TextureRect
@onready var grenade_label: Label = $MarginContainer2/HBoxContainer/GrenadeCounter/VBoxContainer/Label
@onready var grenade_icon: TextureRect = $MarginContainer2/HBoxContainer/GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/TextureProgressBar
	
func _ready():
	update_state_text()
	Globals.connect("stat_change", update_state_text)
	

func update_state_text():
	update_laser_text()
	update_grenade_text()
	update_health_text()

func update_laser_text():
	var amount = Globals.laser_amount
	laser_label.text = str(amount)
	update_color(amount, laser_label, laser_icon)
	
func update_grenade_text():
	var amount = Globals.grenade_amount
	grenade_label.text = str(amount)
	update_color(amount, grenade_label, grenade_icon)
	
func update_health_text():
	health_bar.value = Globals.health
	


func update_color(amount, label, icon):
	if amount > 0:
		label.modulate = green
		icon.modulate = green
	else:
		label.modulate = red
		icon.modulate = red
