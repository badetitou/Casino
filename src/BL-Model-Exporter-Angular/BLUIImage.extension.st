Extension { #name : #BLUIImage }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIImage >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIImage >> getSelector [
	^ 'img'
]
