Class {
	#name : #CSNWebModelJavaPageMetierTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #test }
CSNWebModelJavaPageMetierTest >> testGeneratePageMetier [
	| iBusinessPage concretePageMetier inheritance |
	iBusinessPage := FAMIXClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FAMIXClass new
		name: #ConcretePageMetier;
		yourself.
	inheritance := FAMIXInheritance new
		superclass: iBusinessPage;
		subclass: concretePageMetier;
		yourself.
	uiImporter sourceModel
		silentlyAddAll:
			{iBusinessPage.
			concretePageMetier.
			inheritance}.
	uiImporter generatePageMetier.
	self
		assert: (uiImporter model allWithType: CSNBusinessPage) size
		equals: 1
]

{ #category : #test }
CSNWebModelJavaPageMetierTest >> testGeneratePageMetierXMLUi [
	| iBusinessPage concretePageMetier inheritance |
	iBusinessPage := FAMIXClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FAMIXClass new
		name: #ConcretePageMetierXMLUi;
		yourself.
	inheritance := FAMIXInheritance new
		superclass: iBusinessPage;
		subclass: concretePageMetier;
		yourself.
	uiImporter sourceModel
		silentlyAddAll:
			{iBusinessPage.
			concretePageMetier.
			inheritance}.
	uiImporter generatePageMetier.
	self
		assert: (uiImporter model allWithType: CSNBusinessPage) size
		equals: 0
]

{ #category : #test }
CSNWebModelJavaPageMetierTest >> testGeneratePageMetierXMLUiWithoutSuperClass [
	| concretePageMetier iBusinessPage |
	iBusinessPage := FAMIXClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FAMIXClass new
		name: #ConcretePageMetierXMLUi;
		yourself.
	uiImporter sourceModel
		silentlyAddAll:
			{concretePageMetier.
			iBusinessPage}.
	uiImporter generatePageMetier.
	self
		assert: (uiImporter model allWithType: CSNBusinessPage) size
		equals: 0
]
