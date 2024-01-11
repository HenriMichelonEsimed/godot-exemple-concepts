extends Node3D

signal my_signal(a_param:int)

func _on_button_signal_pressed():
	my_signal.emit(123)
