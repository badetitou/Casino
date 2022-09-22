Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getAcceptedName [
	^ self uniqueName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getComponentsPageMetierListName [
	^ self recursiveMetiers flattened flatCollect: [ :metier | '    ', metier componentName, ',', String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getFolderName [
	^ self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getHTMLName [
	^ self getAcceptedName  , '.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalComponentPath [
	^ self getLocalPath  , '/' , self name , '.component'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalModulePath [
	^ self getAcceptedName, '/' , self getAcceptedName , '.module'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalPath [
	^ ''
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getMetadata [

	" asString :
{ 
    id: 'phase1_2',
    code: 'phase1',
    codePhase: 'a long name',
    label: 'Phase 1 - 2',
    link: 'phase1',
    subLabel: 'Bienvenue sur la phase 1 - 2',
    icon: 'address-book',
    datas: {'text': '2'}
}
   "

	^ '{
    id: ''' , self getAcceptedName , ''',
    code: ''' , (self codePhase ifNil: [ self name asRealCamelCase ])
	  , ''',
    codePhase: ''' , (self codePhase ifNil: [ '' ]) protectQuote
	  , ''',
    label: ''' , ((self attributes
		    detect: [ :att | att isKindOf: CSNUITitle ]
		    ifFound: [ :attTitle | attTitle attributeValue ]
		    ifNone: [ self title ]) ifNil: [ '' ]) protectQuote , ''',
    link: ''' , self name asRealCamelCase , ''',
    subLabel: ''' , (self subtitle ifNil: [ '' ]) protectQuote , ''',
    icon: ''address-book'',
    datas: {},
}'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleClassName [
	^ self getAcceptedName , 'Module'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleName [
	^ self getAcceptedName , '.module.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getRouteName [
	^ self getAcceptedName , '.route.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getSelector [
	^ 'bl-' , self mooseModel name , '-' , self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getTSName [
	^ self getAcceptedName  , '.component.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getTag [
	^ '<' , self getSelector , '>' , '</' , self getSelector , '>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> rootFromExporter: anExporter [
	^ anExporter rootPhases / self name
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> sortedPageMetiers [
	^ self businessPage asOrderedCollection
		sort: [ :pageMetier1 :pageMetier2 | pageMetier1 addingPosition < pageMetier2  addingPosition ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> uniqueName [
	| dic |
	dic := self mooseModel
		cacheAt: #pageUniqueName
		ifAbsentPut: [ {(self -> self name asRealCamelCase)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self name asRealCamelCase.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := (potentialName removeSuffix: index asString)
						, index asString.
					index := index + 1 ].
			potentialName ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesFrom: anExporter [

	^ (((self recursiveMetiers collect: #recursiveWidgets) , { 
		    self.
		    self recursiveMetiers }) flattened collect: [ :el | el getExternalDependenciesFrom: anExporter ]) flattened asSet asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesImportInstructionFrom: anExporter [
	^ ''
		,
			(((((self widgetsDependenciesFrom: anExporter) reject: [:a | a isLocal ])
				collect: [ :dependency | dependency importString , String crlf ]) as: Set) asOrderedCollection sorted: [ :a :b | a < b ]) flatten
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesNameFrom: anExporter [

	^ ''
	  ,
		 ((((self widgetsDependenciesFrom: anExporter) reject: [ :a | a isLocal ]) collect: [ :dependency | '        ' , dependency moduleName , ',' , String crlf ])
			  asSet asOrderedCollection sorted: [ :a :b | a < b ]) flatten
]
