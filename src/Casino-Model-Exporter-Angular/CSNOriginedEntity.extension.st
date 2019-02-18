Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNOriginedEntity >> componentsRootFromExporter: anExporter [
	^ (self rootFromExporter: anExporter ) / 'components'
]
