"
I'm like RTSugiyamaLayout. But i use also use trajan algorithm to define the layout
"
Class {
	#name : #RTSugiyamaLayoutSameLevelLoop,
	#superclass : #RTSugiyamaLayout,
	#category : 'BL-Model-Explorer'
}

{ #category : #private }
RTSugiyamaLayoutSameLevelLoop >> buildLayers: g [
	| w layerNr u vertices layer vertex done cycles |
	w := self maxFloat.
	u := OrderedCollection new.
	layers := IdentityDictionary new.
	layerNrs := IdentityDictionary new.	"Assign all nodes to layers"
	cycles := self computeCycleFor: g.
	cycles := cycles collect: [ :el | el collect: #model ].
	[ g isEmpty ]
		whileFalse: [ vertices := g select: [ :e | (self childrenFor: e) allSatisfy: [ :node | u includes: node ] ].
			vertex := vertices detectMax: [ :e | labels at: e ].
			done := false.
			layerNr := 1.
			[ done ]
				whileFalse: [ layer := layers at: layerNr ifAbsentPut: [ OrderedCollection new ].
					((layerNrs keysAtValue: layerNr) anySatisfy: [ :elAtLayerN | self is: elAtLayerN inSameCycleGroupOf: vertex fromCycles: cycles ])
						ifTrue: [ 
							done := true ]
						ifFalse: [ (layer size >= w or: [ (self childrenFor: vertex) anySatisfy: [ :n | (layerNrs at: n) >= layerNr ] ])
								ifTrue: [ layerNr := layerNr + 1 ]
								ifFalse: [ done := true ] ] ].
			layer add: vertex.
			layerNrs at: vertex put: layerNr.
			u add: vertex.
			g remove: vertex ]
]

{ #category : #private }
RTSugiyamaLayoutSameLevelLoop >> computeCycleFor: g [
	^ MalTarjan new nodes: g asOrderedCollection;
	edges: (g collect: [ :el | el connectedEdges select: [ :edge | edge from = el ] ]) flatten from: #from to: #to;
	run.
]

{ #category : #private }
RTSugiyamaLayoutSameLevelLoop >> is: el1 inSameCycleGroupOf: el2 fromCycles: cycles [
	^ cycles anySatisfy: [ :collection | (collection includes: el1) and: [ collection includes: el2 ] ]
]

{ #category : #accessing }
RTSugiyamaLayoutSameLevelLoop >> layerNrs [
	^ layerNrs 
]

{ #category : #accessing }
RTSugiyamaLayoutSameLevelLoop >> layers [
	^ layers
]
