Extension { #name : #CSNBuPrimitive }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> innerName [
	^ self name
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> printJsonClassOn: aCSNExporter [
	({'byte' . 'void'} includes: self name)
		ifFalse: [ aCSNExporter << '@JsonClassType({type: () => ['.
			self printJsonClassTypeOn: aCSNExporter.
			aCSNExporter
				<<< ']})';
				crlf ]
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> printJsonClassTypeOn: aCSNExporter [

	"is a number"

	({ 'Integer'. 'int'. 'float'. 'Float'. 'Double'. 'double'. 'Long'. 'long' } includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Number'.
		^ self ].

	"is a boolean"
	({ 'Boolean'. 'boolean' } includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Boolean'.
		^ self ].

	"is a String"
	({ 'String'. 'char' } includes: self name) ifTrue: [ 
		aCSNExporter <<< 'String'.
		^ self ].

	"is a Date"
	({ 'Date' } includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Date'.
		^ self ].

	"is a byte"
	({ 'byte'. 'Byte'. 'void' } includes: self name) ifTrue: [ "not really supported"
		aCSNExporter <<< 'any'.
		^ self ].

	Error signal: 'Unknow type of primitive type'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> writeBusinessTypeOn: aCSNExporter [
	"is a number"

	({'Integer' . 'int' . 'float' . 'Float' . 'Double' . 'double' . 'Long'. 'long'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'number'.
			^ self ].

	"is a boolean"
	({'Boolean' . 'boolean'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'boolean'.
			^ self ].

	"is a String"
	({'String'. 'char'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'string'.
			^ self ].

	"is a Date"
	({'Date'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'Date'.
			^ self ].

	"is a byte"
	({'byte' .'Byte'. 'void'} includes: self name)
		ifTrue: [ 
			"not really supported"
			aCSNExporter <<< 'any'.
			^ self ].

	Error signal: 'Unknow type of primitive type'
]
