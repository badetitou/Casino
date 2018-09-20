Extension { #name : #BLUIInputDate }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIInputDate >> getExternalDependency [
	^ {PNGCalendar}
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLUIInputDate >> getSelector [
	^ 'p-calendar'
]
