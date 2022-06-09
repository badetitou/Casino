Class {
	#name : #CSNCoreWebPossibleAddInvocationVisitor,
	#superclass : #CSNJavaPossibleAddInvocationVisitor,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #accessing }
CSNCoreWebPossibleAddInvocationVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [

	^ ({ 'setRechercheEtListe' } anySatisfy: [ :keyword | 
		   (invocation signature beginsWith: keyword) and: [ 
			   invocation parameters isNotEmpty ] ])
		  ifFalse: [ super visitCSNOriginedEntity: aCSNOriginedEntity ]
		  ifTrue: [ true ]
]
