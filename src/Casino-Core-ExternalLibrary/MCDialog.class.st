Class {
	#name : #MCDialog,
	#superclass : #MaterialComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #export }
MCDialog >> export: aWidget with: anExporter [
"self halt. "
	anExporter generateAsSubComponent: aWidget
]

{ #category : #'export - typescript' }
MCDialog >> exportTypeScriptConstructorInjectionOf: widget usingExporter: anExporter [

	anExporter <<| 'private _fb: FormBuilder,'
]

{ #category : #'export - typescript' }
MCDialog >> exportTypeScriptOnInitOf: widget usingExporter: anExporter [

	anExporter printBuildTSFormGroupFor: widget.
]

{ #category : #'export - typescript' }
MCDialog >> exportTypeScriptVariableOf: widget usingExporter: anExporter [

	(anExporter << 'public ')
		<<< widget id uncapitalized;
		<<<| 'Form : FormGroup;'.
]

{ #category : #accessing }
MCDialog >> getSelector [
	^ 'div'
]

{ #category : #'accessing - form' }
MCDialog >> isFormContainer [
	"If true this representation support the formControl"
	^ true
]

{ #category : #'accessing - testing' }
MCDialog >> isSubComponent: aWidget [

	^ true
]

{ #category : #accessing }
MCDialog >> moduleName [
	^ 'MatDialogModule'
]

{ #category : #accessing }
MCDialog >> modulePath [
	^ '@angular/material/dialog'
]
