Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner [
	"Relation named: #cellOwner type: #CSNLCell opposite: #widget"

	<generated>
	<container>
	<derived>
	<FMProperty: #cellOwner type: #CSNLCell opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self attributeAt: #cellOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner: anObject [

	<generated>
	(self attributeAt: #cellOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self cellOwner.
		self attributeAt: #cellOwner put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self attributeAt: #cellOwner put: anObject.
		anObject widget: self ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> position [
	"Relation named: #position type: #CSNLPosition opposite: #widget"

	<generated>
	<FMProperty: #position type: #CSNLPosition opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self attributeAt: #position ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> position: anObject [

	<generated>
	(self attributeAt: #position ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self position.
		self attributeAt: #position put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self attributeAt: #position put: anObject.
		anObject widget: self ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> size [
	"Relation named: #size type: #CSNLSize opposite: #widget"

	<generated>
	<FMProperty: #size type: #CSNLSize opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self attributeAt: #size ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> size: anObject [

	<generated>
	(self attributeAt: #size ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self size.
		self attributeAt: #size put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self attributeAt: #size put: anObject.
		anObject widget: self ]
]
