## Body entered functions detect when player walks to the top or bottom of the stairs
## then move the player to the respective exit location
##          should only trigger when the player walks into them while on the stairs

## Player interacted functions move the player onto the stairs when interacting
extends StaticBody3D


func _on_interaction_detector_top_player_interacted(body: CharacterBody3D) -> void:
	body.global_position = $TopEntrance.global_position


func _on_interaction_detector_top_body_entered(body: Node3D) -> void:
	if body.global_position.z == global_position.z:
		body.global_position = $TopReturnPoint.global_position


func _on_interaction_detector_bottom_player_interacted(body: CharacterBody3D) -> void:
	body.global_position = $BottomEntrance.global_position


func _on_interaction_detector_bottom_body_entered(body: Node3D) -> void:
	if body.global_position.z == global_position.z:
		body.global_position = $BottomReturnPoint.global_position
