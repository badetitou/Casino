api
postImport
	"| codeMetierImporter |
	codeMetierImporter := self codeMetierImporter new model: self sourceModel.
	(self model allBLActionsAttribute collect: #oldMethod)
		do: [ :aFamixClass | 
			aFamixClass methods
				do:
					[ :aFamixMethod | codeMetierImporter runWithSource: aFamixMethod sourceText and: aFamixMethod ] ]"