Class {
	#name : #RTParametrableGradientColoredLine,
	#superclass : #RTGradientColoredLine,
	#instVars : [
		'colorsForBlock'
	],
	#category : 'BL-Model-Explorer'
}

{ #category : #public }
RTParametrableGradientColoredLine >> colorsFor: anEdge [
	^ colorsForBlock rtValue: anEdge
]

{ #category : #public }
RTParametrableGradientColoredLine >> colorsForBlock: aBlock [
	colorsForBlock := aBlock 
]

{ #category : #public }
RTParametrableGradientColoredLine >> trachelShapeFor: anEdge [
	| shape multiShape fromPoint toPoint p |
	colorArray := self colorsFor: anEdge.
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	p := path value: fromPoint value: toPoint.
	multiShape := TRCompositeShape new.
	2 to: p size do: [ :i | 
		shape := TRLineShape new.
		shape width: (self widthFor: anEdge).
		shape from: (p at: i - 1) to: (p at: i).
		shape color: (colorArray atWrap: i - 1).
		multiShape addShape: shape ].
	^ multiShape
]

{ #category : #public }
RTParametrableGradientColoredLine >> updateFor: anEdge trachelShape: trachelShape [
	| shape fromPoint toPoint p |
	colorArray := self colorsFor: anEdge.
	fromPoint := attachPoint startingPointOf: anEdge.
	toPoint := attachPoint endingPointOf: anEdge.
	p := path value: fromPoint value: toPoint.
	trachelShape shapes size < p size
		ifTrue: [ trachelShape shapes size to: p size do: [ :i | 
				| s |
				s := TRLineShape new.
				s addedIn: trachelShape canvas.
				trachelShape addShape: s ].
			trachelShape
				propagateElement;
				positionShapesAfterBeingAdded ].
	2 to: p size do: [ :i | 
		shape := trachelShape shapes at: i - 1.
		shape width: (self widthFor: anEdge).
		shape from: (p at: i - 1) to: (p at: i).
		shape color: (colorArray atWrap: i - 1) ].
	^ trachelShape
]
