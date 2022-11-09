extends RichTextLabel

var dialogue = ["Thi is a Dialogue System Demo","Its nice giving NPC's the ability to talk"]
var page = 0

func _ready():
	set_bbcode(dialogue[page])
	#sets bbcode to the dialogue variable and sets it as page 0
	set_visible_characters(0)
	#sets the characters of the text to 0,so it starts from begining
	set_process_input(true)
	#sets input function == true

func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size()-1:
				page +=1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
				#changes the page to the next when enter is pressed and sets its characters to 0

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	#increases the characters of the text by 1 every 0.05 sec
