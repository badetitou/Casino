Extension { #name : #BLServiceAPI }

{ #category : #'*BL-Model-Exporter-Angular' }
BLServiceAPI >> exportCode [
	^ '    public ' , self name, self mooseID asString 
		,
			'(): Observable<Object> {
        return this.http.get<Object>(''THE URL''); // TODO Add real URL
    }
'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLServiceAPI >> initializeVariable [
	^ 'private ' , self serviceOwner getVariableName , ': ' , self serviceOwner uniqueName
]
