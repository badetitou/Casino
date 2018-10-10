Extension { #name : #BLCell }

{ #category : #'*BL-Model-Exporter-Angular' }
BLCell >> hierarchalAttributes [
	^ self layoutOwner childAttribute
]
