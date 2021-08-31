Class {
	#name : #BLMBusinessPage,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #testing }
BLMBusinessPage >> importString [
	^ ''
]

{ #category : #accessing }
BLMBusinessPage >> internalDependenciesOf: aCSNBusinessPage [
	^ aCSNBusinessPage metiers ifEmpty: [ {  } ] ifNotEmpty: [ ^ { MCTabGroup new } ]
]

{ #category : #testing }
BLMBusinessPage >> isLocal [
	^ true
]
