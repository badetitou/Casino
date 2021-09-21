Class {
	#name : #CSNWebModelJavaPageMetierTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #test }
CSNWebModelJavaPageMetierTest >> testGeneratePageMetier [
	| iBusinessPage concretePageMetier inheritance |
	iBusinessPage := FamixJavaClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FamixJavaClass new
		name: #ConcretePageMetier;
		yourself.
	inheritance := FamixJavaInheritance new
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
	iBusinessPage := FamixJavaClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FamixJavaClass new
		name: #ConcretePageMetierXMLUi;
		yourself.
	inheritance := FamixJavaInheritance new
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
	iBusinessPage := FamixJavaClass new
		name: #IPageMetier;
		yourself.
	concretePageMetier := FamixJavaClass new
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
