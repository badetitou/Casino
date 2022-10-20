Extension { #name : #String }

{ #category : #'*Casino-Model-Importer-Java' }
String >> allRangesOfSubstringNoSurrouned: aSubstring [
	"('Ab cd ef Ab cd' allRangesOfSubstring: 'cd') >>> {(4 to: 5). (13 to: 14)}"

	"('Ab cd ef Ab cd' allRangesOfSubstring: 'zz') >>> #()"

	^ Array
		streamContents: [ :s | 
			| start subSize |
			start := 1.
			subSize := aSubstring size.
			[ start isZero ]
				whileFalse: [ start := self findString: aSubstring startingAt: start.
					start > 0
						ifTrue: [ ((start = 1 or: [ ((self at: start - 1) isAlphaNumeric or: [ (self at: start - 1) = $_ ]) not ])
								and: [ ((self at: start + subSize) isAlphaNumeric or: [ (self at: start + subSize) = $_ ]) not ]) ifTrue: [ s nextPut: (start to: start + subSize - 1) ].
							start := start + subSize ] ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> extractParameters [
	| st |
	st := (self withoutPrefix: '_Anonymous(').
	^ (( st
		    copyFrom: (st findString: '(') + 1
		    to: (st findLastOccurrenceOfString: ')' startingAt: 1) - 1)
		   findTokens: ','
		   escapedAndKeepBy: #( '""' '()' '{}' )) collect: [ :string | 
		  (string trim withoutPrefix: '"') withoutSuffix: '"' ]
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
	delimiterChars := (delimiters ifNil: [ '' ] ifNotNil: [ delimiters ])
		                  asString.
	quoteChars := quoteDelimiters
		              ifNil: [ {  } ]
		              ifNotNil: [ quoteDelimiters ].
	tokens := OrderedCollection new.
	rs := self readStream.
	activeEscapeCharacter := Stack new.
	ts := String new writeStream.
	[ rs atEnd ] whileFalse: [ 
		char := rs next.
		activeEscapeCharacter isEmpty
			ifTrue: [ 
				quoteChars
					detect: [ :array | array first == char ]
					ifOne: [ :array | 
						activeEscapeCharacter push: array second.
						ts nextPut: char ]
					ifNone: [ 
						(delimiterChars includes: char)
							ifTrue: [ 
								token := ts contents.
								tokens add: token.
								ts := String new writeStream ]
							ifFalse: [ ts nextPut: char ] ] ]
			ifFalse: [ 
				char == activeEscapeCharacter top
					ifTrue: [ 
						rs peek == activeEscapeCharacter
							ifTrue: [ ts nextPut: rs next ]
							ifFalse: [ 
								ts nextPut: char.
								activeEscapeCharacter pop ] ]
					ifFalse: [ ts nextPut: char ] ] ].
	token := ts contents.
	(tokens isEmpty and: [ token isEmpty ]) ifFalse: [ tokens add: token ].
	^ tokens
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> removeComment [
	| c withCR withLF |
	withCR := self includes: Character cr.
	withLF := self includes: Character lf.
	^ String
		streamContents: [ :stream | 
			self lines
				do: [ :line | 
					| start |
					start := line findString: '//'.
					start = 0
						ifTrue: [ stream << line ]
						ifFalse: [ stream << (line copyFrom: 1 to: start - 1).
							start to: line size do: [ :i | stream << ' ' ] ] ]
				separatedBy: [ withCR ifTrue: [ stream << Character cr ].
					withLF ifTrue: [ stream << Character lf ] ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
String >> replaceAllRegex: aRegexString withMultiples: anotherSubstring [
	| tempString aCollection |
	tempString := self.
	aCollection := aRegexString asRegex matchesIn: tempString.
	aCollection
		do: [ :subString | 
			| replaceString |
			replaceString := String streamContents: [ :stream | 1 to: subString size do: [ :number | stream << anotherSubstring ] ].
			tempString := tempString copyReplaceAll: subString with: replaceString ].
	^ tempString
]
