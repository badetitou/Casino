Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> exportCode [
	^ '    // TODO: Please check this service
    public ' , self uniqueName
		,
			'(): Observable<Object> {
        return this.http.get<Object>(''/ws/', self serviceOwner targetPoint,'/', self name, ''', {
            withCredentials: true
        }).pipe(first());
    }
'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> uniqueName [
	| dic |
	dic := self serviceOwner privateState cacheAt: #uniqueName ifAbsentPut: [ {(self -> self name)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self name.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := (potentialName removeSuffix: index asString) , index asString.
					index := index + 1 ].
			potentialName ]
]
