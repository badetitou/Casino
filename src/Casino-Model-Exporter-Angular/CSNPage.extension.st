Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> componentSubWidgetsUsing: anExporter [

	"I returned sub widgets in the sub component (for instance, not going inside dialog definition)"

	| widgs |
	widgs := (self widgets, self businessPage , (self layout
		           ifNotNil: [ :a | 
		           a cell collect: #widget thenReject: #isNil ]
		           ifNil: [ {  } ]) reject: [ :el | el = self ]) reject: [ 
		         :w | 
		         (anExporter angularRepresentationOf: w) isSubComponent: w ].

	^ { 
		  widgs.
		  (widgs collect: [ :w | w componentSubWidgetsUsing: anExporter ]) }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getComponentSelector [
	^ self getSelector
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getComponentsPageMetierListName [

	^ self recursiveMetiers flattened flatCollect: [ :metier | 
		  '    ' , metier componentName , ',' , String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getFolderName [
	^ self getAcceptedPathName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getHTMLName [

	^ self getAcceptedPathName , '.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalComponentPath [

	^ self getLocalPath , '/' , self getAcceptedPathName , '.component'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getLocalModulePath [
	^ self getAcceptedPathName, '/' , self getAcceptedPathName , '.module'
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
    datas: {'text': '2'}
}
   "

	^ '{
        id: ''' , self getAcceptedName , ''',
        code: ''' , (self codePhase ifNil: [ self name asRealCamelCase ])
	  , ''',
        codePhase: ''' , (self codePhase ifNil: [ '' ]) protectQuote
	  , ''',
        gwtCodePhase: ''', (self codeValue ifNil: [ '' ]) ,''',
        label: ''' , ((self attributes
		    detect: [ :att | att isKindOf: CSNUITitle ]
		    ifFound: [ :attTitle | attTitle attributeValue ]
		    ifNone: [ self title ]) ifNil: [ '' ]) protectQuote , ''',
        link: ''' , self name asRealCamelCase , ''',
        datas: {},
    }'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleClassName [
	^ self getAcceptedName , 'Module'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getModuleName [
	^ self getAcceptedPathName , '.module.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getRouteName [
	^ self getAcceptedPathName , '.route.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getSelector [
	^ 'bl-' , self mooseModel name , '-' , self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> getTag [
	^ '<' , self getSelector , '>' , '</' , self getSelector , '>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> id [
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
CSNPage >> pageSubComponentsUsing: anExporter [
	
	^ self recursiveWidgets flattened select: [ :widget | 
		  (anExporter angularRepresentationOf: widget) isSubComponent: widget ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNPage >> recursiveWidgets [

	^ ((self recursiveMetiers collect: #recursiveWidgets) , { 
		   self.
		   self recursiveMetiers.
		   super recursiveWidgets }) flattened
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

	^ (self recursiveWidgets collect: [ :el | 
		   el getExternalDependenciesFrom: anExporter ]) flattened asSet
		  asOrderedCollection
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

	^ '' , ((((self widgetsDependenciesFrom: anExporter) reject: [ :a | 
		     a isLocal ]) collect: [ :dependency | 
		    '        ' , dependency moduleName , ',' , String crlf ]) asSet
		   asOrderedCollection sorted: [ :a :b | a < b ]) flatten
]
