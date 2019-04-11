Class {
	#name : #CSNGlobalView,
	#superclass : #TLObject,
	#category : #'Casino-Model-Query'
}

{ #category : #'as yet unclassified' }
CSNGlobalView class >> generalViewForModel: aGUIModel [
	| visu |
	visu := TLTreeExplorer fromEntities: aGUIModel allCSNWidget.
	visu labelForSelector: #asString.
	visu connectFollowingProperty: #belongsTo.
	^ visu
]

{ #category : #'see class side' }
CSNGlobalView >> seeClassSide [
]
