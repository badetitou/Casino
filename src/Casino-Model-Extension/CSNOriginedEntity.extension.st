Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> addSource: aSource [
	sources add: aSource
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> gtNodesIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite tree
		title: 'Tree';
		display: [ :anObject | anObject ];
		children: [ :each | each children ];
		yourself
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> initialize [
	super initialize.
	sources := OrderedCollection new
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> isContainer [
	^ false
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> isWidget [
	^ false
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> parentNode [
	^ self parents asOrderedCollection at: 1 ifAbsent: [ nil ] 
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> rootNode [

	"I should be overriden in my users"
	^ self parentNode ifNil: [ self ] ifNotNil: [:parent | parent rootNode ]
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> source [
	^ sources anyOne
]

{ #category : #'*Casino-Model-Extension' }
CSNOriginedEntity >> source: aSource [
	sources add: aSource
]
