Class {
	#name : #CSNBuModelExporter,
	#superclass : #Object,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#category : #'Casino-Business-Model-Exporter-CoreWeb'
}

{ #category : #export }
CSNBuModelExporter >> exportAttribute: attribute [
	attribute attributeType printDeserializeOn: self forAttributeNamed: attribute name.
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
	self << 'export class ' <<< aBusinessType name <<< ' extends AbstractDTO '.
	self
		inBraces: [ (aBusinessType attributes asOrderedCollection sorted: #name ascending) do: [ :attribute | self exportAttribute: attribute ] separatedBy: [ self crlf ].
			self
				crlf;
				crlf.
			(aBusinessType attributes asOrderedCollection sorted: #name ascending)
				do: [ :attribute | 
					self exportAttributeGetter: attribute.
					self
						crlf;
						crlf.
					self exportAttributeSetter: attribute ]
				separatedBy: [ self
						crlf;
						crlf ] ].
	self crlf
]

{ #category : #export }
CSNBuModelExporter >> printImportDependencenciesOf: aBusinessType [
	aBusinessType dependencies
		ifNotEmpty: [ :dependencies | 
			(dependencies asOrderedCollection sorted: #name ascending)
				do: [ :dependency | self << 'import { ' <<< dependency name <<< ' } from ''..'';' ]
				separatedBy: [ self crlf ].
			self
				crlf;
				crlf ]
]

{ #category : #export }
CSNBuModelExporter >> printImports [
	self
		<< 'import { Type } from ''class-transformer'';';
		crlf;
		<< 'import { AbstractDTO } from ''app/components/service/model/dto/shared/user/abstract-dto.model'';';
		crlf
]
