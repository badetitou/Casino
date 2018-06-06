"
""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate BlApp""
aw := AnalyseCommand new.
""fileName := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'. ""
fileName := 'D:\Developpement\mse\Copie-SourceAndDependencies\BLGRHGwt\src\fr\bl\GRH.module.xml'. 
xml := aw getXmlFile: fileName.
""mseFile := StandardFileStream fileNamed: 'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .""
mseFile := StandardFileStream fileNamed: 'D:\Developpement\mse\verveinej\BLGRH.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
""mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.""
mooseModel rootFolder: 'D:\Developpement\mse\Copie-SourceAndDependencies'.

""From BL-Model-Explorer""
blApp := BLApplication new model: mooseModel; applicationXml: xml ; sourceApp: './Source/BLCoreIncubatorGwt/'; sourceCore: './Source/BLCore-6.1.4/'.

""Generate Bl Model""
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and: xml.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngular export: model.

"
Class {
	#name : #BLModelExporterAngular,
	#superclass : #BLModelExporter,
	#category : 'BL-Model-Exporter-Angular'
}

{ #category : #actions }
BLModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject protectQuote , '"' ].
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
