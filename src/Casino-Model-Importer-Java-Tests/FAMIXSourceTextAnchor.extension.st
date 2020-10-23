Extension { #name : #FAMIXSourceTextAnchor }

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FAMIXSourceTextAnchor >> endPos [
	^ self attributeAt: #endPos ifAbsent: [ self source size ]
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FAMIXSourceTextAnchor >> endPos: endPos [
	self attributeAt: #endPos ifAbsentPut: endPos
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FAMIXSourceTextAnchor >> startPos [
	^ self attributeAt: #startPos ifAbsent: [ 0 ]
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FAMIXSourceTextAnchor >> startPos: aStartPos [
	self attributeAt: #startPos ifAbsentPut: aStartPos
]
