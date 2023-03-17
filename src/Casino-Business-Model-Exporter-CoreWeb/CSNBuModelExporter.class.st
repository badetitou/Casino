Class {
	#name : #CSNBuModelExporter,
	#superclass : #Object,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#instVars : [
		'defaultSuperclassName'
	],
	#category : #'Casino-Business-Model-Exporter-CoreWeb'
}

{ #category : #export }
CSNBuModelExporter >> attributeInExceptionList: attribute [
	^ attribute name = #id
]

{ #category : #accessing }
CSNBuModelExporter >> defaultSuperclassName [

	^ defaultSuperclassName
]

{ #category : #accessing }
CSNBuModelExporter >> defaultSuperclassName: anObject [

	defaultSuperclassName := anObject
]

{ #category : #export }
CSNBuModelExporter >> exportAttribute: attribute [

	| isInSuperType |
	attribute comment ifNotNil: [ :comment | 
		self << comment.
		self crlf ].


	isInSuperType := attribute businessType
		                 ifNil: [ false ]
		                 ifNotNil: [ 
			                 (attribute businessType allParents flatCollect:
				                  #attributes) anySatisfy: [ :parentAttribute | 
				                 parentAttribute name = attribute name ] ].

	isInSuperType ifTrue: [ 
		self
			<<
				'/* TODO : Casino detected that this attribute is also define in the super class';
			crlf ].
	(attribute isStatic or: [ attribute isTransient ]) ifFalse: [ 
		self << '@JsonProperty()'.
		self crlf.
		"print @JsonClassType annotation if possible"
		attribute attributeType printJsonClassOn: self ].
	self indent.
	attribute isStatic ifTrue: [ self <<< 'static ' ].
	attribute isFinal ifTrue: [ self <<< 'readonly ' ].
	(attribute isStatic and: [ attribute name = 'name' ]) ifTrue: [ "'static name' is a reserved keyword of Angular" 
		self <<< '__' ].
	self <<< attribute name <<< ': '.
	self exportAttributeDTO: attribute attributeType.
	"attribute expression ifNotNil: [ :expr | self <<< ' = ' <<< expr ]."
	self <<< ';'.
	isInSuperType ifTrue: [ self <<< '*/' ]
]

{ #category : #export }
CSNBuModelExporter >> exportAttributeDTO: aDTO [
	"I export the type of the attribute

varName: <attributeBusinessType>;
"

	aDTO writeBusinessTypeOn: self
]

{ #category : #export }
CSNBuModelExporter >> exportAttributeGetter: attribute [
	(self << 'get' <<< attribute name capitalized)
		<<< '() ';
		inBraces: [ self << 'return this.' <<< attribute name <<< ';' ]
]

{ #category : #export }
CSNBuModelExporter >> exportAttributeSetter: attribute [
	self << 'set' <<< attribute name capitalized <<< '(' <<< attribute name <<< ': '.
	attribute attributeType writeBusinessTypeOn: self.
	self
		<<< ') ';
		inBraces: [ self << 'this.' <<< attribute name <<< ' = ' <<< attribute name <<< ';' ]
]

{ #category : #export }
CSNBuModelExporter >> exportBusinessType: aBusinessType [

	"Differences from CSNBuModelExporter:
	- no getters/setters
	- no excluded attribute"

	self printImportsFor: aBusinessType.
	self printImportDependencenciesOf: aBusinessType.
	aBusinessType comment ifNotNil: [ :comment | 
		self << comment sourceText.
		self crlf ].
	self printAnnotationsFor: aBusinessType.
	self << 'export '.
	aBusinessType isAbstract ifTrue: [ self <<< 'abstract ' ].
	self <<< 'class ' <<< aBusinessType name <<< ' extends '.
	aBusinessType parent
		ifNotNil: [ :superType | self <<< superType name ]
		ifNil: [ self <<< self defaultSuperclassName ].
	self space.

	self inBraces: [ "Class body"
		aBusinessType sortedAttributes
			do: [ :attribute | self exportAttribute: attribute ]
			separatedBy: [ self crlf ] ].
	self crlf
]

{ #category : #export }
CSNBuModelExporter >> printAnnotationsFor: aBusinessType [

	aBusinessType children ifNotEmpty: [ 
		self
			<< '@JsonSubTypes(';
			inBraces: [ 
				self
					<< 'types: ';
					inBrakets: [ 
						self << '{ class: () => ' <<< aBusinessType name <<< ' },'.
						self crlf.
						(aBusinessType children sorted: [ :a :b | a name < b name ])
							do: [ :child | 
								self << '{ class: () => ' <<< child name <<< ' },' ]
							separatedBy: [ self crlf ] ].
				self <<< $, ];
			<<< $);
			crlf ].
	self
		<< '@JsonTypeName({value: ''';
		<<< aBusinessType name;
		<<< '''})';
		crlf
]

{ #category : #export }
CSNBuModelExporter >> printImportDependencenciesOf: aBusinessType [

	aBusinessType dependencies ifNotEmpty: [ :dependencies | 
		self << 'import '.
		self inBraces: [ 
			(dependencies sorted: #name ascending)
				do: [ :dependency | self << dependency name ]
				separatedBy: [ 
					self <<< $,.
					self crlf ] ].
		self <<< ' from "..'.
		aBusinessType parentBusinessPackages do: [:package | self <<< '/..' ].
		self <<< '";'.
		self
			crlf;
			crlf ]
]

{ #category : #export }
CSNBuModelExporter >> printImportsFor: aBusinessType [

	self << 'import { JsonProperty, JsonClassType, JsonTypeName'.
	aBusinessType children ifNotEmpty: [ self <<< ', JsonSubTypes' ].
	self <<< ' } from "@outfoxx/jackson-js";'.
	aBusinessType parent ifNil: [ 
		self
			crlf;
			<< 'import { '.
		self <<< self defaultSuperclassName.
		self <<< ' } from "app/projects/bl-shell/src/public-api";' ].
	self
		crlf;
		crlf
]
