Extension { #name : #CSNLBorderLayout }

{ #category : #'*Casino-Model-Importer-Java' }
CSNLBorderLayout >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [

	| tmpCell |
	anInvocation ifNil: [ self addWidget: aWidget ] ifNotNil: [ 
		| param |
		anInvocation ifNotNil: [ 
			aWidget addingPosition: anInvocation sourceAnchor startPos ].
		param := anInvocation parameters.
		tmpCell := (aFactory create: CSNLCell)
			           widget: aWidget;
			           yourself.
		(self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) 
			add: tmpCell -> anInvocation.
		"alignement of the widget"
		tmpCell position: (param size >= 2
				 ifTrue: [ 
				 CSNLAlignement createAlignementWithBorder: param second ]
				 ifFalse: [ nil ]).
		cell add: tmpCell ]
]
