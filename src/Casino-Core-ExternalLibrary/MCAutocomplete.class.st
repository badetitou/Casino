Class {
	#name : #MCAutocomplete,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
MCAutocomplete class >> getSelector [
	^ 'mat-autocomplete'
]

{ #category : #accessing }
MCAutocomplete class >> moduleName [
	^ 'MatAutocompleteModule'
]

{ #category : #accessing }
MCAutocomplete class >> modulePath [
	^ '@angular/material/autocomplete'
]
