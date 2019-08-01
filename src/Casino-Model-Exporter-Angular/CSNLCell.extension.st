Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNLCell >> hierarchalAttributes [
	^ {self layoutOwner childAttributeFor: self. self attributes}
]
