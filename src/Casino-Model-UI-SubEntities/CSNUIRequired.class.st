"
The required attribute specifies that an input field must be filled out before submitting the form.

The required attribute works with the following input types: text, search, url, tel, email, password, date pickers, number, checkbox, radio, and file.
"
Class {
	#name : #CSNUIRequired,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIRequired class >> annotation [

	<FMClass: #Required super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]
