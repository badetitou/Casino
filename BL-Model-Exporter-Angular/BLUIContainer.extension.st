Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIContainer >> attributesTag [
	^ ((self attributes groupedBy: [ :attribut | attribut name ])
		associationsCollect: [ :mapAttributeNameValues | 
			' ' , mapAttributeNameValues key asString , '="'
				,
					((mapAttributeNameValues value
						flatCollect: [ :attribute | attribute attributeValue asString , ' ' ]) removeLast; yourself)
				, '"' ]) flatten
]
