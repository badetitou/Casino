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
	#name : #CSNModelExporterAngular,
	#superclass : #CSNModelExporter,
	#instVars : [
		'currentPath'
	],
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #actions }
CSNModelExporterAngular class >> convertIfString: anObject [
	anObject isString
		ifTrue: [ ^ '"' , anObject , '"' ].
	^ anObject 
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath [
	^ currentPath 
]

{ #category : #accessing }
CSNModelExporterAngular >> currentPath: anObject [
	currentPath := anObject
]

{ #category : #api }
CSNModelExporterAngular >> prepareExport [
	root := (FileSystem disk workingDirectory / model name) asFileReference.
]

{ #category : #api }
CSNModelExporterAngular >> protectString: aString [
	^ ((aString copyReplaceAll: '"' with: '&quot;') copyReplaceAll: '<' with: '&lt;') copyReplaceAll: '>' with: '&gt;' 
]

{ #category : #accessing }
CSNModelExporterAngular >> root [
	^ root
]

{ #category : #accessing }
CSNModelExporterAngular >> rootPhases [
	^ self root / 'phases'
]

{ #category : #accessing }
CSNModelExporterAngular >> serviceRoot [
	^ self root / 'services'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitAttribute: aBLAttribute [
	^ self protectString: aBLAttribute attributeValue asString
]

{ #category : #visiting }
CSNModelExporterAngular >> visitCell: aBLCell [
	^ self visit: (aBLCell widget ifNil: [ ^ '' ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitHTML: aBLHTML [
	^ '', (aBLHTML widgets flatCollect: [ :widget | String crlf , (self visit: widget) , String crlf ])
]

{ #category : #visiting }
CSNModelExporterAngular >> visitLayout: aBLLayout [
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
CSNModelExporterAngular >> visitMooseModel: aMooseModel [
	| rootPhases rootComponents |
	self root createDirectory.
	"Write app.module.ts"
	self writeFile: self root / aMooseModel getModuleName withCode: aMooseModel generateModuleSourceCode.
	"Write app.route.ts"
	self writeFile: self root / aMooseModel getRouteName withCode: aMooseModel generateRouteSourceCode.
	"Write components"
	rootComponents := self root / 'components' / 'index'.
	rootComponents ensureCreateDirectory.
	self writeFile: rootComponents / aMooseModel getHTMLName withCode: aMooseModel generateHTMLSourceCode.
	self writeFile: rootComponents / aMooseModel getTSName withCode: aMooseModel generateTSSourceCode.
	rootPhases := root / 'phases'.
	rootPhases createDirectory.
	aMooseModel allCSNPage
		do: [ :aPage | 
			self class new
				currentPath: self rootPhases / aPage name;
				visit: aPage ].
	aMooseModel allCSNService do: [ :rootElement | self visit: rootElement ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitPage: aBLPhase [
	| phaseRoot componentsRoot indexRoot |
	phaseRoot := self currentPath.
	phaseRoot ensureCreateDirectory.
	"Write phase.module.ts"
	self writeFile: phaseRoot / aBLPhase getModuleName withCode: (aBLPhase generateModuleSourceCodeWith: self).
	"Write phase.route.ts"
	self writeFile: phaseRoot / aBLPhase getRouteName withCode: aBLPhase generateRouteSourceCode.
	"Write components"
	componentsRoot := self currentPath / 'components'.
	componentsRoot ensureCreateDirectory.
	indexRoot := componentsRoot / 'index'.
	indexRoot ensureCreateDirectory.
	self writeFile: indexRoot / aBLPhase getTSName withCode: aBLPhase generateTSSourceCode.
	self writeFile: indexRoot / aBLPhase getHTMLName withCode: (aBLPhase generateHTMLSourceCodeWith: self).
	aBLPhase businessPage
		do: [ :metier | 
			self class new
				currentPath: componentsRoot / metier getAcceptedName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitPageMetier: aBLPageMetier [
	| pageMetierRoot |
	pageMetierRoot := self currentPath.
	[ pageMetierRoot ensureCreateDirectory ]
		on: DirectoryExists
		do: [  ].
	"Write pageMetier.module.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getHTMLName withCode: (aBLPageMetier generateHTMLSourceCodeWith: self).
	"Write pageMetier.route.ts"
	self writeFile: pageMetierRoot / aBLPageMetier getTSName withCode: (aBLPageMetier generateTSSourceCodeWith: self).
	aBLPageMetier metiers
		do: [ :metier | 
			self class new
				currentPath: pageMetierRoot / 'components' / metier getFolderName;
				visit: metier ]
]

{ #category : #visiting }
CSNModelExporterAngular >> visitSplitButton: aBLSplitButton [
	^  '<' , (aBLSplitButton getListPropertiesAsStringWith: self) , '></' , aBLSplitButton getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIAbsoluteHeight: aBLUIAbsoluteHeight [
	^ self protectString: aBLUIAbsoluteHeight attributeValue, 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIAbsoluteWidth: aBLUIAbsoluteWidth [
	^ self protectString: aBLUIAbsoluteWidth attributeValue , 'px'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIContainer: aBLUIContainer [
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
CSNModelExporterAngular >> visitUIGridLayout: aBLUIGridLayout [
	^ '<' , (aBLUIGridLayout container getListPropertiesAsStringWith: self) , '>' , '<tbody>'
		,
			((0 to: aBLUIGridLayout maxLevel)
				flatCollect: [ :number | 
					'<tr>'
						,
							(((aBLUIGridLayout atLevelSorted: number) reject: #isNil)
								flatCollect: [ :cell | 
									(String crlf , '<td'
										,
											((cell attributesTagWith: self) , '>' , String crlf
												, ((self visit: cell) indentBy: 4) , String crlf , '</td>') indentBy: 4)
										, String crlf ]) , '</tr>' ]) , String crlf , '</tbody>' , '</'
		, aBLUIGridLayout container getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIHeight: aBLUIHeight [
	^ self protectString: aBLUIHeight attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIImage: aBLUIImage [
	^   '<' ,  (aBLUIImage getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputColor: aBLUIInputColor [
	^ '<' ,  (aBLUIInputColor getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputDate: aBLUIInputDate [
	^ '<' ,  (aBLUIInputDate getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputFile: aBLUIInputFile [
	^ '<' , (aBLUIInputFile getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputMonth: aBLUIInputMonth [
	^ '<'
		,
			(aBLUIInputMonth
				getListPropertiesAsStringWith: self)
		,
			' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputNumber: aBLUIInputNumber [
	^ '<' ,  (aBLUIInputNumber getListPropertiesAsStringWith: self), ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputPassword: aBLUIInputPassword [
	^ '<' ,  (aBLUIInputPassword getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputText: aBLUIInputText [
	^  '<input id="float-' , aBLUIInputText mooseID asString , '" type="text" value="' , aBLUIInputText value1
		,
			'" placeholder="', aBLUIInputText text,'" pInputText>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIInputTime: aBLUIInputTime [
	^ '<' , (aBLUIInputTime getListPropertiesAsStringWith: self) , ' />'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUILabel: aBLUILabel [
	^ self protectString: aBLUILabel attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUILeaf: aBLUILeaf [
		^ '<' , (aBLUILeaf getListPropertiesAsStringWith: self) , '>'
		, (( aBLUILeaf attributes select: [ :a | a isKindOf: CSNUILabel])
				flatCollect:
					[ :attribute | String crlf , (self visit: attribute ), String crlf ]) 
		, '</' , aBLUILeaf getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIName: aBLUIName [
	^ self protectString: aBLUIName attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIPanel: aBLUIPanel [
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
CSNModelExporterAngular >> visitUIParagraph: aBLUIParagraph [
	^ '<' , (aBLUIParagraph getListPropertiesAsStringWith: self) , '>'
		, (( aBLUIParagraph attributes select: [ :a | a isKindOf: CSNUILabel])
				flatCollect:
					[ :attribute | String crlf , ((self visit: attribute ) indentBy: 4), String crlf ]) 
		, '</' , aBLUIParagraph getSelector , '>'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIPlaceholder: aBLUIPlaceholder [
	^ self protectString: aBLUIPlaceholder attributeValue
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIRelativeHeight: aBLUIRelativeHeight [
	^ self protectString: aBLUIRelativeHeight attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIRelativeWidth: aBLUIRelativeWidth [
	^ self protectString: aBLUIRelativeWidth attributeValue , '%'
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUISelect: aBLUISelect [
	^ '<' , (aBLUISelect getListPropertiesAsStringWith: self) , '>', String crlf , '</' , aBLUISelect getSelector , '>' 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUITitle: aBLUITitle [
	^ self protectString: aBLUITitle attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitUIWidth: aBLUIWidth [
	^ self protectString: aBLUIWidth attributeValue 
]

{ #category : #visiting }
CSNModelExporterAngular >> visitWidget: aBLWidget [
	^ '<' , (aBLWidget getListPropertiesAsStringWith: self) , '>'
		, (('',
			(( aBLWidget widgets)
				flatCollect:
					[ :widget | String crlf , (self visit: widget), String crlf ])) indentBy: 4)
		, '</' , aBLWidget getSelector , '>'
]

{ #category : #accessing }
CSNModelExporterAngular >> writeFile: aFileReference withCode: theSourceCode [
	(aFileReference writeStream nextPutAll: theSourceCode) flush
]
