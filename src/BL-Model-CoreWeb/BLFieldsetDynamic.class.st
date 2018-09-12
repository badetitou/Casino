Class {
	#name : #BLFieldsetDynamic,
	#superclass : #BLPanel,
	#category : #'BL-Model-CoreWeb-Widget'
}

{ #category : #meta }
BLFieldsetDynamic class >> annotation [
	<MSEClass: #BLFieldsetDynamic super: #BLPanel>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLFieldsetDynamic >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLEnable
]

{ #category : #accessing }
BLFieldsetDynamic >> getExternalDependency [
	^ {PNGFieldset}
]

{ #category : #'as yet unclassified' }
BLFieldsetDynamic >> getSelector [
	^ 'p-fieldset'
]
