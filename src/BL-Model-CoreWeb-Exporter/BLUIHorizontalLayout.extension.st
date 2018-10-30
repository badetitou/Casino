Extension { #name : #BLUIHorizontalLayout }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIHorizontalLayout >> computeAlignementAttribute [
	self cell
		ifNotEmpty: [ :cells | 
			(cells first widget position isNotNil and: [ (cells first attributes select: [ :attribute | attribute isKindOf: BLUIWidth ]) isEmpty ]) 
				ifTrue: [
					^ BLAttribute new
						name: 'alignment';
						attributeValue: cells first widget position angularHorizontalAlignement;
						yourself ] ].
	^ {}
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIHorizontalLayout >> getLayoutAttribute [
	^ {super getLayoutAttribute. self computeAlignementAttribute}
]
