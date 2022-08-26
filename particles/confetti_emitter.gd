extends Spatial

func emit_particles():
	for particle in self.get_children():
		particle.set_emitting(true)
