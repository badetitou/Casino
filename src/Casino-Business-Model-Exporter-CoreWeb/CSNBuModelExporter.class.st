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

	aDTO writeBusinessTypeOn: self.
]

{ #category : #export }
CSNBuModelExporter >> exportBusinessType: aBusinessType [
	(self <<< 'export class ' <<< aBusinessType name)
		<<< ' implements Deserializable {';
		crlf;
		indentPlus;
		crlf.
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
		indentMinus.
	self
		indentPlus;
		crlf.
	(aBusinessType attributes asOrderedCollection sorted: #name ascending) do: [ :attribute | self exportAttribute: attribute ] separatedBy: [ self crlf ].
	self indentMinus.
	self
		crlf;
		<< '}';
		crlf
]
