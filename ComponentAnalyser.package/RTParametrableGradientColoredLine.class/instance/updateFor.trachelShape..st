public
updateFor: anEdge trachelShape: trachelShape
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