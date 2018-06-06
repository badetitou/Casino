Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> actionsTag [
	^ self actionAppels
		flatCollect: [ :actionAppel | ' ', actionAppel getAngularRepresentation ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> attributesTag [
	^ ''
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> behaviors [
	^ self attributes collect: #behaviors
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> container [
	^ widget
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getDom [
	^ '<' , self getListPropertiesAsString , '>'
		,
			((self widgets asOrderedCollection
				sort:
					[ :widget1 :widget2 | widget1 source sourceAnchor startPos < widget2 source sourceAnchor startPos ])
				flatCollect:
					[ :widget | String crlf , widget getDom , String crlf ])
		, '</' , self getSelector , '>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getExternalDependencies [
	^ {self getExternalDependency.
	self getExternalDependency collect: #internalDependencies}
		flattened
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getExternalDependency [
	^ {}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getListPropertiesAsString [
	^ self getSelector, self attributesTag , self actionsTag
		, self parametersTag , self idTag.
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> getSelector [
	^ 'div'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> id [
	^ self variable uniqueName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> idTag [
	^ self variable ifNil: [ '' ] ifNotNil: [ ' #' , self id ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> idViewChild [
	^ self variable
		ifNil: [ '' ]
		ifNotNil: [ '    @ViewChild(''' , self id , ''', { read: ViewContainerRef }) ' , self id
				, ': ViewContainerRef;' , String crlf ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> isPageMetier [
	^ false
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> parametersTag [
	^ (self parameters
		associationsCollect: [ :attr | ' ', attr key , '=' , (BLModelExporterAngular convertIfString: attr value) ]) flatten
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLWidget >> relativePathToHome [
	^ self container relativePathToHome , '../../'
]
