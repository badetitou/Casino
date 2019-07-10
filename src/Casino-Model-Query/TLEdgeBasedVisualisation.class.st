Class {
	#name : #TLEdgeBasedVisualisation,
	#superclass : #TLVisualization,
	#instVars : [
		'property',
		'entities'
	],
	#category : #'Casino-Model-Query-Visualisation'
}

{ #category : #accessing }
TLEdgeBasedVisualisation >> buildVisualization [
	(self > #packages)
		addNodesFromEntities: self entities;
		connectFollowingProperty: self property
]

{ #category : #accessing }
TLEdgeBasedVisualisation >> configLayout [
	self layout: TLForceBasedLayout
]

{ #category : #accessing }
TLEdgeBasedVisualisation >> entities [
	^ entities
]

{ #category : #accessing }
TLEdgeBasedVisualisation >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
TLEdgeBasedVisualisation >> property [
	^ property
]

{ #category : #accessing }
TLEdgeBasedVisualisation >> property: anObject [
	property := anObject
]
