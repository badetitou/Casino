Extension { #name : #CSNBuPrimitive }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> writeBusinessTypeOn: aCSNExporter [
	"is a number"

	({'Integer' . 'int' . 'float' . 'Float' . 'Double' . 'double' . 'long'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'number'.
			^ self ].

	"is a boolean"
	({'Boolean' . 'boolean'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'boolean'.
			^ self ].

	"is a String"
	({'String'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'string'.
			^ self ].

	"is a Date"
	({'Date'} includes: self name)
		ifTrue: [ aCSNExporter <<< 'Date'.
			^ self ].
	Error signal: 'Unknow type of primitive type'
]
