Extension { #name : #BLBehavior }

{ #category : #'*BL-Model-Exporter' }
BLBehavior >> exportCode [
	"Return the code of the methods needed by this service
	(example: the code to do an async request)"
	^ ''

	
]

{ #category : #'*BL-Model-Exporter' }
BLBehavior >> importString [
	"Return the code of the importation of the Behavior"

	^ ''
]

{ #category : #'*BL-Model-Exporter' }
BLBehavior >> initializeCode [
	"If the Behavior needs to be initialize at the initialization of the widget"

	^ ''
]

{ #category : #'*BL-Model-Exporter' }
BLBehavior >> initializeVariable [
	"In some langage with Injection
	example: Angular"

	^ ''
]
