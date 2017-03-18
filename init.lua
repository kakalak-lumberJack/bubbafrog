minetest.register_node("bubbafrog:bubbafrog", {
	description = "The Mythical Bubba Frog",
	tiles = {"frog_top.png^[transformR180", "frog_bottom.png",  "frog_side.png",
	"frog_side.png^[transformFX", "frog_back.png", "frog_front.png",},
	paramtype = "light",
	light_source = 14,
	paramtype2 = "facedir",
	legacy_facedir_simple = true,
	groups = {cracky = 2},
	is_ground_content = "false",
})

--replaces nyan cats with bubbafrogs
minetest.register_lbm({
	name = "bubbafrog:bubbafy_nyancat",
	nodenames = {"nyancat:nyancat"},
	run_at_every_load = true,
	action = function(pos, node)
		local facedir = node.param2
		minetest.set_node(pos, {name = "bubbafrog:bubbafrog", param2 = facedir})
	end,
})

--makes frog croak when you punch it
minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
	if node.name == "bubbafrog:bubbafrog" then
	minetest.sound_play("bubbafrog_bullfrog", {
		pos = pos,
		gain = 1.0,
		max_hear_distance = 18, })
	end
end)
