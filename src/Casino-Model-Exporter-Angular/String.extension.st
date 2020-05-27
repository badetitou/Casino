Extension { #name : #String }

{ #category : #'*Casino-Model-Exporter-Angular' }
String >> protectQuote [
	^ ((self copyReplaceAll: '\"' with: '"') copyReplaceAll: '\' with: '\\') copyReplaceAll: '''' with: '\'''
]
