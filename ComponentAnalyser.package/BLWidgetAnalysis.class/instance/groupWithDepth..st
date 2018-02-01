accessing
groupWithDepth: aDepth
	| view result |
	view := self viewDependancyHeritCoreAndReferencesAndDepth: aDepth.
	result := Dictionary new.
	(view view elements select: [:a | a model isClass])
		do: [ :anElement | 
			| topElement |
			topElement := self searchTopElementFor: anElement.
			result
				at: topElement
				ifPresent: [ :a | a add: anElement model ]
				ifAbsentPut: [ | od |
					od := Set new.
					od add: anElement model.
					od ] ].
	^ result