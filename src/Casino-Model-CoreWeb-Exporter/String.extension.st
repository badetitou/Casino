Extension { #name : #String }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asConsecutiveExpendedString [

	"convert the consecutive camel case to long string.
	ACamelCase >> a ACamel Case"

	^ self class streamContents: [ :stream | 
		  | previousUpper |
		  previousUpper := false.
		  self do: [ :char | 
			  (char isUppercase and: [ previousUpper not ]) ifTrue: [ stream nextPut: $  ].
			  previousUpper := char isUppercase.
			  stream nextPut: char ] ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asExpendedString [

	"convert the camelCase to long string.
	ACamelCase >> a A Camel Case"

	^ self class streamContents: [ :stream | 
		  self do: [ :char | 
			  char isUppercase ifTrue: [ stream nextPut: $  ].
			  stream nextPut: char ] ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asRealCamelCase [

	^ self class streamContents: [ :stream | 
		  (self asConsecutiveExpendedString substrings:
			   (CharacterSet newFrom: #( $_ $- $  ))) do: [ :sub | 
			  stream nextPutAll: sub asLowercase capitalized ] ]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asUpperSnakeCase [

	^ self class streamContents: [ :stream | 
		  (self asExpendedString substrings: (CSSeparators
				    add: $_;
				    yourself)) do: [ :sub | stream nextPutAll: sub asUppercase ] separatedBy: [ stream nextPut: $_ ] ]
]
