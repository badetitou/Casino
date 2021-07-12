Class {
	#name : #MCAutocomplete,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCAutocomplete >> getSelector [
	^ 'mat-autocomplete'
]

{ #category : #accessing }
MCAutocomplete >> moduleName [
	^ 'MatAutocompleteModule'
]

{ #category : #accessing }
MCAutocomplete >> modulePath [
	^ '@angular/material/autocomplete'
]
