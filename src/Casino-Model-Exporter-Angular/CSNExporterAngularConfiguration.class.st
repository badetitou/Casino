Class {
	#name : #CSNExporterAngularConfiguration,
	#superclass : #Object,
	#instVars : [
		'mapping'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #initialization }
CSNExporterAngularConfiguration >> angularRepresentationOf: aCSNWidget [

	mapping
		at: aCSNWidget
		ifPresent: [ :widgetRepresentation | ^ widgetRepresentation ].
	aCSNWidget class withAllSuperclasses do: [ :class | 
		mapping
			at: class
			ifPresent: [ :widgetRepresentation | ^ widgetRepresentation ] ].
	^ WidgetRepresentation new
]

{ #category : #initialization }
CSNExporterAngularConfiguration >> at: aWidgetClass put: aWidgetRepresentationInstance [
	mapping at: aWidgetClass put: aWidgetRepresentationInstance
]

{ #category : #initialization }
CSNExporterAngularConfiguration >> defaultConfiguration [

	^ { 
		  (CSNWidget -> WidgetRepresentation new).
		  (CSNUIPanel -> HTMLDivPanelComponent new) } asDictionary
]

{ #category : #initialization }
CSNExporterAngularConfiguration >> initialize [
	super initialize.
	mapping := self defaultConfiguration
]
