Extension { #name : #BLOriginedEntity }

{ #category : #'*BL-Model-Exporter-Angular' }
BLOriginedEntity >> componentsRootFromExporter: anExporter [
	^ (self rootFromExporter: anExporter ) / 'components'
]
