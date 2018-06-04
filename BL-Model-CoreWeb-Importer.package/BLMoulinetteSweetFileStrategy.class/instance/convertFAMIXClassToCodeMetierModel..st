as yet unclassified
convertFAMIXClassToCodeMetierModel: aFAMIXClass
	| correspondingTSFile tsClassName rightBracketPos leftBracketPos contentLocalCache |  
	correspondingTSFile := self rootFolder / (self computeTSFileNameFromFAMIXCLass: aFAMIXClass).
	tsClassName := self computeTSClassNameFromFAMIXCLass: aFAMIXClass.
	contentLocalCache := correspondingTSFile contents.
	rightBracketPos := contentLocalCache indexOf: ${ startingAt: ( contentLocalCache findString:  'export class ', tsClassName).
	leftBracketPos :=contentLocalCache findCloseBracketFor: rightBracketPos.
	^ (contentLocalCache copyFrom: rightBracketPos to: leftBracketPos) replaceAllRegex: '\*/' with: '//'