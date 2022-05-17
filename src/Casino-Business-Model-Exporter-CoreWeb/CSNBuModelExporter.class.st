Class {
	#name : #CSNBuModelExporter,
	#superclass : #Object,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#category : #'Casino-Business-Model-Exporter-CoreWeb'
}

{ #category : #export }
CSNBuModelExporter >> attributeInExceptionList: attribute [
	^ attribute name = #id
]

{ #category : #export }
CSNBuModelExporter >> exportAttribute: attribute [

	attribute comment ifNotNil: [ :comment | 
		self << comment.
		self crlf ].
	(attribute isStatic or: [ attribute isTransient ]) ifFalse: [ 
		self << '@JsonProperty()'.
		self crlf.
		"print @JsonClassType annotation if possible"
		attribute attributeType printJsonClassOn: self ].
	self indent.
	attribute isStatic ifTrue: [ self <<< 'static ' ].
	attribute isFinal ifTrue: [ self <<< 'readonly ' ].
	self <<< attribute name <<< ': '.
	self exportAttributeDTO: attribute attributeType.
	self <<< ';'
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

	self printImports.
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
		ifNil: [ self <<< 'AbstractDTO' ].
	self space.

	self inBraces: [ "Class body"
		(aBusinessType sortedAttributes reject: [ :attribute | 
			 self attributeInExceptionList: attribute ])
			do: [ :attribute | self exportAttribute: attribute ]
			separatedBy: [ self crlf ].
		self
			crlf;
			crlf.
		((aBusinessType attributes asOrderedCollection sorted:
			  #name ascending) reject: [ :attribute | 
			 self attributeInExceptionList: attribute ])
			do: [ :attribute | 
				self exportAttributeGetter: attribute.
				self
					crlf;
					crlf.
				self exportAttributeSetter: attribute ]
			separatedBy: [ 
				self
					crlf;
					crlf ] ].
	self crlf
]

{ #category : #export }
CSNBuModelExporter >> printAnnotationsFor: aBusinessType [

	aBusinessType children ifEmpty: [ ^ self ].
	self
		<< '@JsonSubTypes(';
		inBraces: [ 
			self
				<< 'types: ';
				inBrakets: [ 
					self << '{ class: () => ' <<< aBusinessType name <<< ' },'.
					self crlf.
					aBusinessType children
						do: [ :child | 
							self << '{ class: () => ' <<< child name <<< ' },' ]
						separatedBy: [ self crlf ] ].
			self <<< $, ];
		<<< $);
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
		self <<< ' from "..";'.
		self
			crlf;
			crlf ]
]

{ #category : #export }
CSNBuModelExporter >> printImports [

	self
		<< 'import { JsonClassType, JsonProperty, JsonTypeName } from ''@outfoxx/jackson-js'';';
		crlf;
		<< 'import { AbstractDTO } from ''src/app/main/shared/composants/dto/user/abstract-dto.model'';';
		crlf;
		crlf
]

{ #category : #export }
CSNBuModelExporter >> printImportsFor: aBusinessType [

	self << 'import { JsonProperty, JsonClassType'.
	aBusinessType children ifNotEmpty: [ self <<< ', JsonSubTypes' ].
	self
		<<< ' } from "@outfoxx/jackson-js";';
		crlf;
		<<
			'import { AbstractDTO } from "src/app/main/shared/composants/dto/user/abstract-dto.model";';
		crlf;
		crlf
]
