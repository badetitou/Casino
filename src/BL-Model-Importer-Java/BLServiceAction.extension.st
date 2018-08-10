Extension { #name : #BLServiceAction }

{ #category : #'*BL-Model-Importer-Java' }
BLServiceAction class >> newFor: aFAMIXMethod [
	^ self new
		name: aFAMIXMethod name;
		source: aFAMIXMethod;
		yourself
]
