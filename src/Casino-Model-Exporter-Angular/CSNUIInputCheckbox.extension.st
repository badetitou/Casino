Extension { #name : #CSNUIInputCheckbox }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputCheckbox >> computeSelfAttributes [

	^ { 
		  self attributes.
		  self getPositionAttribute.
		  self containedElementAttribute } flattened asOrderedCollection
]
