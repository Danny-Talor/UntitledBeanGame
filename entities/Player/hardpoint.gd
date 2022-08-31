extends Spatial
		
func get_attached_weapon_muzzle_location():
	var attached_weapon = get_child(0)
	return attached_weapon.get_muzzle_location()
