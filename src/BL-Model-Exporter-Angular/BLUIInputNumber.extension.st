Extension { #name : #BLUIInputNumber }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputNumber >> getDom [
	^ '<' ,  self getListPropertiesAsString, ' />'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputNumber >> getSelector [
	^ 'input'
]
