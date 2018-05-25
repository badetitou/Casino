*BL-Model-Importer-Java
parameters
	"I try to extract the initial parameter of an Anonymous class declaration"
	| subString |
	subString :=(self container sourceText
		copyFrom: 1
		to: (self container sourceText findString: self sourceText)) ifEmpty: [^ {}].
	^ (subString copyFrom: (subString findLastOccurrenceOfString: 'new' startingAt: 1) to: subString size) extractParameters