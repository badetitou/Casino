Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIGridLayout >> getSelector [
	^ 'table'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIGridLayout >> specificSelector [ 
	^ true
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIGridLayout >> tdAttributeForCell: aCell [
	"return as String because it is super specific to Grid"

	^ ''
		,
			((self privateState attributeAt: #cellVerticalSpan ifAbsentPut: [ Dictionary new ])
				at:
					((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) at: aCell)
				ifPresent: [ :verticalSpan | 'rowspan="' , verticalSpan asString , '" ' ]
				ifAbsent: [ '' ])
		,
			((self privateState attributeAt: #cellHorizontalSpan ifAbsentPut: [ Dictionary new ])
				at:
					((self privateState attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ]) at: aCell)
				ifPresent: [ :verticalSpan | 'colspan="' , verticalSpan asString , '"' ]
				ifAbsent: [ '' ])
]
