Extension { #name : #CSNBuPrimitive }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuPrimitive >> writeJavaBusinessTypeOn: aCSNExporter [

	"is a number"
	(#( Integer int Float float Double double Long long Short short Byte
	    byte ) includes: self name) ifTrue: [ 
		aCSNExporter <<<  self name.
		^ self ].

	"is a boolean"
	(#( Boolean boolean ) includes: self name) ifTrue: [ 
		aCSNExporter <<<  self name.
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
		aCSNExporter <<< 'void'.
		^ self ].

	"is void"
	self name = #void ifTrue: [ 
		aCSNExporter <<< #void.
		^ self ].

	Error signal: 'Unknow type of primitive type'
]
