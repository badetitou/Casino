Class {
	#name : #CSNBehaviorModelExporterIdentity,
	#superclass : #CSNBehaviorModelExporterCoreWeb,
	#instVars : [
		'currentModule'
	],
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb-BLIdentity'
}

{ #category : #accessing }
CSNBehaviorModelExporterIdentity >> currentModule [

	^ currentModule
]

{ #category : #accessing }
CSNBehaviorModelExporterIdentity >> currentModule: anObject [

	currentModule := anObject
]

{ #category : #visiting }
CSNBehaviorModelExporterIdentity >> visitNavigation: aNavigation [
	self <<< 'this.openPhase('.
	aNavigation page
		ifNotNil: [ :page | 
			self
				<<< '''';
				<<< self currentModule name;
				<<< '/';
				<<< page name;
				<<< '''' ]
		ifNil: [ self <<< '''TODO''' ].
	self <<< ')'
]
