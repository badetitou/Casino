Extension { #name : #CSNService }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> exportCode [
	^ 'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs/Observable'';
import { of } from ''rxjs/observable/of'';

import { HttpClient, HttpHeaders } from ''@angular/common/http'';

@Injectable()
export class ' , self uniqueName
		,
			' {

    constructor(private http: HttpClient) {
    }

' , (self actions flatCollect: [ :action | action exportCode , String crlf ])
		,
			'

}'
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
CSNService >> importString [
	
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> initializeVariable [
	^ 'private ' , self getVariableName , ': ' , self uniqueName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> prepareAcceptFor: anExporter [
	"be sure create service directory"

	anExporter serviceRoot ensureCreateDirectory
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> uniqueName [
	^ self mooseName, self mooseID asString 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNService >> writeCodeWith: anExporter [
	anExporter writeFile: anExporter serviceRoot / self getTSName  withCode: self exportCode
]
