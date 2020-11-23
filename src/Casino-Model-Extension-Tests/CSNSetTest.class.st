"
I test the `#anyOneIfOnlyOneElement` feature.

This feature allows one to use `#anyOne` on a Set and be sure that the collection only contain one element (so always the same is selected)
"
Class {
	#name : #CSNSetTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Extension-Tests'
}

{ #category : #tests }
CSNSetTest >> testAnyOneIfOnlyOneElement [
	self should: [ Set new anyOneIfOnlyOneElement ] raise: Error.
	self assert: (Set newFrom: {1}) anyOneIfOnlyOneElement equals: 1.
	self should: [ (Set newFrom: {1 . 2}) anyOneIfOnlyOneElement ] raise: Error
]
