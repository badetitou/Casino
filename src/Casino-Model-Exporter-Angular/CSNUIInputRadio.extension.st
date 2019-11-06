Extension { #name : #CSNUIInputRadio }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputRadio >> computeSelfAttributes [
	^ {self attributes. self getPositionAttribute. {self generateDefaultClassAttribute}. self containedElementAttribute } flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputRadio >> getSelector [
	^ 'bl-radio-button'
]
