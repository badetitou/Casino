Extension { #name : #CSNService }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNService >> dependencies [
	^ (self actions flatCollect: #dependencies) asSet
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNService >> parentServicePackagesUntil: aPackageName [

	^ self source
		  ifNotNil: [ :aSource |
			  aSource atScope: FamixTPackage until: [ :p | p name = aPackageName ] ]
		  ifNil: [ {  } ]
]
