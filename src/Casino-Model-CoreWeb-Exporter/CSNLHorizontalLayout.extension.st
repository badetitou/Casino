Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNLHorizontalLayout >> computeAlignementAttribute [

	self cell ifNotEmpty: [ :cells | 
		(cells first widget position isNotNil and: [ 
			 (cells first attributes select: [ :attribute | 
				  attribute isOfType: CSNUIWidth ]) isEmpty ]) ifTrue: [ 
			^ CSNAttribute new
				  name: 'alignment';
				  attributeValue:
					  cells first widget position angularHorizontalAlignement;
				  yourself ] ].
	^ {  }
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNLHorizontalLayout >> getLayoutAttribute [
	^ {super getLayoutAttribute. self computeAlignementAttribute}
]
