Class {
	#name : #PNGTieredMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGTieredMenu >> internalDependencies [
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
