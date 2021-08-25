Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getAcceptedName [
	^ (self name splitOn: ':') last asRealCamelCase
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
	^ self name asRealCamelCase, '/' , self getAcceptedName , '.module'
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
    id: ''' , self name ,''',
    code: ''' , self codeValue,''',
    codePhase: ''' , (self codePhase ifNil: ['']) protectQuote,''',
    label: ''' , (self title ifNil: ['']) protectQuote ,''',
    link: ''' , self name,''',
    subLabel: ''' , (self subtitle ifNil: ['']) protectQuote, ''',
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
CSNPage >> widgetsDependenciesFrom: anExporter [
	"At the level of the Phase, we don't need recursive external import (for the module file)... It's only in the TS file"

	^ ((self recursiveMetiers collect: #recursiveWidgets) flattened collect: [:el | el getExternalDependencyFrom: anExporter ])
		flattened asSet asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesImportInstructionFrom: anExporter [
	^ ''
		,
			((((self widgetsDependenciesFrom: anExporter) reject: [:a | a isLocal ])
				collect: [ :dependency | dependency importString , String crlf ]) as: Set) asOrderedCollection flatten
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> widgetsDependenciesNameFrom: anExporter [
	^ ''
		,
			(((self widgetsDependenciesFrom: anExporter) reject: [:a | a isLocal ])
				flatCollect: [ :dependency | '        ', dependency moduleName , ',' , String crlf ])
]
