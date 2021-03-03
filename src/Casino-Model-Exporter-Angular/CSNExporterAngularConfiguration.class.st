Class {
	#name : #CSNExporterAngularConfiguration,
	#superclass : #Object,
	#instVars : [
		'mapping'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #initialization }
CSNExporterAngularConfiguration >> defaultConfiguration [
	^ { CSNWidget -> WidgetRepresentation } asDictionary
]

{ #category : #initialization }
CSNExporterAngularConfiguration >> initialize [
	super initialize.
	mapping := self defaultConfiguration
]
