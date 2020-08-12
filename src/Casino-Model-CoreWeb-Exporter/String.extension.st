Extension { #name : #String }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asKebabCase [
	^ self class
		streamContents: [ :stream | 
			self uncapitalized
				do: [ :char | 
					char isUppercase
						ifTrue: [ stream << '-' << char asLowercase ]
						ifFalse: [ stream << char ] ] ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asRealCamelCase [
		^ self class streamContents: [:stream |
               (self substrings: (CSSeparators add: $_; yourself)) do: [:sub |
                       stream nextPutAll: sub translateToLowercase capitalized]]
]
