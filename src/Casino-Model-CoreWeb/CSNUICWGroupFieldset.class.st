Class {
	#name : #CSNUICWGroupFieldset,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWGroupFieldset class >> annotation [

	<MSEClass: #GroupFieldset super: #CSNAttribute>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUICWGroupFieldset >> attributeValue [
	^ 'true'
]

{ #category : #accessing }
CSNUICWGroupFieldset >> name [
	^ 'group'
]
