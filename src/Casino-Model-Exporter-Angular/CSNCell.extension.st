Extension { #name : #CSNCell }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNCell >> hierarchalAttributes [
	^ {self layoutOwner childAttributeFor: self. self attributes}
]
