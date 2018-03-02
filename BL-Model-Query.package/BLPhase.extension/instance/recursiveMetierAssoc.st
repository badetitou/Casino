*BL-Model-Query
recursiveMetierAssoc
	| assocCollection od |
	assocCollection := OrderedCollection new.
	od := self metiers collect: #recursiveMetier.
	^ assocCollection