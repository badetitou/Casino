Class {
	#name : #CSNBusinessModelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'dto',
		'primitive',
		'complexType',
		'booleanType',
		'dateType',
		'integerType',
		'stringType',
		'collectionType',
		'dictionaryType',
		'businessType',
		'attribute'
	],
	#category : #'Casino-Business-Model-Generator'
}

{ #category : #accessing }
CSNBusinessModelGenerator class >> packageName [

	^ #'Casino-Business-Model'
]

{ #category : #accessing }
CSNBusinessModelGenerator class >> prefix [
	^ #CSNBu
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForAttribute [
	^ 'I represent an attribute of a businessType'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForBusinessType [
	^ 'I represent a kind of data created by the developers of the application.
I am composed of other DTO'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForCollectionType [
	^ 'I represent a collection of one DataType'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForComplexType [
	^ 'I represent a complex data. Often structural entity such as collection or dictionary'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForDTO [
	^ '(Data Transfer Object)
I represent any kind of data easy to transfert.'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForDictionaryType [
	^ 'I represent a dictionary of two data type
key: <dataType> value: <dataType>'
]

{ #category : #comments }
CSNBusinessModelGenerator >> commentForPrimitive [
	^ 'I represent simple and know type used in many application'
]

{ #category : #definition }
CSNBusinessModelGenerator >> defineClasses [
	super defineClasses.
	dto := builder newClassNamed: #DTO comment: self commentForDTO.
	attribute := builder newClassNamed: #Attribute comment: self commentForAttribute.
	
	
	"Kind of Data Type"
	businessType := builder newClassNamed: #BusinessType comment: self commentForBusinessType.
	primitive := builder newClassNamed: #Primitive comment: self commentForPrimitive.
	complexType := builder newClassNamed: #ComplexType comment: self commentForComplexType.	
	
	"Kind of complexType"
	collectionType := builder newClassNamed: #CollectionType comment: self commentForCollectionType.
	dictionaryType := builder newClassNamed: #DictionaryType comment: self commentForDictionaryType
]

{ #category : #definition }
CSNBusinessModelGenerator >> defineHierarchy [
	super defineHierarchy.
	primitive --|> dto.
	businessType --|> dto.
	complexType --|> dto.
	
	collectionType --|> complexType.
	dictionaryType --|> complexType.
	
	
]

{ #category : #definition }
CSNBusinessModelGenerator >> defineProperties [
	super defineProperties.
	businessType property: #name type: #String.
	attribute property: #name type: #String.
	primitive property: #name type: #String.
]

{ #category : #definition }
CSNBusinessModelGenerator >> defineRelations [
	super defineRelations.
	((businessType property: #attributes) <>-* (attribute property: #businessType)).
	(attribute property: #attributeType) *-* (dto property: #usedInAttributes).
	(collectionType property: #type) *- (dto property: #inCollectionTypes).
	(dictionaryType property: #key) *- (dto property: #asKeyInDictionaryTypes).
	(dictionaryType property: #value) *- (dto property: #asValueInDictionaryTypes).
]
