*BL-Model-CoreWeb-Exporter
extractOnClickMethod: methodsText
	"I return the content of onClick generated method"

	| tmpExtractText |
	tmpExtractText := methodsText copyWithRegex: '.*onClick\(event \: ClickEvent\) ' matchesReplacedWith: ''.
	^ tmpExtractText copyFrom: 2 to: (tmpExtractText findCloseBracketFor: 1) - 1