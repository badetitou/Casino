Extension { #name : #CSNUICWDialog }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNUICWDialog >> opener [
	"Relation named: #opener type: #CSNBOpenDialog opposite: #dialog"

	<generated>
	<derived>
	<FMProperty: #opener type: #CSNBOpenDialog opposite: #dialog>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #opener ifAbsentPut: [ FMMultivalueLink on: self opposite: #dialog: ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNUICWDialog >> opener: anObject [

	<generated>
	self opener value: anObject
]
