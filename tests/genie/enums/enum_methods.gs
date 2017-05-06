enum Aa1
	AAE
	AAF
	def static met (): int
		return 1
	AAZ

enum Aa2
	AAE,
	AAF
	def static met (): int
		return 2
	AAZ,

enum Aa3
	AAE,
	AAF
	AAZ,
	def static met (): int
		return 3

enum Aa4
	AAE,
	AAF
	AAZ
	def static met (): int
		return 4

enum Bb1
	AAE,
	AAF
	
	def static minimum (): int
		enumc: EnumClass = (EnumClass) typeof (Bb1).class_ref ()
		return enumc.minimum

	def static maximum (): int
		enumc: EnumClass = (EnumClass) typeof (Bb1).class_ref ()
		return enumc.maximum
	
	AAZ = 101
	
	def static get_by_nick (nick: string, out result: Bb1): bool
		enumc: EnumClass = (EnumClass) typeof (Bb1).class_ref ()
		eval: unowned EnumValue? = enumc.get_value_by_nick (nick)
		if eval == null
			print "was null"
			return false
		else
			result = (Bb1) eval.value
			return true
	
	AMM = 30


init
	var a_1_1 = Aa1.AAE
	var a_1_2 = Aa1.AAF
	var a_1_3 = Aa1.AAZ
	assert Aa1.met () == 1
	
	var a_2_1 = Aa2.AAE
	var a_2_2 = Aa2.AAF
	var a_2_3 = Aa2.AAZ
	assert Aa2.met () == 2
	
	var a_3_1 = Aa3.AAE
	var a_3_2 = Aa3.AAF
	var a_3_3 = Aa3.AAZ
	assert Aa3.met () == 3
	
	var a_4_1 = Aa4.AAE
	var a_4_2 = Aa4.AAF
	var a_4_3 = Aa4.AAZ
	assert Aa4.met () == 4
	
	assert Bb1.minimum () == 0
	assert Bb1.maximum () == 101
	b_1_1: Bb1    // for out of method
	Bb1.get_by_nick ("aaz", out b_1_1)
	assert b_1_1 == 101
	var b_1_2 = Bb1.AMM
	assert b_1_2 == 30
