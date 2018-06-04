*BL-Model-Query
recursiveWidget
	| od |
	od := (self pageMetiers collect: #recursiveMetier) flattened.
	^ (od flatCollect: #recursiveWidget) flattened