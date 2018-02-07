private
buildLayers: g
	| w layerNr u vertices layer vertex done cycles |
	w := self maxFloat.
	u := OrderedCollection new.
	layers := IdentityDictionary new.
	layerNrs := IdentityDictionary new.	"Assign all nodes to layers"
	cycles := self computeCycleFor: g.
	self halt.
	[ g isEmpty ]
		whileFalse: [ vertices := g select: [ :e | (self childrenFor: e) allSatisfy: [ :node | u includes: node ] ].
			vertex := vertices detectMax: [ :e | labels at: e ].
			done := false.
			layerNr := 1.
			[ done ]
				whileFalse: [ layer := layers at: layerNr ifAbsentPut: [ OrderedCollection new ].
					(layer size >= w
						or: [ ((self childrenFor: vertex) anySatisfy: [ :n | (layerNrs at: n) >= layerNr ])
								and: [ (layerNrs keysAtValue: layerNr) anySatisfy: [ :elAtLayerN | (self is: elAtLayerN inSameCycleGroupOf: vertex fromCycles: cycles) not ] ] ])
						ifTrue: [ layerNr := layerNr + 1 ]
						ifFalse: [ done := true ] ].
			layer add: vertex.
			layerNrs at: vertex put: layerNr.
			u add: vertex.
			g remove: vertex ]