init
	assert Class.i == 2
	assert Class3.i == 3
	assert Class4.i == 4
	assert Class5.a == 5
	assert Class5.i == 5

class Class1
	pass

class Class
	pass
	const i: int = 2

class Class3
	const i: int = 3
	pass

class Class4
	const i: int = 4

class Class5
	const a: int = 5
	pass
	const i: int = 5

class Class6
	pass

/* Uncomenting next must give error: "root namespace already contains a definition for `Class6'"
class Class6
	const i: int = 6
*/
