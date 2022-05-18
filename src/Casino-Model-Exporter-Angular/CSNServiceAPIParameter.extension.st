Extension { #name : #CSNServiceAPIParameter }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPIParameter >> acceptedName [

	^ (self reservedNames includes: self name)
		  ifTrue: [ self name , '0' ]
		  ifFalse: [ self name ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNServiceAPIParameter >> reservedNames [

	^ #( #delete )
]
