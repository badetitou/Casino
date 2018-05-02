*BL-Model-CoreWeb-Exporter
attributeValue
	"inverse for core3 vs core2... I don't know why"

	^ self attributeValue = 'true'
		ifTrue: [ ^ 'false' ]
		ifFalse: [ ^ 'true' ]