Class {
	#name : #BLFieldset,
	#superclass : #BLPanel,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLFieldset class >> annotation [
	<MSEClass: #Fieldset super: #BLUIContainer>
	<package: #'BL-Model'>
	^ self
]

{ #category : #testing }
BLFieldset >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #accessing }
BLFieldset >> getExternalDependency [
	^ {PNGFieldset}
]

{ #category : #'as yet unclassified' }
BLFieldset >> getSelector [
	^ 'bl-panel'
]
