"
""LOAD FAST""

""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.
BLMetamodelGenerator resetMetamodel.


""Generate BlApp""
mooseModel := MooseModel importFromMSEStream:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' asFileReference readStream.
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.

""Generate Bl Model""
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.
"
Class {
	#name : #BLModelExporterAngular,
	#superclass : #BLModelExporter,
	#category : #'BL-Model-Exporter-Angular'
}

{ #category : #actions }
BLModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject , '"' ].
	^ anObject 
]

{ #category : #api }
BLModelExporterAngular >> prepareExport [
	root := (FileSystem disk workingDirectory / model name) asFileReference.
]

{ #category : #accessing }
BLModelExporterAngular >> root [
	^ root
]

{ #category : #accessing }
BLModelExporterAngular >> rootPhases [
	^ self root / 'phases'
]

{ #category : #accessing }
BLModelExporterAngular >> serviceRoot [
	^ self root / 'services'
]

{ #category : #accessing }
BLModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
