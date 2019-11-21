"
I am a copy of class ZnMultiValueDictionary. This comment is copied from there, and might not be entirely accurate

I am ZnMultiValueDictionary. 
I am a Dictionary.

I offer an #at:add: method to transparently create Array valued multi entries when needed.
My #keysAndValuesDo: is overwritten to transparently deal with multi entries.
To merge two instance preserving multiple values you can use #addAllMulti:
I normally limit the number of entries to protect me from resource abuse.

Note that most other methods will show the actual value.

Part of Zinc HTTP Components.
"
Class {
	#name : #CSNMultiValueDictionary,
	#superclass : #Dictionary,
	#category : #'Casino-Model-Importer-Java'
}

{ #category : #'instance creation' }
CSNMultiValueDictionary class >> newFrom: aDict [
	"Answer an instance of me containing the same associations as aDict.
	 Error if any key appears twice."

	| newDictionary |
	newDictionary := self new: aDict size.
	aDict associationsDo: [ :x | newDictionary at: x key add: x value ].
	^ newDictionary
]

{ #category : #adding }
CSNMultiValueDictionary >> addAllMulti: keyedCollection [
	"Note that we use #at:add:"

	keyedCollection keysAndValuesDo: [ :key :value | 
		self at: key add: value ]
]

{ #category : #accessing }
CSNMultiValueDictionary >> at: key add: value [
	"Store value under key. If key already exists, store multiple values as Array"
	
	| existingValue newValue |
	existingValue := self at: key ifAbsent: [ nil ].
	newValue := existingValue isNil
		ifTrue: [ Array with: value ] 
		ifFalse: [
			existingValue isArray 
				ifTrue: [ existingValue copyWith: value ]
				ifFalse: [ Array with: existingValue with: value ] ].
	^ self at: key put: newValue 


]

{ #category : #enumerating }
CSNMultiValueDictionary >> keysAndValuesDo: block [
	"Execute a two argument (key, value) block for each header.
	Multi-valued headers are handled transparently."

	super keysAndValuesDo: [ :key :value |
		value isArray
			ifTrue: [ 
				value do: [ :each | 
					block value: key value: each ] ]
			ifFalse: [
				block value: key value: value ] ]
]
