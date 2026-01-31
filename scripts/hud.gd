extends CanvasLayer

@export var current_mask_rect:TextureRect
@export var current_mask_text:RichTextLabel
@export var social_text_label:RichTextLabel

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
		social_text_label.text = "[center]%s[/center]" %info['new_value']

func _on_game_started():
	visible = true
