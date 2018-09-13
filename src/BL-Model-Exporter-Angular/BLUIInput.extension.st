Extension { #name : #BLUIInput }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInput >> getDom [
	^ '<input id="float-' , self mooseID asString , '" type="text" value="' , value
		,
			'" placeholder="', text,'" pInputText>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInput >> getExternalDependency [
	^ {PNGInputText}
]
