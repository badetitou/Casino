Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNLCell >> containedElementAttribute [
	^ {  }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNLCell >> hierarchalAttributes [

	^ { 
		  (self layoutOwner childAttributeFor: self).
		  self attributes reject: #isCellAttribute }
]
