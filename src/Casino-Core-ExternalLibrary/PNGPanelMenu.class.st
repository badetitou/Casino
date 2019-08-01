Class {
	#name : #PNGPanelMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGPanelMenu class >> internalDependencies [
	^ { PNGMenuItem }
]

{ #category : #accessing }
PNGPanelMenu class >> moduleName [
	^ 'PanelMenuModule'
]

{ #category : #accessing }
PNGPanelMenu class >> modulePath [
	^ 'primeng/panelmenu'
]
