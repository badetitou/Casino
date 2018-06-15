Extension { #name : #BLPageMetier }

{ #category : #'*BL-Model-Exporter' }
BLPageMetier >> container [
	^ self phases ifNotEmpty: [ self phases at: 1] ifEmpty:  [ self widgetOwner ]
]
