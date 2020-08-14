Extension { #name : #CSNUICWSplitButton }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWSplitButton >> angularComponent [
	^ PNGSplitButton
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWSplitButton >> getInitializations [
	^ '        this.items' , self mooseID asString
		,
			' = [
'
		,
			(self widgets
				flatCollect: [ :widget | '            {label: ''' , ((widget attributes select: [:a | a isKindOf: CSNUILabel]) first) attributeValue , '''},' , String crlf ])
		,
			'
        ];'
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUICWSplitButton >> getVariables [
	^'    items' , self mooseID asString , ': MenuItem[];'
]
