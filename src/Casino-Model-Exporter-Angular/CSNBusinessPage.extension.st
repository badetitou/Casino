Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> calledBehavior [
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget actions ]) flattened asSet
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> componentsRootFromExporter: anExporter [
	^ (self rootFromExporter: anExporter ) / 'components'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getBehaviorImportString [
	"*BL-Model-Exporter-Angular"

	^ ''
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getFolderName [
	^ self getAcceptedPathName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getHTMLName [

	^ self getAcceptedPathName , '.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getLocalComponentPath [
	" return pageMetierName/pageMetierName.component"

	^ self getLocalPath , '/' , self getAcceptedPathName , '.component'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getLocalPath [

	" return pageMetierName/pageMetierName.component"

	^ self container getLocalPath , '/' , self getAcceptedPathName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getSelector [
	^  (self container ) getSelector , '-' , self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> getTag [
	^ '<', self getSelector , '>', '</', self getSelector , '>'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> id [

	| dic |
	dic := self container
		       cacheAt: #businessUniqueName
		       ifAbsentPut: [ 
		       { (self -> self name asRealCamelCase) } asDictionary ].
	^ dic at: self ifAbsentPut: [ 
		  | index potentialName |
		  index := 0.
		  potentialName := self name asRealCamelCase.
		  [ dic includes: potentialName ] whileTrue: [ 
			  potentialName := (potentialName removeSuffix: index asString)
			                   , index asString.
			  index := index + 1 ].
		  potentialName ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> idViewChildFrom: anExporter [

	^ ((self variable isNil or: [ self variable isNotFound ]) or: [ 
		   self variable isInvocation ])
		  ifTrue: [ '' ]
		  ifFalse: [ 
			  '    @ViewChild(' , self componentName , ', { static: true}) '
			  , self id , ': ' , self componentName , ';' , String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> isPageMetier [
	^ true
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> recursiveWidgetsWithoutMetiers [

	| wid |
	wid := self widgetsNotPageMetier.
	wid addAll: (self layout
			 ifNotNil: [ :a | a cell collect: #widget thenReject: #isNil ]
			 ifNil: [ {  } ]).
	wid addAll: (wid collect: #recursiveWidgets).
	^ wid flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> rootFromExporter: anExporter [ 
	^ ((self container) componentsRootFromExporter: anExporter) /  (self getAcceptedName )
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNBusinessPage >> widgetsNotPageMetier [
	^ self widgets reject: [ :widget | widget isPageMetier ]
]
