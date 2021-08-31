Class {
	#name : #PNGPanelMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGPanelMenu >> internalDependenciesOf: aWidgetInstance [
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
