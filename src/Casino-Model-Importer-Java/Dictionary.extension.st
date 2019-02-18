Extension { #name : #Dictionary }

{ #category : #'*Casino-Model-Importer-Java' }
Dictionary >> reverse [
	| dic |
	"Create new dictionary with the key as value and the value as keys"
	dic := Dictionary new.
	self valuesDo: [ :v | dic at: v ifAbsentPut: OrderedCollection new ].
	self keysAndValuesDo: [ :key :value | (dic at: value) add: key ].
	^ dic
]
