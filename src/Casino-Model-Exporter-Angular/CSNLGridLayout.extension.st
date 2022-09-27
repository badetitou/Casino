Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNLGridLayout >> getLayoutAttribute [

	self cell size >= 1 ifTrue: [ ^ {  } ].
	^ { (CSNUIClass new attributeValue: 'row') }
]
