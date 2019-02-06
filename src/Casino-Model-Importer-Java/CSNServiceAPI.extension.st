Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Importer-Java' }
CSNServiceAPI class >> newFor: aFAMIXMethod [
	^ self new
		name: aFAMIXMethod name;
		source: aFAMIXMethod;
		yourself
]
