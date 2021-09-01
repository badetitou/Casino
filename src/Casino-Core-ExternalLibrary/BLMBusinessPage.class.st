Class {
	#name : #BLMBusinessPage,
	#superclass : #BLMaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
BLMBusinessPage >> importString [
	^ ''
]

{ #category : #accessing }
BLMBusinessPage >> importStringOf: aWidget [
	^  'import { ' , aWidget componentName , ' } from ''.' , aWidget getLocalComponentPath , ''';'
]

{ #category : #accessing }
BLMBusinessPage >> internalDependenciesOf: aCSNBusinessPage [
	^ aCSNBusinessPage metiers ifEmpty: [ {  } ] ifNotEmpty: [ ^ { MCTabGroup new } ]
]

{ #category : #testing }
BLMBusinessPage >> isLocal [
	^ true
]
