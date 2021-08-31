Class {
	#name : #PNGTieredMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGTieredMenu >> internalDependenciesOf: aWidgetInstance [
	^ { PNGMenuItem new }
]

{ #category : #accessing }
PNGTieredMenu >> moduleName [
	^ 'TieredMenuModule'
]

{ #category : #accessing }
PNGTieredMenu >> modulePath [
	^ 'primeng/tieredmenu'
]
