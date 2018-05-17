*BL-Model-Query
recursiveWidget
	| assocCollection od |
	assocCollection := OrderedCollection new.
	od := (self metiers collect: #recursiveMetier) flattened .
	^ (od flatCollect: #recursiveWidget) flattened.