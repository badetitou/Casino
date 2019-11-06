Class {
	#name : #CSNUICWSplitButton,
	#superclass : #CSNContainer,
	#category : #'Casino-Model-CoreWeb-Entities'
}

{ #category : #meta }
CSNUICWSplitButton class >> annotation [

	<FMClass: #SplitButton super: #CSNContainer>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
	^self
]

{ #category : #'as yet unclassified' }
CSNUICWSplitButton >> getExternalDependency [
	^ {PNGSplitButton}
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
CSNUICWSplitButton >> getSelector [
	^ 'p-splitButton'
]

{ #category : #'as yet unclassified' }
CSNUICWSplitButton >> getVariables [
	^'    items' , self mooseID asString , ': MenuItem[];'
]
