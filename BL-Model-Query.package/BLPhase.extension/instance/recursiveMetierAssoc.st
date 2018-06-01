*BL-Model-Query
recursiveMetierAssoc
	| assocCollection od |
	assocCollection := OrderedCollection new.
	od := self pageMetiers collect: #recursiveMetier.
	^ assocCollection