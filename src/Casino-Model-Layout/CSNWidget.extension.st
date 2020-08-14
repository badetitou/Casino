Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner [
	"Relation named: #cellOwner type: #CSNLCell opposite: #widget"

	<generated>
	<container>
	<derived>
	<MSEProperty: #cellOwner type: #CSNLCell opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self privateState attributeAt: #cellOwner ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> cellOwner: anObject [

	<generated>
	(self privateState attributeAt: #cellOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self cellOwner.
		self privateState attributeAt: #cellOwner put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #cellOwner put: anObject.
		anObject widget: self ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> position [
	"Relation named: #position type: #CSNLPosition opposite: #widget"

	<generated>
	<MSEProperty: #position type: #CSNLPosition opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self privateState attributeAt: #position ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> position: anObject [

	<generated>
	(self privateState attributeAt: #position ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self position.
		self privateState attributeAt: #position put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #position put: anObject.
		anObject widget: self ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> size [
	"Relation named: #size type: #CSNLSize opposite: #widget"

	<generated>
	<MSEProperty: #size type: #CSNLSize opposite: #widget>
	<package: #'Casino-Model-Layout'>
	^ self privateState attributeAt: #size ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNWidget >> size: anObject [

	<generated>
	(self privateState attributeAt: #size ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self size.
		self privateState attributeAt: #size put: anObject.
		otherSide widget: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #size put: anObject.
		anObject widget: self ]
]
