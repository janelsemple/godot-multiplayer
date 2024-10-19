extends TileMapLayer

const MAP_SIZE = 200
const TERRAIN_SET = 0  # Assuming you're using the first terrain set
const GRASS_TERRAIN = 0
const DIRT_TERRAIN = 1

func _ready():
	generate_terrain()

func generate_terrain():
	# Create a new noise object
	var noise = FastNoiseLite.new()
	noise.seed = randi()  # Random seed for variety
	noise.frequency = 0.05  # Adjust this to change the "scale" of the terrain features

	var grass_cells = []
	var dirt_cells = []

	# Generate terrain based on noise
	for x in range(-MAP_SIZE/2, MAP_SIZE/2):
		for y in range(-MAP_SIZE/2, MAP_SIZE/2):
			var noise_value = noise.get_noise_2d(x, y)
			
			# Decide terrain type based on noise value
			if noise_value > 0:
				grass_cells.append(Vector2i(x, y))
			else:
				dirt_cells.append(Vector2i(x, y))

	# Set the terrain
	self.set_cells_terrain_connect(grass_cells, TERRAIN_SET, GRASS_TERRAIN, false)
	self.set_cells_terrain_connect(dirt_cells, TERRAIN_SET, DIRT_TERRAIN, false)
