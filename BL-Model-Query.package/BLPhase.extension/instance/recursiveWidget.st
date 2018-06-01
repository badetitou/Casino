*BL-Model-Query
recursiveWidget
	| assocCollection od |
	assocCollection := OrderedCollection new.
	od := (self pageMetiers collect: #recursiveMetier) flattened.
	^ (od flatCollect: #recursiveWidget) flattened