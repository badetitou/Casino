Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> behaviors [
	^ (self collectPhaseCalled
		ifNotEmpty:
			[ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ]
		ifEmpty: [ '' ])
		,
			((self calledBehavior collect: #serviceOwner) removeDuplicates
				flatCollect: [ :aService | aService initializeVariable , ', ' ])
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> calledBehavior [
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget behaviors ]) flattened asOrderedCollection removeDuplicates
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> collectPhaseCalled [
	
	^ (self recursiveWidgets flattened flatCollect: [ :localWidget | (localWidget actions select: #isActionAppel thenCollect: #call) select: #isNotNil  ]) asSet asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getAcceptedName [
	^ (self name splitOn: ':') last
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getBehaviorImportString [
	"*BL-Model-Exporter-Angular"

	^ ''
		,
			((self calledBehavior collect: #serviceOwner) removeDuplicates
				flatCollect: [ :aService | 
					'import { ' , aService uniqueName , ' } from ''app/' , self mooseModel name , '/'
						, aService getLocalPath , ''';' , String crlf ]) 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getFolderName [
	^ self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getHTMLName [
	^ self getAcceptedName  , '.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getImportStringAndSubBusinessPageImportStringWithLocalPath: aLocalPath [
	^ (self getImportStringWithLocalPath: aLocalPath) , String crlf
		,
			(self metiers
				flatCollect: [ :businessPage | 
					businessPage
						getImportStringAndSubBusinessPageImportStringWithLocalPath: aLocalPath , '/components/' , self getAcceptedName ])
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getImportStringWithLocalPath: aLocalPath [
	^ 'import { ' , self componentName , ' } from ''' , aLocalPath , '/components/'
		, self getAcceptedName , '/' , self getAcceptedName , '.component'';'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getLocalComponentPath [
	" return pageMetierName/pageMetierName.component"

	^ self getLocalPath , '/' , self getAcceptedName , '.component'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getLocalPath [
	" return   pageMetierName/pageMetierName.component"

	^ (self container) getLocalPath , '/components/' , self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getSelector [
	^  (self container ) getSelector , '-' , self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getTSName [
	^ self getAcceptedName  , '.component.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getTag [
	^ '<', self getSelector , '>', '</', self getSelector , '>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> isPageMetier [
	^ true
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> recursiveWidgetsWithoutMetiers [
	^ (self widgetsNotPageMetier  , (self widgetsNotPageMetier  collect: #recursiveWidgets)) flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> rootFromExporter: anExporter [ 
	^ ((self container) componentsRootFromExporter: anExporter) /  (self getAcceptedName )
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> widgetsDependencies [
	^ ''
		,
			((self recursiveWidgets flattened collect: #getExternalDependencies) flattened asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> widgetsNotPageMetier [
	^ self widgets reject: [ :widget | widget isPageMetier ]
]
