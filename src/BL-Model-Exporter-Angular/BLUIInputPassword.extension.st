Extension { #name : #BLUIInputPassword }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputPassword >> getDom [
	^ '<' ,  self getListPropertiesAsString , ' />'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputPassword >> getSelector [
	^ 'input'
]
