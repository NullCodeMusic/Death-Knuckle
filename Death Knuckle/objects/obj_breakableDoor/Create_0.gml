hits=100

if hits <= 0 {
	visible = false
	part_emitter_clear(rubblePartSys,rubbleEmitter)
part_system_clear(rubblePartSys)
instance_destroy()
}

// WHY