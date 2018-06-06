Extension { #name : #BLService }

{ #category : #'*BL-Model-Importer-Java' }
BLService >> addAllActions: aCollectionOfAction [
	self serviceActions addAll: aCollectionOfAction 
]

{ #category : #'*BL-Model-Importer-Java' }
BLService class >> newFor: aServiceClass [
	^ self new
		name: aServiceClass name;
		source: aServiceClass;
		yourself
]
