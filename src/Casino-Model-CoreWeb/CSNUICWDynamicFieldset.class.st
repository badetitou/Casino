Class {
	#name : #CSNUICWDynamicFieldset,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWDynamicFieldset class >> annotation [

	<MSEClass: #DynamicFieldset super: #CSNAttribute>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUICWDynamicFieldset >> attributeValue [
	^ 'true' 
]

{ #category : #accessing }
CSNUICWDynamicFieldset >> name [
	^ 'open'
]
