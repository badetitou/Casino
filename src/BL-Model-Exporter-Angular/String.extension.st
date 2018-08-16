Extension { #name : #String }

{ #category : #'*BL-Model-Exporter-Angular' }
String >> indentBy: aNumber [
	^ self class streamContents: [ :str |
		self lines 
			do: [ :line | 1 to: aNumber do: [:i | str nextPutAll: ' ']. str nextPutAll: line]
			separatedBy: [str cr] ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
String >> protectQuote [
	^ self copyReplaceAll: '''' with: '\'''
]
