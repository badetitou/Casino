Extension { #name : #FASTEntity }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
FASTEntity >> importString [
	^ (self allToAnyScope: ((CSNBehaviorModelGenerator metamodel packages select: [ :package | package name = CSNBehaviorModelGenerator packageName ]) first classes collect: #implementingClass)) collect: #importString 
]
