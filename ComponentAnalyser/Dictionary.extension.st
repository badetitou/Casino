Extension { #name : #Dictionary }

{ #category : #'*ComponentAnalyser' }
Dictionary >> keysAtValue: aValue [
	| od |
	"Create new dictionary with the key as value and the value as keys"
	od := OrderedCollection new.
	self keysAndValuesDo: [ :key :value | ((self at: key) = aValue) ifTrue: [ od add: key ] ] .
	^ od
]

{ #category : #'*ComponentAnalyser' }
Dictionary >> reverse [
	| dic |
	"Create new dictionary with the key as value and the value as keys"
	dic := Dictionary new.
	self values do: [ :v | dic at: v ifAbsentPut: OrderedCollection new ].
	self keysAndValuesDo: [ :key :value | (dic at: value) add: key ].
	^ dic
]
