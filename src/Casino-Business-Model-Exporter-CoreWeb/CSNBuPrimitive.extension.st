Extension { #name : #CSNBuPrimitive }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> innerName [
	^ self name
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> printJsonClassOn: aCSNExporter [

	(#( Void ) includes: name) ifTrue: [ ^ self ].
	aCSNExporter << '@JsonClassType({ type: () => ['.
	self printJsonClassTypeOn: aCSNExporter.
	aCSNExporter
		<<< '] })';
		eol
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> printJsonClassTypeOn: aCSNExporter [

	"is a number"
	(#( Integer int Float float Double double Long long Short short Byte
	    byte ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Number'.
		^ self ].

	"is a boolean"
	(#( Boolean boolean ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Boolean'.
		^ self ].

	"is a String"
	(#( String Character char ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'String'.
		^ self ].

	"is a Date"
	(#( Date ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Date'.
		^ self ].

	"is unsupported"
	(#( Void ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'any'.
		^ self ].

	Error signal: 'Unknow type of primitive type'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> writeBusinessTypeOn: aCSNExporter [

	"is a number"
	(#( Integer int Float float Double double Long long Short short Byte
	    byte ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'number'.
		^ self ].

	"is a boolean"
	(#( Boolean boolean ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'boolean'.
		^ self ].

	"is a String"
	(#( String Character char ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'string'.
		^ self ].

	"is a Date"
	(#( Date ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'Date'.
		^ self ].

	"is unsupported"
	(#( Void ) includes: self name) ifTrue: [ 
		aCSNExporter <<< 'any'.
		^ self ].

	"is void"
	self name = #void ifTrue: [ 
		aCSNExporter <<< #void.
		^ self ].

	Error signal: 'Unknow type of primitive type'
]
