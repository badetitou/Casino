Class {
	#name : #PNGPanelMenu,
	#superclass : #PrimeNGComponent,
	#category : 'BL-Model-CoreWeb-Dependency'
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
