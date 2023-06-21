Extension { #name : #String }

{ #category : #'*Casino-Helper' }
String >> asJavaComment [
	^ self class streamContents: [ :stream | self linesDo: [ :line | stream << '// ' << line. stream crlf ] ]
]

{ #category : #'*Casino-Helper' }
String >> includesSubstring: substring at: index [

	"CSN taken from Pharo 9"

	"Answer true if the receiver contains the substring str exactly at index, false otherwise."

	"('abcdefgh' includesSubstring: 'de' at: 1) >>> false"
	"('abcdefgh' includesSubstring: 'de' at: 4) >>> true"

	| pos |
	pos := index - 1.

	^ index > 0 & (self size - pos >= substring size) and: [ 
		  substring allSatisfy: [ :char | 
			  pos := pos + 1.
			  (self at: pos) = char ] ]
]
