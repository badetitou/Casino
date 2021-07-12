"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CSNELCWBLRechercheEtListeComponent,
	#superclass : #CoreWebBLComponent,
	#category : #'Casino-CoreWeb-ExternalLibrary'
}

{ #category : #accessing }
CSNELCWBLRechercheEtListeComponent >> exportContentOf: aWidget with: anExporter [
	anExporter
		indentPlus;
		crlf;
		<< '<span slot="bl-recherche-et-liste-criteria">';
		indentPlus;
		crlf.
	aWidget widgets
		do: [ :widget | 
			anExporter
				crlf;
				indentPlus.
			anExporter
				visit: widget;
				indentMinus ].
	anExporter
		indentMinus;
		crlf;
		<< '</span>';
		indentMinus.
		anExporter
		indentPlus;
		crlf;
		<< '<span slot="slot=bl-recherche-et-liste-results">';
		crlf;
		<< '</span>';
		indentMinus;
		crlf.
]

{ #category : #accessing }
CSNELCWBLRechercheEtListeComponent >> getSelector [
	^ 'bl-recherche-et-liste'
]

{ #category : #accessing }
CSNELCWBLRechercheEtListeComponent >> moduleName [
	^ 'RechercheEtListeComponent'
]

{ #category : #accessing }
CSNELCWBLRechercheEtListeComponent >> subModulePath [
	^ '/components/recherche-et-liste/recherche-et-liste.component'
]
