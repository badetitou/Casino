Class {
	#name : #CSNSplitButton,
	#superclass : #CSNInput,
	#category : #'Casino-Model-CoreWeb-Widget'
}

{ #category : #meta }
CSNSplitButton class >> annotation [
	<MSEClass: #BLColorPicker super: #CSNWidget>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #accessing }
CSNSplitButton >> getExternalDependency [
	^ {PNGSplitButton}
]

{ #category : #'as yet unclassified' }
CSNSplitButton >> getInitializations [
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

{ #category : #accessing }
CSNSplitButton >> getSelector [
	^ 'p-splitButton'
]

{ #category : #'as yet unclassified' }
CSNSplitButton >> getVariables [
	^'    items' , self mooseID asString , ': MenuItem[];'
]
