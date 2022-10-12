extends Control

var menu_origin_position := Vector2.ZERO
var menu_origin_size := Vector2.ZERO
var current_menu
var menu_stack := []
onready var main_menu := $MainMenu
onready var credits_menu := $Credits
onready var controllers_menu := $Controllers

func _process(delta):
	if $AudioBackground.playing == false:
		$AudioBackground.play()

func _ready():
	menu_origin_position = Vector2(0,0)
	menu_origin_size = get_viewport_rect().size
	current_menu = main_menu

func move_to_next_menu(next_menu_id: String):
	var next_menu = get_menu_from_menu_id(next_menu_id)
	current_menu.rect_global_position = Vector2(-menu_origin_size.x, 0)
	next_menu.rect_global_position = menu_origin_position
	menu_stack.append(current_menu)
	current_menu = next_menu


func move_to_previous_menu():
	var previous_menu = menu_stack.pop_back()
	if(previous_menu != null):
		previous_menu.rect_global_position = menu_origin_position
		current_menu.rect_global_position = Vector2(menu_origin_size.x, 0)
		current_menu = previous_menu
	
func get_menu_from_menu_id(menu_id: String):
	match menu_id:
		"main_menu":
			return main_menu
		"credits_menu":
			return credits_menu
		"controllers_menu":
			return controllers_menu
		_: 
			return main_menu
			

func _on_btn_controllers_pressed():
	move_to_next_menu("controllers_menu")


func _on_btn_credits_pressed():
	move_to_next_menu("credits_menu")


func _on_btn_return_pressed():
	move_to_previous_menu()


func _on_btn_play_pressed():
	get_tree().change_scene("res://Scenes/game.tscn")
	

