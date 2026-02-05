extends CanvasLayer

@export var current_mask_rect:TextureRect
@export var current_mask_text:RichTextLabel
@export var social_text_label:RichTextLabel

enum ControlScheme {KEYBOARD_AND_MOUSE, GAMEPAD}
@export var current_control_scheme:ControlScheme = ControlScheme.KEYBOARD_AND_MOUSE
signal control_scheme_changed(new_control_scheme:ControlScheme)

func _ready() -> void:
	visible = false
	current_mask_text.text = ""
	social_text_label.text = ""
	Dialogic.VAR.variable_changed.connect(_on_dialogic_variable_changed)
	game_manager.game_started.connect(_on_game_started)

func swap_hud_mask(mask_name:String):
	print("hud mask change")
	var x = -1
	match mask_name:
		"wild":
			x = 0
			current_mask_text.text = "[center]Wild[/center]"
		"peasant":
			x = 64
			current_mask_text.text = "[center]Peasant[/center]"
		"eunuch":
			x = 128
			current_mask_text.text = "[center]Eunuch[/center]"
		"noble":
			x = 196
			current_mask_text.text = "[center]Noble[/center]"
	if x != -1:
		current_mask_rect.texture.region = Rect2(Vector2(x, 0), Vector2(64, 64))

func _on_dialogic_variable_changed(info: Dictionary):
	if(info['variable'] == "SocialPoints"):
		social_text_label.text = "[center]%d[/center]" % info['new_value']

func _on_game_started():
	visible = true

#Read player input to show keyboard or controller prompts
func _input(event: InputEvent) -> void:
	#checks if current control scheme is different to latest input event
	match current_control_scheme:
		ControlScheme.KEYBOARD_AND_MOUSE:
			# change to controller UI
			if event is InputEventJoypadButton or event is InputEventJoypadMotion:
				control_scheme_changed.emit(ControlScheme.GAMEPAD)
		ControlScheme.GAMEPAD:
			# change to keyboard UI
			if event is InputEventKey or event is InputEventMouseMotion:
				control_scheme_changed.emit(ControlScheme.KEYBOARD_AND_MOUSE)
				pass
