Trait {
	#name : #TAngularExporter,
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #api }
TAngularExporter >> protectString: aString [

	^ aString
		  ifNotNil: [ 
			  (((aString asString copyReplaceAll: '"' with: '&quot;')
				    copyReplaceAll: '<'
				    with: '&lt;') copyReplaceAll: '>' with: '&gt;')
				  copyReplaceAll: '{'
				  with: '{{ ''{'' }}' ]
		  ifNil: [ '' ]
]
