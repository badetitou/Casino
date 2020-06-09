Extension { #name : #String }

{ #category : #'*Casino-Model-Toolkit' }
String >> findCloseBracketFor: startIndex [
	"assume (self at: startIndex) is ${.  Find the matching $}, allowing parentheses to nest."

	| pos nestLevel |
	pos := startIndex + 1.
	nestLevel := 1.
	pos to: self size do: [ :index | 
		(self at: index) = ${ ifTrue: [ nestLevel := nestLevel + 1 ].
		(self at: index) = $} ifTrue: [ nestLevel := nestLevel - 1 ].
		nestLevel = 0 ifTrue: [ ^ index ] ].
	^ self size + 1
]

{ #category : #'*Casino-Model-Toolkit' }
String >> inParenthesis [
	^ self class
		streamContents: [ :s | 
			s nextPut: $(.
			s nextPutAll: self.
			s nextPut: $) ]
]
