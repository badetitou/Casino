Extension { #name : #RTShapeBuilder }

{ #category : #'*BL-Model-Query' }
RTShapeBuilder >> withTextAbove: aSymbolOrABlock height: aHeightAsIntegerOrBlock [
	| newShape |
	newShape := RTCompositeShape new.
	newShape add: (RTLabel new height: aHeightAsIntegerOrBlock; text: aSymbolOrABlock).
	newShape add: shape.
	newShape vertical.
	newShape setAutomaticRelayout.
	shape := newShape.
]
