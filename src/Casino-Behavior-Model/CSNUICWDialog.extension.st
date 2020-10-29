Extension { #name : #CSNUICWDialog }

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNUICWDialog >> opener [
	"Relation named: #opener type: #CSNBOpenDialog opposite: #dialog"

	<generated>
	<derived>
	<FMProperty: #opener type: #CSNBOpenDialog opposite: #dialog>
	<package: #'Casino-Behavior-Model'>
	^ self attributeAt: #opener ifAbsentPut: [ FMMultivalueLink on: self opposite: #dialog: ]
]

{ #category : #'*Casino-Behavior-Model-accessing' }
CSNUICWDialog >> opener: anObject [

	<generated>
	self opener value: anObject
]
