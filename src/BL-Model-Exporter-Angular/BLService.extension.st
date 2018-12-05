Extension { #name : #BLService }

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> exportCode [
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

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> getLocalPath [
	^ 'services/', self getServiceName  
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> getServiceName [
	^ self uniqueName , '.service'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> getTSName [
	^ self getServiceName , '.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> getVariableName [
	^ '_', self uniqueName uncapitalized
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> importString [
	
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> initializeVariable [
	^ 'private ' , self getVariableName , ': ' , self uniqueName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> prepareAcceptFor: anExporter [
	"be sure create service directory"

	anExporter serviceRoot ensureCreateDirectory
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> uniqueName [
	^ self mooseName, self mooseID asString 
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLService >> writeCodeWith: anExporter [
	anExporter writeFile: anExporter serviceRoot / self getTSName  withCode: self exportCode
]
