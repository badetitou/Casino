Extension { #name : #CSNBuDTO }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb-Tests' }
CSNBuDTO >> parentBusinessPackages [

	^ self source
		  ifNotNil: [ :aSource |
			  aSource atScope: FamixTPackage until: [ :p | p name = 'model' ] ]
		  ifNil: [ {  } ]
]
