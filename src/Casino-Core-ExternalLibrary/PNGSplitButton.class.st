Class {
	#name : #PNGSplitButton,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGSplitButton >> getSelector [
	^ 'p-splitButton'
]

{ #category : #accessing }
PNGSplitButton >> internalDependencies [
	^ { PNGMenuItem new }
]

{ #category : #accessing }
PNGSplitButton >> moduleName [
	^ 'SplitButtonModule'
]

{ #category : #accessing }
PNGSplitButton >> modulePath [
	^ 'primeng/splitbutton'
]
