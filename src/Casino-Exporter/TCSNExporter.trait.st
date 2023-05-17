Trait {
	#name : #TCSNExporter,
	#instVars : [
		'currentWriteStream',
		'indentLevel',
		'indentNumber',
		'eolSeparator'
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
TCSNExporter >> <<<| elements [

	self <<< elements.
	self eol
]

{ #category : #streaming }
TCSNExporter >> <<| elements [

	self << elements.
	self eol
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
TCSNExporter >> eol [
  ^ self <<< self eolSeparator
]

{ #category : #accessing }
TCSNExporter >> eolSeparator [

	^ eolSeparator ifNil: [ 
		  eolSeparator := OSPlatform current lineEnding ]
]

{ #category : #accessing }
TCSNExporter >> eolSeparator: anObject [

	eolSeparator := anObject
]

{ #category : #streaming }
TCSNExporter >> inBraces: aBlock [
	self
		<<< '{';
		indentPlus;
		eol.
	aBlock value.
	self
		eol;
		indentMinus;
		<< '}'
]

{ #category : #streaming }
TCSNExporter >> inBrakets: aBlock [
	self
		<<< '[';
		indentPlus;
		eol.
	aBlock value.
	self
		eol;
		indentMinus;
		<< ']'
]

{ #category : #streaming }
TCSNExporter >> inIndented: aBlock [

	self
		indentPlus;
		eol.
	aBlock value.
	self
		indentMinus;
		eol
]

{ #category : #streaming }
TCSNExporter >> inParenthesis: aBlock [
	self <<< '('.
	aBlock value.
	self << ')'
]

{ #category : #streaming }
TCSNExporter >> inParenthesisNoIndent: aBlock [
	self <<< '('.
	aBlock value.
	self <<< ')'
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

	self assert: indentLevel > 0.
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

{ #category : #streaming }
TCSNExporter >> space [
  ^ self <<< ' '
]
