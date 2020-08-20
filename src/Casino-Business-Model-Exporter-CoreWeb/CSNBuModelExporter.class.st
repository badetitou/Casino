Class {
	#name : #CSNBuModelExporter,
	#superclass : #Object,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#category : #'Casino-Business-Model-Exporter-CoreWeb'
}

{ #category : #export }
CSNBuModelExporter >> exportAttribute: attribute [
	self << attribute name <<< ': '.
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
CSNBuModelExporter >> exportBusinessType: aBusinessType [

	self printImports.
	(self <<< 'export class ' <<< aBusinessType name)
		<<< ' implements Deserializable {';
		crlf;
		indentPlus.
	(aBusinessType attributes asOrderedCollection sorted: #name ascending) do: [ :attribute | self exportAttribute: attribute ] separatedBy: [ self crlf ].
	self indentMinus.
	self crlf; crlf.
	self indentPlus.
	self printDeserialize.
	self indentMinus.
	self
		crlf;
		<< '}';
		crlf
]

{ #category : #export }
CSNBuModelExporter >> printDeserialize [
	self
		<< 'deserialize(input: any): this {';
		indentPlus;
		crlf;
		<< 'Object.assign(this, input);';
		crlf;
		<< 'return this;';
		crlf;
		indentMinus;
		<< '}';
		crlf;
		indentMinus
]

{ #category : #export }
CSNBuModelExporter >> printImports [
	self << 'import { Deserializable } from ''app/components/service/model/dto/deserializable.model'';'.
	self crlf; crlf
	
]
