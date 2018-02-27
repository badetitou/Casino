accessing
generateBLModel
	model := MooseModel new
		metamodel: BLMetamodelGenerator metamodel;
		yourself.
	self importPhases.
	^ model