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

{ #category : #visiting }
BLModelExporterAngular >> visitBLPageMetier: aBLPageMetier [
	| pageMetierRoot |
	pageMetierRoot := (aBLPageMetier container componentsRootFromExporter: self) / aBLPageMetier getFolderName.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].
	"Write pageMetier.module.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getHTMLName withCode: aBLPageMetier generateHTMLSourceCode.
	"Write pageMetier.route.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getTSName withCode: aBLPageMetier generateTSSourceCode.
	aBLPageMetier metiers do: [ :metier | metier accept: self ]
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLPhase: aBLPhase [
	| phaseRoot |
	phaseRoot := aBLPhase rootFromExporter: self.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	self writeFile: phaseRoot / aBLPhase getModuleName withCode: aBLPhase generateModuleSourceCode.
	"Write phase.route.ts"
	self writeFile: phaseRoot / aBLPhase getRouteName withCode: aBLPhase generateRouteSourceCode.
	"Write components"
	aBLPhase writeComponentsIn: phaseRoot withExporter: self
]

{ #category : #accessing }
BLModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
