Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> hasOnlyPrimitiveParameter [

	^ self source
		  ifNotNil: [ 
			  (self source parameters collect: #declaredType) allSatisfy: [ 
				  :type | 
				  type isNotNil and: [ 
					  type isPrimitiveType or: [ 
						  { 'String'. 'Long'. 'Integer'. 'Double'. 'Boolean' } 
							  includes: type name ] ] ] ]
		  ifNil: [ true ]
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

	aStream crlf.
	aStream
		<< 'const formData = new FormData();';
		crlf.
	self sortedParameters
		do: [ :parameter | 
			aStream << 'formData.append(''' <<< parameter name asKebabCase
			<<< ''', '.
			parameter dataType isDictionaryType
				ifFalse: [ aStream <<< 'JSON.stringify(' ]
				ifTrue: [ 
				aStream <<< 'this.mapToStringConverter.convertMapToJsonString(' ].
			aStream <<< parameter name <<< '));' ]
		separatedBy: [ aStream crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printCreateParamIn: aCSNExporter [
	(self source isNotNil and: [  self source parameters isNotEmpty ])
		ifTrue: [ aCSNExporter crlf.
			aCSNExporter
				<< 'let params = new HttpParams();';
				crlf.
			self sortedParameters
				do: [ :parameter | aCSNExporter << 'params = params.append(''' <<< parameter name asKebabCase <<< ''', ' <<< parameter name <<< '.toString());' ]
				separatedBy: [ aCSNExporter crlf ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> printParameterIn: aStream [
	self sortedParameters
		do: [ :parameter | 
			aStream <<< parameter acceptedName <<< ': '.
			parameter dataType ifNotNil: [ :dataType | dataType writeBusinessTypeOn: aStream ] ifNil: [ aStream << 'any' ] ]
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

	^ self parameters sorted: [ :p1 :p2 | 
		  (p1 source
			   ifNil: [ 0 ]
			   ifNotNil: [ :source | source sourceAnchor startPos ])
		  < (p2 source
				   ifNil: [ 0 ]
				   ifNotNil: [ :source | source sourceAnchor startPos ]) ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPI >> uniqueName [

	| dic |
	dic := self serviceOwner
		       cacheAt: #uniqueName
		       ifAbsentPut: [ { (self -> self name) } asDictionary ].
	^ dic at: self ifAbsentPut: [ 
		  | index potentialName |
		  index := 0.
		  potentialName := self name.
		  [ dic includes: potentialName ] whileTrue: [ 
			  potentialName := potentialName
				                   replaceSuffix: index asString
				                   with: (index := index + 1) asString ].
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
