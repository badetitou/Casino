Extension { #name : #String }

{ #category : #'*BL-Model-Exporter-Angular' }
String >> protectQuote [
	^ self copyReplaceAll: '''' with: '\'''
]
