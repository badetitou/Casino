Class {
	#name : #PNGPanelMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGPanelMenu >> internalDependencies [
	^ { PNGMenuItem new }
]

{ #category : #accessing }
PNGPanelMenu >> moduleName [
	^ 'PanelMenuModule'
]

{ #category : #accessing }
PNGPanelMenu >> modulePath [
	^ 'primeng/panelmenu'
]
