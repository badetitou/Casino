Extension { #name : #CSNService }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> exportCode [
	^ 'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs'';

import { HttpClient, HttpHeaders } from ''@angular/common/http'';

@Injectable()
export class ' , self uniqueName
		,
			' {

    constructor(private http: HttpClient) {
    }

' , ((self actions sorted: #uniqueName ascending) flatCollect: [ :action | action exportCode , String crlf ])
		,
			'

}
'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> getLocalPath [
	^ 'services/', self getServiceName  
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> getServiceName [
	^ self uniqueName , '.service'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> getTSName [
	^ self getServiceName , '.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> getVariableName [
	^ '_', self uniqueName uncapitalized
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> prepareAcceptFor: anExporter [
	"be sure create service directory"

	anExporter serviceRoot ensureCreateDirectory
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> uniqueName [
	| dic |
	dic := self mooseModel privateState cacheAt: #serviceUniqueName ifAbsentPut: [ {(self -> self mooseName)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self mooseName.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := (potentialName removeSuffix: index asString) , index asString.
					index := index + 1 ].
			potentialName ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> writeCodeWith: anExporter [
	anExporter writeFile: anExporter serviceRoot / self getTSName  withCode: self exportCode
]
