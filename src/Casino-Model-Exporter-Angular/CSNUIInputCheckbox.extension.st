Extension { #name : #CSNUIInputCheckbox }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputCheckbox >> computeSelfAttributes [
	^ {self attributes. self getPositionAttribute. {self generateDefaultClassAttribute}. self containedElementAttribute } flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputCheckbox >> getSelector [
	^ 'bl-checkbox'
]
