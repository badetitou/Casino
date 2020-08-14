Extension { #name : #String }

{ #category : #'*Casino-Helper' }
String >> asJavaComment [
	^ self class streamContents: [ :stream | self linesDo: [ :line | stream << '// ' << line. stream crlf ] ]
]

{ #category : #'*Casino-Helper' }
String >> asKebabCase [
	^ self class
		streamContents: [ :stream | 
			self uncapitalized
				do: [ :char | 
					char isUppercase
						ifTrue: [ stream << '-' << char asLowercase ]
						ifFalse: [ stream << char ] ] ]
]
