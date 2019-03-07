Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> exportCode [
	^ '    public ' , self uniqueName
		,
			'(): Observable<Object> {
        return this.http.get<Object>(''THE URL''); // TODO Add real URL
    }
'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> initializeVariable [
	^ 'private ' , self serviceOwner getVariableName , ': ' , self serviceOwner uniqueName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> uniqueName [
	^ self name, self mooseID asString
]
