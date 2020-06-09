Extension { #name : #String }

{ #category : #'*Casino-Model-Importer-Java' }
String >> extractParameters [
	^ ((self
		copyFrom: (self findString: '(') + 1
		to: (self findLastOccurrenceOfString: ')' startingAt: 1) - 1)
		findTokens: ',' escapedAndKeepBy: '"' )  collect: [ :string | ((string trim withoutPrefix: '"') withoutSuffix: '"' ) ]
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> findAllOccurrencesOfVariableNamed: substring [
	^ (('([^\w])' , substring , '[^\w]') asRegex matchingRangesIn: self)
		collect: [ :a | a second ]
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> findNext: aCharacter for: startIndex [
	"assume (self at: startIndex) is ${.  Find the matching $}, allowing parentheses to nest."

	| pos nestLevel |
	pos := startIndex + 1.
	nestLevel := 0.
	pos to: self size do: [ :index | 
		((self at: index) = ${ or: [ (self at: index) = $( ]) ifTrue: [ nestLevel := nestLevel + 1 ].
		((self at: index) = $} or: [ (self at: index) = $) ]) ifTrue: [ nestLevel := nestLevel - 1 ].
		((self at: index) = aCharacter and: [ nestLevel = 0 ]) ifTrue: [ ^ index ] ].
	^ self size + 1
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> findTokens: delimiters escapedAndKeepBy: quoteDelimiters [ 
	"Answer a collection of Strings separated by the delimiters, where  
	delimiters is a Character or collection of characters. Two delimiters in a  
	row produce an empty string (compare this to #findTokens, which  
	treats sequential delimiters as one).  
	 
	The characters in quoteDelimiters are treated as quote characters, such  
	that any delimiter within a pair of matching quoteDelimiter characters  
	is treated literally, rather than as a delimiter.  
	 
	The quoteDelimiter characters may be escaped within a quoted string.  
	Two sequential quote characters within a quoted string are treated as  
	a single character.  
	 
	This method is useful for parsing comma separated variable strings for  
	spreadsheet import and export."
	| tokens rs activeEscapeCharacter ts char token delimiterChars quoteChars |
	delimiterChars := (delimiters 
		ifNil: [ '' ]
		ifNotNil: [ delimiters ]) asString.
	quoteChars := (quoteDelimiters 
		ifNil: [ '' ]
		ifNotNil: [ quoteDelimiters ]) asString.
	tokens := OrderedCollection new.
	rs := self readStream.
	activeEscapeCharacter := nil.
	ts := String new writeStream.
	[ rs atEnd ] whileFalse: 
		[ char := rs next.
		activeEscapeCharacter 
			ifNil: 
				[ (quoteChars includes: char) 
					ifTrue: [ activeEscapeCharacter := char.ts nextPut: char
						 ]
					ifFalse: 
						[ (delimiterChars includes: char) 
							ifTrue: 
								[ token := ts contents.
								tokens add: token.
								ts := String new writeStream ]
							ifFalse: [ ts nextPut: char ] ] ]
			ifNotNil: 
				[ char == activeEscapeCharacter 
					ifTrue: 
						[ rs peek == activeEscapeCharacter 
							ifTrue: [ ts nextPut: rs next ]
							ifFalse: [ ts nextPut: char.activeEscapeCharacter := nil ] ]
					ifFalse: [ ts nextPut: char ] ] ].
	token := ts contents.
	(tokens isEmpty and: [ token isEmpty ]) ifFalse: [ tokens add: token ].
	^ tokens
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> removeComment [
	
	^ self replaceAllRegex: ('//[[:graph:] ]*') withMultiples: ' '
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> replaceAllRegex: aRegexString withMultiples: anotherSubstring [
	| tempString aCollection |
	tempString := self.
	aCollection := aRegexString asRegex matchesIn: tempString.
	aCollection
		do: [ :subString | 
			| replaceString |
			replaceString := ''.
			1 to: subString size do: [:number |  replaceString := replaceString , anotherSubstring ].
			tempString := tempString copyReplaceAll: subString with: replaceString ].
	^ tempString
]
