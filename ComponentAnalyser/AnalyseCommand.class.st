Class {
	#name : #AnalyseCommand,
	#superclass : #Object,
	#category : 'ComponentAnalyser'
}

{ #category : #'as yet unclassified' }
AnalyseCommand >> getCompositeFromModel: aMooseModel [
	"aMooseModel allClasses select: [ :a | (a superclassHierarchyGroup select: [ :b | b name = 'AbstractBLComposite' ]) isNotEmpty.]
	
	We cant't use AbstractBLComposite currently because the MSE file can't parse it... We have to use find how to use maven before"

	^ aMooseModel allClasses
		select: [ :a | (a superclassHierarchyGroup select: [ :b | b name = 'IContentWidget' ]) isNotEmpty ]
]

{ #category : #'as yet unclassified' }
AnalyseCommand >> getXmlFile: aFilePath [
	^ PPXmlParser parse: aFilePath asFileReference contents.
]
