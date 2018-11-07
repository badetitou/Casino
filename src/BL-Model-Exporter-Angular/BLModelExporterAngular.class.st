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

{ #category : #api }
BLModelExporterAngular >> protectString: aString [
	^ aString copyReplaceAll: '"' with: '&quot;' 
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
BLModelExporterAngular >> visitBLAttribute: aBLAttribute [
	^ aBLAttribute attributeValue asString
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLCell: aBLCell [
	^ self visit: (aBLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLHTML: aBLHTML [
	^ aBLHTML widgets flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ]
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLLayout: aBLLayout [
	^ '<' , (aBLLayout container getListPropertiesAsStringWith: self) , '>'
		,
			(''
				,
					({aBLLayout container widgets.
					(aBLLayout cell)} flatten
						flatCollect: [ :widget | String crlf , (self visit: widget) ])
				indentBy: 4) , String crlf, '</' , aBLLayout container getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLPageMetier: aBLPageMetier [
	| pageMetierRoot |
	pageMetierRoot := (aBLPageMetier container componentsRootFromExporter: self)
		/ aBLPageMetier getFolderName.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].
	"Write pageMetier.module.ts"
	self
		writeFile: pageMetierRoot / aBLPageMetier getHTMLName
		withCode: (aBLPageMetier
		generateHTMLSourceCodeWith: self).
	"Write pageMetier.route.ts"
	self
		writeFile: pageMetierRoot / aBLPageMetier getTSName
		withCode: aBLPageMetier generateTSSourceCode.
	aBLPageMetier metiers do: [ :metier | self visit: metier ]
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

{ #category : #visiting }
BLModelExporterAngular >> visitBLSplitButton: aBLSplitButton [
	^  '<' , (aBLSplitButton getListPropertiesAsStringWith: self) , '></' , aBLSplitButton getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIContainer: aBLUIContainer [
	^ aBLUIContainer layout
		ifNotNil: [ :layout | self visit: layout ]
		ifNil: [ '<' , (aBLUIContainer getListPropertiesAsStringWith: self) , '>'
				,
					(''
						,
							(aBLUIContainer widgets
								flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ])
						indentBy: 4), String crlf, '</' , aBLUIContainer getSelector , '>' ]
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIGridLayout: aBLUIGridLayout [
	^ '<' , (aBLUIGridLayout container getListPropertiesAsStringWith: self) , '>'
		,
			((0 to: aBLUIGridLayout cell size)
				flatCollect: [ :number | 
					| subset |
					(aBLUIGridLayout atLevel: number)
						ifEmpty: [ subset := 12 ]
						ifNotEmpty: [ subset := 12 / (aBLUIGridLayout atLevel: number) size.
							subset := subset < 1
								ifTrue: [ 1 ]
								ifFalse: [ subset floor ] ].
					((aBLUIGridLayout atLevelSorted: number) reject: #isNil)
						flatCollect: [ :cell | "indentBy: 4" String crlf , (self visit: cell) , String crlf ] ]) , '</'
		, aBLUIGridLayout container getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIImage: aBLUIImage [
	^   '<' ,  (aBLUIImage getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputDate: aBLUIInputDate [
	^ '<' ,  (aBLUIInputDate getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputMonth: aBLUIInputMonth [
	^ '<'
		,
			(aBLUIInputMonth
				getListPropertiesAsStringWith: self)
		,
			' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputNumber: aBLUIInputNumber [
	^ '<' ,  (aBLUIInputNumber getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputPassword: aBLUIInputPassword [
	^ '<' ,  (aBLUIInputPassword getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputText: aBLUIInputText [
	^  '<input id="float-' , aBLUIInputText mooseID asString , '" type="text" value="' , aBLUIInputText value1
		,
			'" placeholder="', aBLUIInputText text,'" pInputText>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIInputTime: aBLUIInputTime [
	^ '<' , (aBLUIInputTime getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUILabel: aBLUILabel [
	^ self protectString: aBLUILabel text
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUILeaf: aBLUILeaf [
		^ '<' , (aBLUILeaf getListPropertiesAsStringWith: self) , '>'
		, (( aBLUILeaf attributes select: [ :a | a isKindOf: BLUILabel])
				flatCollect:
					[ :attribute | String crlf , (self visit: attribute ), String crlf ]) 
		, '</' , aBLUILeaf getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIPanel: aBLUIPanel [
	^ aBLUIPanel layout
		ifNotNil: [ :layout | self visit: layout ]
		ifNil: [ '<' , (aBLUIPanel getListPropertiesAsStringWith: self) , '>'
				,
					(''
						,
							(aBLUIPanel widgets
								flatCollect: [ :widget | String crlf , (self visit: widget) ])
						indentBy: 4) , String crlf, '</' , aBLUIPanel getSelector , '>' ]
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIParagraph: aBLUIParagraph [
	^ '<' , (aBLUIParagraph getListPropertiesAsStringWith: self) , '>'
		, (( aBLUIParagraph attributes select: [ :a | a isKindOf: BLUILabel])
				flatCollect:
					[ :attribute | String crlf , ((self visit: attribute ) indentBy: 4), String crlf ]) 
		, '</' , aBLUIParagraph getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUIPlaceholder: aBLUIPlaceholder [
	^ self protectString: aBLUIPlaceholder text
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLUISelect: aBLUISelect [
	^ '<' , (aBLUISelect getListPropertiesAsStringWith: self) , '>', String crlf , '</' , aBLUISelect getSelector , '>' 
]

{ #category : #visiting }
BLModelExporterAngular >> visitBLWidget: aBLWidget [
	^ '<' , (aBLWidget getListPropertiesAsStringWith: self) , '>'
		, (('',
			(( aBLWidget widgets)
				flatCollect:
					[ :widget | String crlf , (self visit: widget), String crlf ])) indentBy: 4)
		, '</' , aBLWidget getSelector , '>'
]

{ #category : #visiting }
BLModelExporterAngular >> visitMooseModel: aMooseModel [
	| rootPhases rootComponents |
	self root createDirectory.
	"Write app.module.ts"
	self writeFile: self root / aMooseModel  getModuleName withCode: aMooseModel  generateModuleSourceCode.
	"Write app.route.ts"
	self writeFile: self root / aMooseModel getRouteName withCode: aMooseModel generateRouteSourceCode.
	"Write components"
	rootComponents := self root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	self writeFile: rootComponents / aMooseModel getHTMLName withCode: aMooseModel generateHTMLSourceCode.
	self writeFile: rootComponents / aMooseModel getTSName withCode: aMooseModel generateTSSourceCode.
	rootPhases := root / 'phases'.
	rootPhases createDirectory.
	(aMooseModel allBLPhase , aMooseModel allBLService) do: [ :rootElement | self visit: rootElement ]
]

{ #category : #accessing }
BLModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
