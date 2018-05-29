*BL-Fast-Java-Angular-Extensions
angularString
	
	^ ((self modifiers select: #isModifier) flatCollect: [:modifier | modifier angularString, ' ']), self simpleName, '(', (self parameters ifNil: [ '' ] ifNotNil: [:parametersPresent | parametersPresent flatCollect: [:parameter | parameter angularString ] ] ), ')',  self body angularString