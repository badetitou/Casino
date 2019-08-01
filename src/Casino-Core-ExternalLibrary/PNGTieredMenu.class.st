Class {
	#name : #PNGTieredMenu,
	#superclass : #PrimeNGComponent,
	#category : #'Casino-Core-ExternalLibrary'
}

{ #category : #accessing }
PNGTieredMenu class >> internalDependencies [
	^ { PNGMenuItem }
]

{ #category : #accessing }
PNGTieredMenu class >> moduleName [
	^ 'TieredMenuModule'
]

{ #category : #accessing }
PNGTieredMenu class >> modulePath [
	^ 'primeng/tieredmenu'
]
