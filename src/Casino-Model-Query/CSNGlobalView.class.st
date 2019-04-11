Class {
	#name : #CSNGlobalView,
	#superclass : #TLObject,
	#category : #'Casino-Model-Query'
}

{ #category : #'as yet unclassified' }
CSNGlobalView class >> generalViewForModel: aGUIModel [
	| visu |
	visu := TLTreeExplorer fromEntities: {aGUIModel allCSNCell.aGUIModel allCSNWidget. aGUIModel allCSNLayout} flattened.
	visu labelForSelector: #asString.
	visu connectFollowingProperty: [:el | (el parents) asOrderedCollection at: 1 ifAbsent: nil].
	^ visu
]

{ #category : #'see class side' }
CSNGlobalView >> seeClassSide [
]
