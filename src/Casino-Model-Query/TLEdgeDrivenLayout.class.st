Class {
	#name : #TLEdgeDrivenLayout,
	#superclass : #TLLayout,
	#instVars : [
		'affectedNodes',
		'edges',
		'userDefinedEdges',
		'fromPositions',
		'toPositions',
		'shouldSetDefaultAttachPoint'
	],
	#category : #'Casino-Model-Query-Layouts'
}

{ #category : #'as yet unclassified' }
TLEdgeDrivenLayout class >> isAbstract [
	^ self = RTEdgeDrivenLayout
]

{ #category : #public }
TLEdgeDrivenLayout class >> on: elements edges: edges [
	^ self new on: elements edges: edges
]

{ #category : #'instance creation' }
TLEdgeDrivenLayout class >> withEdges: aCollection [
	
	^self new initialize userDefinedEdges: aCollection
]

{ #category : #'default attach points' }
TLEdgeDrivenLayout >> addDefaultAttachPointToEdges [
	| a |
	a := self defaultAttachPoint.
	edges do: [ :e | e shape attachPoint: a ]
]

{ #category : #accessing }
TLEdgeDrivenLayout >> affectedNodes [
	
	^affectedNodes
]

{ #category : #accessing }
TLEdgeDrivenLayout >> affectedNodes: anObject [
	
	affectedNodes := anObject
]

{ #category : #accessing }
TLEdgeDrivenLayout >> affectedNodesOf:  aNode [ 
	^ affectedNodes ifNil: [ aNode nodes ]
]

{ #category : #'default attach points' }
TLEdgeDrivenLayout >> defaultAttachPoint [
	^ RTCenteredAttachPoint new
]

{ #category : #'default values' }
TLEdgeDrivenLayout >> defaultFromPositions [
	^ #()
	
]

{ #category : #'default values' }
TLEdgeDrivenLayout >> defaultToPositions [
	^ #()

]

{ #category : #'default attach points' }
TLEdgeDrivenLayout >> doAttachPoint [
	"Change the attach point of edges when added"
	shouldSetDefaultAttachPoint := true
]

{ #category : #hook }
TLEdgeDrivenLayout >> doIncrementallyExecute: anElementNode [
	"called by refreshLayoutEvery: ms. It is used to convey a feeling of incremental execution."
	
	self doExecute: anElementNode
]

{ #category : #'default attach points' }
TLEdgeDrivenLayout >> doNotAttachPoint [
	"Do not add an attach point to edges when doing the layout"
	shouldSetDefaultAttachPoint := false
]

{ #category : #private }
TLEdgeDrivenLayout >> edges [
	
	^ edges
]

{ #category : #accessing }
TLEdgeDrivenLayout >> edges: aCollection [
	"Set the list of edges that should be considered for the layout.
	If none is specified (i.e., if this method is not called), then the 
	edges are infered."
	edges := aCollection.
	self shouldSetDefaultAttachPoint
		ifTrue: [ self addDefaultAttachPointToEdges ]
]

{ #category : #iterator }
TLEdgeDrivenLayout >> edgesDo: aBlock [
	"Iterates over all the edges of the receiver."
	
	edges ifNil: [ ^ self ].
	edges do: aBlock

]

{ #category : #hook }
TLEdgeDrivenLayout >> executeOnElements: elements [ 
	"Execute the layout, myself, on the elements"

	self userDefinedEdges isNil 
		ifTrue: [ self setEdgesFromElements: elements ]
		ifFalse: 
			[ | flat |
			flat := OrderedCollection new.
			self userDefinedEdges do: 
				[ :each | 
				each isCollection 
					ifTrue: [ flat addAll: each ]
					ifFalse: [ flat add: each ] ].
			flat := flat select: #isUsedInLayout. 
			self edges: flat ].
		
	super executeOnElements: elements
]

{ #category : #accessing }
TLEdgeDrivenLayout >> fromPositions: anArray [
	
	fromPositions := anArray
]

{ #category : #'initialize-release' }
TLEdgeDrivenLayout >> initialize [
	"Initialization"
	super initialize.
	edges := nil.
	shouldSetDefaultAttachPoint := false
]

{ #category : #testing }
TLEdgeDrivenLayout >> isEdgeDrivenLayout [
	^ true
]

{ #category : #accessing }
TLEdgeDrivenLayout >> setEdgesFromElements: elements [ 

	elements isEmpty ifTrue: [ ^ self ].
	
	^ self
		edges:
			((elements flatCollect: #incomingEdges)
				select: [ :anEdge | anEdge isUsedInLayout and: (elements includes: anEdge from) ])
]

{ #category : #'default attach points' }
TLEdgeDrivenLayout >> shouldSetDefaultAttachPoint [
	"Return true if an attach point has to be added to edges. False else"
	^ shouldSetDefaultAttachPoint
]

{ #category : #accessing }
TLEdgeDrivenLayout >> toPositions: anArray [
	
	toPositions := anArray
]

{ #category : #private }
TLEdgeDrivenLayout >> userDefinedEdges [
	
	^userDefinedEdges
]

{ #category : #'initialize-release' }
TLEdgeDrivenLayout >> userDefinedEdges: aCollectionOfEdges [
	"useful to tell to the layout which edges have to be used for the layout"

	userDefinedEdges := aCollectionOfEdges.
	
]
