Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Layout-accessing' }
CSNContainer >> layout [
	"Relation named: #layout type: #CSNLLayout opposite: #container"

	<generated>
	<derived>
	<FMProperty: #layout type: #CSNLLayout opposite: #container>
	<package: #'Casino-Model-Layout'>
	^ self attributeAt: #layout ifAbsent: [ nil ]
]

{ #category : #'*Casino-Model-Layout-accessing' }
CSNContainer >> layout: anObject [
	<generated>
	(self attributeAt: #layout ifAbsentPut: [ nil ]) == anObject
		ifTrue: [ ^ anObject ].
	anObject
		ifNil: [ | otherSide |
			otherSide := self layout.
			self privateState attributeAt: #layout put: anObject.
			otherSide container: nil ]
		ifNotNil: [ self attributeAt: #layout put: anObject.
			anObject container: self ]
]
