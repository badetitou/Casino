Trait {
	#name : #TCSNExporter,
	#instVars : [
		'currentWriteStream',
		'indentLevel',
		'indentNumber'
	],
	#category : #'Casino-Exporter'
}

{ #category : #'instance creation' }
TCSNExporter classSide >> on: aStream [
	^ self new
		currentWriteStream: aStream;
		yourself
]

{ #category : #streaming }
TCSNExporter >> << elements [
  self indent.
  currentWriteStream << elements
]

{ #category : #streaming }
TCSNExporter >> <<< elements [
  currentWriteStream << elements
]

{ #category : #streaming }
TCSNExporter >> cr [
  ^ self <<< String cr 
]

{ #category : #streaming }
TCSNExporter >> crlf [
  ^ self <<< String crlf 
]

{ #category : #accessing }
TCSNExporter >> currentWriteStream [
	^ currentWriteStream
]

{ #category : #accessing }
TCSNExporter >> currentWriteStream: anObject [
	currentWriteStream := anObject
]

{ #category : #streaming }
TCSNExporter >> inBraces: aBlock [
	self
		<<< '{';
		indentPlus;
		crlf.
	aBlock value.
	self
		crlf;
		indentMinus;
		<< '}'
]

{ #category : #streaming }
TCSNExporter >> inBrakets: aBlock [
	self
		<<< '[';
		indentPlus;
		crlf.
	aBlock value.
	self
		crlf;
		indentMinus;
		<< ']'
]

{ #category : #streaming }
TCSNExporter >> inIndented: aBlock [

	self
		indentPlus;
		crlf.
	aBlock value.
	self
		indentMinus;
		crlf
]

{ #category : #streaming }
TCSNExporter >> inParenthesis: aBlock [
	self <<< '('.
	aBlock value.
	self << ')'
]

{ #category : #streaming }
TCSNExporter >> indent [
  1 to: self indentLevel * self indentNumber do: [:i |  currentWriteStream << self indentCharacter ]
]

{ #category : #streaming }
TCSNExporter >> indentCharacter [
	^ String space
]

{ #category : #streaming }
TCSNExporter >> indentLevel [
	^ indentLevel ifNil: [ indentLevel := 0 ]
]

{ #category : #streaming }
TCSNExporter >> indentLevel: aLevel [
	indentLevel := aLevel
]

{ #category : #streaming }
TCSNExporter >> indentMinus [
	^ indentLevel := indentLevel - 1
]

{ #category : #streaming }
TCSNExporter >> indentNumber [
	^ 4
]

{ #category : #streaming }
TCSNExporter >> indentPlus [
	^ indentLevel := self indentLevel + 1
]
