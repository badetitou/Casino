as yet unclassified
getCompositeFromModele: aMooseModel
	^ aMooseModel allClasses select: [ :a | a name = 'AbstractBLComposite' ]