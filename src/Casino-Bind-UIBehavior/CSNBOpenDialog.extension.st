Extension { #name : #CSNBOpenDialog }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBOpenDialog >> dialog [
	"Relation named: #dialog type: #CSNUICWDialog opposite: #opener"

	<generated>
	<FMProperty: #dialog type: #CSNUICWDialog opposite: #opener>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #dialog ifAbsent: [ nil ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBOpenDialog >> dialog: anObject [

	<generated>
	self privateState attributeAt: #dialog put: (FMMultivalueLink on: self update: #opener from: self dialog to: anObject).
]
