Extension { #name : #FamixTMethod }

{ #category : #'*Casino-Model-Importer-Java' }
FamixTMethod >> isInstanciationInitializer [
	^ '<Initializer>' match: self name
]
