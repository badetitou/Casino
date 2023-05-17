Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNLGridLayout >> getLayoutAttribute [

	(self cell isNotEmpty or: [ 
		 (self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
			 isNotEmpty ]) ifTrue: [ ^ {  } ].
	^ { (CSNUIClass new attributeValue: 'row') }
]
