Class {
	#name : #RTFadingColorLineLegendItem,
	#superclass : #RTLegendItem,
	#instVars : [
		'color',
		'text',
		'description',
		'colors'
	],
	#category : 'ComponentAnalyser'
}

{ #category : #accessing }
RTFadingColorLineLegendItem >> colors: aCollectionOfColors [
	colors := aCollectionOfColors
]

{ #category : #accessing }
RTFadingColorLineLegendItem >> description [
	^ description
]

{ #category : #accessing }
RTFadingColorLineLegendItem >> description: anObject [
	description := anObject
]

{ #category : #accessing }
RTFadingColorLineLegendItem >> execute [
	| g shape es n label |
	g := RTGroup new.
	shape := RTBox new
		width: 3;
		height: 3.
	es := shape elementsOn: (1 to: 50).
	g addAll: es.
	RTHorizontalLineLayout new
		gapSize: -1;
		on: es.
	n := RTMetricNormalizer new.
	n elements: es.
	n normalizeColor: #yourself using: colors.
	label := (self newLabelShape: description) element.
	g add: label.
	RTConstraint move: label onTheRightOf: es.
	label translateBy: 5 @ 0.
	^ g
]
