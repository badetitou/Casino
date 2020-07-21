Extension { #name : #String }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
String >> asRealCamelCase [
		^ self class streamContents: [:stream |
               (self substrings: (CSSeparators add: $_; yourself)) do: [:sub |
                       stream nextPutAll: sub translateToLowercase capitalized]]
]
