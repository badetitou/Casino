*BL-Model-FamixNGPatch
generate
	| aClass aSuperclass aClassName isHierarchyRoot |
	self willGenerate
		ifFalse: [ ^ self ].
	aClassName := self fullName.
	isHierarchyRoot := false.
	aSuperclass := self classGeneralization
		ifNil: [ isHierarchyRoot := true.
			self defaultSuperclass ]
		ifNotNil: [ self classGeneralization realClass ].
	aClass := self builder environment
		createClassNamed: aClassName asSymbol
		superclass: aSuperclass
		traitNames: self allTraitNames
		slots: self slotDefinitions
		in: self packageName
		overwrite: true.
	aClass tagWith: self tag.
	self builder environment setComment: self comment for: aClass.
	self realClass: aClass.
	self willGenerate
		ifTrue: [ self generateAccessors.
			self generateAnnotationIn: aClass as: self name superclass: nil ].
	self generateRequirementsFor: aClass.
	isHierarchyRoot
		ifTrue: [ self generateRootMethodsIn: aClass ]