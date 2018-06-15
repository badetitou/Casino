Extension { #name : #BLServiceAction }

{ #category : #'*BL-Model-Exporter-Angular' }
BLServiceAction >> exportCode [
	^ '    public ' , self name, self mooseID asString 
		,
			'(): Observable<Object> {
        return this.http.get<Object>(''THE URL''); // TODO Add real URL
    }
'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLServiceAction >> initializeVariable [
	^ 'private ' , self serviceActionOwner getVariableName , ': ' , self serviceActionOwner mooseName
]
