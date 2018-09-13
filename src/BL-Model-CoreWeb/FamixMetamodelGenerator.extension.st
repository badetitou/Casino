Extension { #name : #FamixMetamodelGenerator }

{ #category : #'*BL-Model-CoreWeb' }
FamixMetamodelGenerator class >> resetMetamodel [

	" self resetMetamodel"

	| classes tower |
	classes := self packageName asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ].
	classes addAll: ('BL-Model-CoreWeb' asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ]).
	classes addAll: ('BL-Model-UI-SubEntities' asPackage definedClasses
		select: [ :each | each inheritsFrom: MooseEntity ]).
	classes addAll: (self packageName asPackage definedClasses select: #isTrait).
	classes addAll: #'Famix-Traits' asPackage definedClasses.
	{ Trait. 	Class. ClassDescription. Behavior. MooseModel. MooseAbstractGroup. MooseEntity. MooseGroup} 
		do: [ :each | classes add: each ].
	tower := MooseModel metaBuilder: classes.
	self metamodel: tower metamodel.
	^ metamodel
]
