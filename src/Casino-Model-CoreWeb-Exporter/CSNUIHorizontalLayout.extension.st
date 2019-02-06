Extension { #name : #CSNUIHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIHorizontalLayout >> computeAlignementAttribute [
	self cell
		ifNotEmpty: [ :cells | 
			(cells first widget position isNotNil and: [ (cells first attributes select: [ :attribute | attribute isKindOf: CSNUIWidth ]) isEmpty ]) 
				ifTrue: [
					^ CSNAttribute new
						name: 'alignment';
						attributeValue: cells first widget position angularHorizontalAlignement;
						yourself ] ].
	^ {}
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIHorizontalLayout >> getLayoutAttribute [
	^ {super getLayoutAttribute. self computeAlignementAttribute}
]
