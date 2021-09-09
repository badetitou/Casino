Extension { #name : #String }

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
		^ self class streamContents: [:stream |
               (self substrings: (CSSeparators add: $_; yourself)) do: [:sub |
                       stream nextPutAll: sub translateToLowercase capitalized]]
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asUpperSnakeCase [

	^ self class streamContents: [ :stream | 
		  (self asExpendedString substrings: (CSSeparators
				    add: $_;
				    yourself)) do: [ :sub | stream nextPutAll: sub asUppercase ] separatedBy: [ stream nextPut: $_ ] ]
]
