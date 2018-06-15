Extension { #name : #BLClickHandler }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLClickHandler >> attributeMethod [
	^ '/*
	'"
		,
			('' , (self oldClass flatCollect: #angularString)
				replaceAllRegex: 'onClick'
				with: self attributeValue)
		",
			'
*/'
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLClickHandler >> extractMethodNamed: methodsName From: methodsText [
	"I return the content of onClick generated method"

	| beginPos endPos |
	
	beginPos := (((( methodsName, '\([^()]*\) \{') asRegex matchingRangesIn: methodsText) collect: [ :a | a first ]) at: 1).
	endPos := methodsText findCloseBracketFor: (methodsText indexOf: ${ startingAt: beginPos).
	^ methodsText copyFrom: beginPos to: endPos
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLClickHandler >> extractOnClickMethod: methodsText [
	"I return the content of onClick generated method"

	| tmpExtractText |
	tmpExtractText := methodsText copyWithRegex: '.*onClick\(event \: ClickEvent\) ' matchesReplacedWith: ''.
	^ tmpExtractText copyFrom: 2 to: (tmpExtractText findCloseBracketFor: 1) - 1
]
