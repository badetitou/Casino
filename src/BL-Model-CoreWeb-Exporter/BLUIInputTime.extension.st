Extension { #name : #BLUIInputTime }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIInputTime >> getExternalDependency [
	^ {PNGCalendar}
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIInputTime >> getSelector [
	^ 'p-calendar'
]
