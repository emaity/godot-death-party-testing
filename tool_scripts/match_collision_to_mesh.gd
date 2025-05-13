@tool
extends StaticBody3D

func _process(delta: float) -> void:
	if true and $CollisionShape3D.shape.size != $MeshInstance3D.mesh.size:
		$CollisionShape3D.shape.size = $MeshInstance3D.mesh.size
