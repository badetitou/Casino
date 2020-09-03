Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> hasOnlyPrimitiveParameter [
	^ (self source parameters collect: #declaredType)
		allSatisfy: [ :type | type isPrimitiveType or: [ {'String' . 'Long' . 'Integer' . 'Double' . 'Boolean'} includes: type name ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> isDELETE [
	^ name beginsWithAnyOf: {'delete' . 'remove' . 'clean' . 'purge'}
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> isGET [
	^ (self isPOST or: [ self isDELETE ]) not and:
		[ self hasOnlyPrimitiveParameter ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> isPOST [
	^ (name beginsWithAnyOf: {'set' . 'create' . 'put' . 'post' . 'save'}) or: [ self hasOnlyPrimitiveParameter not ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printCreateFormDataIn: aStream [
	self source parameters
		ifNotEmpty: [ aStream crlf.
			aStream
				<< 'const formData = new FormData();';
				crlf.
			self sortedParameters
				do: [ :parameter | aStream << 'formData.append(''' <<< parameter name asKebabCase <<< ''', JSON.stringify(' <<< parameter name <<< '));' ]
				separatedBy: [ aStream crlf ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printCreateParamIn: aCSNExporter [
	self source parameters
		ifNotEmpty: [ aCSNExporter crlf.
			aCSNExporter
				<< 'let params = new HttpParams();';
				crlf.
			self sortedParameters
				do: [ :parameter | aCSNExporter << 'params = params.append(''' <<< parameter name asKebabCase <<< ''', ' <<< parameter name <<< ');' ]
				separatedBy: [ aCSNExporter crlf ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printParameterIn: aStream [
	self sortedParameters
		do: [ :parameter | 
			aStream <<< parameter name <<< ': '.
			parameter dataType writeBusinessTypeOn: aStream ]
		separatedBy: [ aStream <<< ', ' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printRestTypeIn: aStream [
	self isGET
		ifTrue: [ aStream <<< 'get' ]
		ifFalse: [ aStream <<< 'post' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> sortedParameters [
	^ self parameters sorted: [ :p1 :p2 | p1 source sourceAnchor startPos < p2 source sourceAnchor startPos ]
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

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> writeCodeIn: aStream [
	aStream
		<<
			'    // TODO: Please check this service
    public ' << self uniqueName << '('.
	self printParameterIn: aStream.

	aStream << '): Observable<any> {'.
	self isGET
		ifTrue: [ self printCreateParamIn: aStream ]
		ifFalse: [ self printCreateFormDataIn: aStream ].
	aStream
		<<
			'
        return this.http.'.
	self printRestTypeIn: aStream.
	aStream << '<any>(''/ws/' << self serviceOwner targetPoint asKebabCase << '/' << self name asKebabCase << ''''.
	self isPOST
		ifTrue: [ aStream
				<< ',';
				crlf;
				<< '            formData' ].
	aStream
		<<
			', {
            withCredentials: true'.
	(self isGET and: [ self source parameters isNotEmpty ])
		ifTrue: [ aStream
				<<
					',
            params: params' ].
	aStream
		<<
			'
        }).pipe(first());
    }
'
]
