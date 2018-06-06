"
BLMetamodelGenerator new generate.


filePath := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.
xml := PPXmlParser parse: filePath asFileReference contents.

mseFile := StandardFileStream fileNamed:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .

mooseModel := MooseModel importFromMSEStream: mseFile .

mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.

blModelImporter := BLModelImporter new model: mooseModel; applicationXml: xml;
sourceApp: './Source/BLCoreIncubatorGwt/*';
sourceCore: './Source/BLCore-6.1.4/'.

blModelImporter generateBLModel.
"
Class {
	#name : #BLModelImporter,
	#superclass : #Object,
	#instVars : [
		'srcModel',
		'applicationXml',
		'sourceApp',
		'sourceCore',
		'model'
	],
	#category : 'BLModelImporter'
}

{ #category : #accessing }
BLModelImporter >> applicationXml [
	^ applicationXml
]

{ #category : #accessing }
BLModelImporter >> applicationXml: aXMLFile [
	applicationXml := aXMLFile
]

{ #category : #accessing }
BLModelImporter >> generateBLModel [
	model := MooseModel new
		metamodel: BLMetamodelGenerator metamodel;
		yourself.
	self importPhases.
	^ model
]

{ #category : #accessing }
BLModelImporter >> generatePhaseFromXmlElement: xmlElement [
	^ BLPhase new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | a replaceAllRegex: '\.' with: '::' ]
				ifNil: [ ((self model allModelClasses
						select: [ :e | 
							(e superInheritances collect: [ :a | a to name ])
								includes: 'HomePhaseController' ]) at: 1)
						mooseName ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue)
]

{ #category : #accessing }
BLModelImporter >> importPhases [
	self applicationXml
		nodesDo: [ :e | 
			e isElement
				ifTrue: [ e name localName = 'phase'
						ifTrue: [ model add: (self generatePhaseFromXmlElement: e) ] ] ]
]

{ #category : #accessing }
BLModelImporter >> sourceApp [
	sourceApp
]

{ #category : #accessing }
BLModelImporter >> sourceApp: aPath [
	sourceApp := aPath
]

{ #category : #accessing }
BLModelImporter >> sourceCore [
	^ sourceCore
]

{ #category : #accessing }
BLModelImporter >> sourceCore: aPath [
	sourceCore := aPath
]

{ #category : #accessing }
BLModelImporter >> srcModel [
	^ srcModel
]

{ #category : #accessing }
BLModelImporter >> srcModel: aMooseModel [
	srcModel := aMooseModel
]
