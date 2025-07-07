extends CharacterBody2D

const SPEED = 500
const G = 50
const JUMPSPEED=1500
var animatedPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedPlayer=$"AnimatedSprite2D"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move()
	apply_gravity()
	move_and_slide()	

func move():
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
		animatedPlayer.scale.x=1.5
		animatedPlayer.play("run")
	elif Input.is_action_pressed("Left"):
		velocity.x = -SPEED
		animatedPlayer.scale.x=-1.5
		animatedPlayer.play("run")
		
	else:
		velocity.x = 0
		animatedPlayer.play("idle")
		
func apply_gravity():
	velocity.y += G
	#velocity.y = velocity.y + G
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y=-JUMPSPEED
		animatedPlayer.play("jump")


func _on_player_entered_killer_area(body: Node2D) -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
