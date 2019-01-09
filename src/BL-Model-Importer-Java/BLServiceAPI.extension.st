Extension { #name : #BLServiceAPI }

{ #category : #'*BL-Model-Importer-Java' }
BLServiceAPI class >> newFor: aFAMIXMethod [
	^ self new
		name: aFAMIXMethod name;
		source: aFAMIXMethod;
		yourself
]
