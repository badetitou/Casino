Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Layout-accessing' }
CSNContainer >> layout [
	"Relation named: #layout type: #CSNLLayout opposite: #container"

	<generated>
	<derived>
	<FMProperty: #layout type: #CSNLLayout opposite: #container>
	<package: #'Casino-Model-Layout'>
	^ self privateState attributeAt: #layout ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNContainer >> layout: anObject [

	<generated>
	(self privateState attributeAt: #layout ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self layout.
		self privateState attributeAt: #layout put: anObject.
		otherSide container: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #layout put: anObject.
		anObject container: self ]
]
