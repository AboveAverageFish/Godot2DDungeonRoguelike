extends TileMapLayer

var rooms : Array[PackedScene] = [
	preload("res://Rooms/room_1.tscn"),
	preload("res://Rooms/room_2.tscn"),
	preload("res://Rooms/room_3.tscn"),
	preload("res://Rooms/room_4.tscn"),
	preload("res://Rooms/room_5.tscn"),
	preload("res://Rooms/room_6.tscn")
	]
enum directions {
	L,
	U,
	R,
	D,
	N
	}
var roomsCompatable : Array[RoomConnections] = [
	RoomConnections.new(directions.L, directions.U, directions.R, directions.D),
	RoomConnections.new(directions.L, directions.U, directions.R, directions.N),
	RoomConnections.new(directions.N, directions.N, directions.R, directions.N),
	RoomConnections.new(directions.L, directions.N, directions.R, directions.N),
	RoomConnections.new(directions.L, directions.N, directions.N, directions.N),
	RoomConnections.new(directions.N, directions.N, directions.N, directions.D)
	]
var allRooms : Array[Array]
var allRoomsCons : Array[Array]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand = randi_range(0, rooms.size())
	allRooms[0][0] = [rooms[rand]]
	allRoomsCons[0][0] = [roomsCompatable[rand]]
	layout(allRooms, allRoomsCons)
	pass

func layout(arooms : Array[Array], cons : Array[Array]):
	var missingCons : Array[Vector2]
	for y in arooms.size():
		for x in arooms[y].size():
			if arooms[y][x] != null :
				if cons[y][x] == directions.N :
					missingCons.append(Vector2(y, x))
	for i in missingCons.size():
		if missingCons[i].x == 0 or  missingCons[i].x == :
			pass
	return layout(arooms, cons)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var test= delta
	test = test/2
	pass

class RoomConnections :
	var connections : Array[directions] = []
	func _init(a : directions, b : directions, c : directions, d : directions):
		connections.append(a)
		connections.append(b)
		connections.append(c)
		connections.append(d)
	func get_directions() -> Array[directions]:
		return connections
