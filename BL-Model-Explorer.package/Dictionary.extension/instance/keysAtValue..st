*BL-Model-Explorer
keysAtValue: aValue
	| od |
	"Create new dictionary with the key as value and the value as keys"
	od := OrderedCollection new.
	self keysAndValuesDo: [ :key :value | ((self at: key) = aValue) ifTrue: [ od add: key ] ] .
	^ od