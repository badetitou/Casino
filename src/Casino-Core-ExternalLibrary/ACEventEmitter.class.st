Class {
	#name : #ACEventEmitter,
	#superclass : #AngularModule,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
ACEventEmitter >> exportTypeScriptImportOf: widget usingExporter: anExporter [

	anExporter <<| 'import { EventEmitter } from ''@angular/core'';'
]

{ #category : #accessing }
ACEventEmitter >> isLocal [

	^ true
]
