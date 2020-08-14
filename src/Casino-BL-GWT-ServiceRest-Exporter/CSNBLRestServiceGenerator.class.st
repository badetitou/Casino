Class {
	#name : #CSNBLRestServiceGenerator,
	#superclass : #FAMIX2JavaVisitor,
	#instVars : [
		'service'
	],
	#category : #'Casino-BL-GWT-ServiceRest-Exporter'
}

{ #category : #actions }
CSNBLRestServiceGenerator class >> export: service [
	self new service: service; export
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> addAnnotation [
	(currentStream << '@Path("' << service targetPoint asKebabCase)
		<< '")';
		crlf
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> addAnnotationForServiceAPI: aServiceAPI [
	(self << '@Path("' <<< aServiceAPI name asKebabCase)
		<<< '")';
		crlf.
	self addRESTTypeAnnotationFor: aServiceAPI.
	aServiceAPI isPOST
		ifTrue: [ self
				<< '@Consumes(MediaType.APPLICATION_JSON)';
				crlf ].
	self
		<< '@Produces(MediaType.APPLICATION_JSON)';
		crlf
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> addRESTTypeAnnotationFor: aServiceAPI [
	aServiceAPI isDELETE
		ifTrue: [ self << '@DELETE' ]
		ifFalse: [ aServiceAPI isPOST
				ifTrue: [ self << '@POST' ]
				ifFalse: [ self << '@GET' ] ].
	self crlf
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> createNamespaceFolderForClass: class [
	self visitNamespace: (class atScope: FAMIXNamespace) anyOne
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> export [
	self rootFolder ensureCreateDirectory.
	service ifNil: [ self error ].
	service source ifNotNil: [ :source | self createNamespaceFolderForClass: source ].
	self visit: service source
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> initialize [
	super initialize.
	self rootFolder: FileSystem disk workingDirectory asFileReference / self rootNamespace
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> printImports: aClass [
	super printImports: aClass.
	aClass subclassHierarchyGroup do: [ :subClass | self printImports: subClass ]
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> printRESTImports [
	self << 'import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.DELETE;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;'
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> rootNamespace [
	^ 'fr/bl/server/omaje/ws/rest'
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> service: aService [
	service := aService 
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> visitClass: aClass [
	| file |
	file := self rootFolder / ('Rest' , (aClass name removePrefix: 'IGwt') , '.java').
	file deleteIfAbsent: [  ].
	file
		writeStreamDo: [ :stream | 
			currentStream := stream.
			"Printing class package and imports if the class is not an inner class"
			aClass container isNamespace
				ifTrue: [ self << 'package '.
					aClass container fullNameLowerCasePrintOn: currentStream.
					self
						<<< ';';
						crlf;
						crlf.
					self printImports: aClass.
					self crlf.
					self printRESTImports.
					self
						crlf;
						crlf ].
			"Printing class annotations"
			self addAnnotation.
			"Printing Class declaration"
			currentStream << 'public '.
			currentStream << 'class '.
			currentStream << 'Rest' << (aClass name removePrefix: 'IGwt').
			currentStream
				<< ' {';
				<< String crlf.
			"Printing Attributs"
			tabs := tabs + 1.
			(aClass attributes, aClass subclassHierarchyGroup collect: #attributes) flattened
				do: [ :attribute | 
					self clone visit: attribute.
					currentStream << String crlf ].
			self crlf.
			"Closing Class"
			service actions
				do: [ :action | self visitServiceAPI: action ]
				separatedBy: [ self
						crlf;
						crlf ].

			currentStream
				<< String crlf;
				<< '}' ]
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> visitNamespace: aNamespace [
	aNamespace name = '<Default Package>' ifTrue: [ ^ self ].
	((aNamespace allParents reject: [ :p | p name = 'remote' ]) reverse allButFirst: 4)
		do: [ :namespace | 
			self rootFolder: self rootFolder / namespace name asLowercase.
			self rootFolder ensureCreateDirectory ].
	aNamespace name = 'remote'
		ifFalse: [ self rootFolder: self rootFolder / aNamespace name asLowercase.
			self rootFolder ensureCreateDirectory ]
]

{ #category : #accessing }
CSNBLRestServiceGenerator >> visitServiceAPI: aServiceAPI [
	| aMethod |
	aMethod := aServiceAPI source.
	aMethod isStub ifTrue: [ ^ self ].
	"Printing method annotations"
	aMethod comments do: [ :comment | self << comment sourceText ] separatedBy: [ self crlf ].
	aMethod methodsOverriding do: [ :methodOverriding | methodOverriding comments do: [ :comment | self << comment sourceText ] ] separatedBy: [ self crlf ].
	self crlf.
	self addAnnotationForServiceAPI: aServiceAPI.
	"Printing modifiers of method ex: static,public/private/protected"
	self indent.
	aMethod modifiers
		do: [ :modifier | 
			self
				<<< modifier;
				space ].
	"Printing return type for method"
	aMethod declaredType
		ifNotNil: [ :declaredType | 
			self printDeclaredType: declaredType.
			currentStream << String space ].
	"Printing name + parameters of method"
	(aMethod name = '<Initializer>' or: [ aMethod isInitializer and: [ aMethod isConstructor not ] ])
		ifFalse: [ self
				<<< aMethod name;
				<<< '('.
			(aMethod parameters sorted: [ :p :p2 | p sourceAnchor startPos < p2 sourceAnchor startPos ]) do: [ :parameter | self clone visit: parameter ] separatedBy: [ self <<< ', ' ].
			self <<< ')' ]
		ifTrue: [ self << 'static' ].
	"Printing body of method if class is not abstract or an interface"

	currentStream
		<< ' {';
		<< String crlf.
	aMethod methodsOverriding do: [ :methodOverriding | self << methodOverriding bodySourceText ] separatedBy: [ self crlf ].
	self
		crlf;
		<< '}'
]
