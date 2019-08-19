Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> addSource: aSource [
	sources add: aSource
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> initialize [
	super initialize.
	sources := OrderedCollection new
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> isWidget [
	^ false
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> source [
	^ sources anyOne
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> source: aSource [
	sources add: aSource
]
