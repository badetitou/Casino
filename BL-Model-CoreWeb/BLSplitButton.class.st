Class {
	#name : #BLSplitButton,
	#superclass : #BLInput,
	#category : 'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLSplitButton class >> annotation [
	<MSEClass: #BLColorPicker super: #BLWidget>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #accessing }
BLSplitButton >> getDom [
	^ '<' , self getListPropertiesAsString , '></' , self getSelector , '>'
]

{ #category : #accessing }
BLSplitButton >> getExternalDependency [
	^ {PNGSplitButton}
]

{ #category : #'as yet unclassified' }
BLSplitButton >> getInitializations [
	^ '        this.items' , self mooseID asString
		,
			' = [
'
		,
			(self widgets
				flatCollect: [ :widget | '            {label: ''' , (widget parameters at: #label) , '''},' , String crlf ])
		,
			'
        ];'
]

{ #category : #accessing }
BLSplitButton >> getSelector [
	^ 'p-splitButton'
]

{ #category : #'as yet unclassified' }
BLSplitButton >> getVariables [
	^'    items' , self mooseID asString , ': MenuItem[];'
]
