Extension { #name : #FamixJavaSourceAnchor }

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FamixJavaSourceAnchor >> endPos [
	^ self attributeAt: #endPos ifAbsent: [ self source size ]
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FamixJavaSourceAnchor >> endPos: endPos [
	self attributeAt: #endPos ifAbsentPut: endPos
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FamixJavaSourceAnchor >> startPos [
	^ self attributeAt: #startPos ifAbsent: [ 0 ]
]

{ #category : #'*Casino-Model-Importer-Java-Tests' }
FamixJavaSourceAnchor >> startPos: aStartPos [
	self attributeAt: #startPos ifAbsentPut: aStartPos
]
