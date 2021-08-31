Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> calledBehavior [
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget actions ]) flattened asSet
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> collectPhaseCalled [
	^ (self recursiveWidgets flattened
		flatCollect: [ :localWidget | 
			(localWidget actions
				select: #isActionAppel
				thenCollect: #call) select: #isNotNil ]) asSet asOrderedCollection sort: #name ascending 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> componentsRootFromExporter: anExporter [
	^ (self rootFromExporter: anExporter ) / 'components'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getAcceptedName [
	^ (self name splitOn: ':') last
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getBehaviorImportString [
	"*BL-Model-Exporter-Angular"

	^ ''
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
CSNBusinessPage >> idViewChildFrom: anExporter [
	^ (self variable isNil or: [ self variable isInvocation ])
		  ifTrue: [ '' ]
		  ifFalse: [ 
			  '    @ViewChild(' , self componentName , ', { static: true}) ' , self id , ': '
			  , self componentName , ';' , String crlf ]
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
CSNBusinessPage >> widgetsDependenciesFrom: anExporter [

	^ (((self recursiveWidgets , {self}) flattened collect: [ :el | el getExternalDependenciesFrom: anExporter ]) flattened asSet asOrderedCollection
		   collect: [ :dependency | dependency importString ]
		   as: Set) asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> widgetsNotPageMetier [
	^ self widgets reject: [ :widget | widget isPageMetier ]
]
