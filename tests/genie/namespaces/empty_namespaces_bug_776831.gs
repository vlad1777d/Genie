init
	assert NameSpace2.i == 2
	assert NameSpace3.i == 3
	assert NameSpace4.i == 4
	assert NameSpace5.a == 5
	assert NameSpace5.i == 5
	assert NameSpace6.i == 6

namespace NameSpace1
	pass

namespace NameSpace2
	pass
	const i: int = 2

namespace NameSpace3
	const i: int = 3
	pass

namespace NameSpace4
	const i: int = 4

namespace NameSpace5
	const a: int = 5
	pass
	const i: int = 5

namespace NameSpace6
	pass

namespace NameSpace6
	const i: int = 6
