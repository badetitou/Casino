Class {
	#name : #CSNBehaviorModelExporterCoreWeb,
	#superclass : #CSNBehaviorModelExporterAngular,
	#instVars : [
		'rootMethod'
	],
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> export: aBehaviorMethod [
	[ self showUnknowExport ifTrue: [ self errorStream: (WriteStream with: String new) ].
	self rootMethod: aBehaviorMethod.
	[ self accept: aBehaviorMethod ]
		on: Error
		do: [ :err | 
			('Err during export of: ' , aBehaviorMethod sourceText) record.
			err signal ] ]
		ensure: [ self errorStream
				flush;
				close ]
]

{ #category : #accessing }
CSNBehaviorModelExporterCoreWeb >> rootMethod [

	^ rootMethod
]

{ #category : #accessing }
CSNBehaviorModelExporterCoreWeb >> rootMethod: anObject [

	rootMethod := anObject
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitDOMElementAcccess: aDOMElementAcccess [
	aDOMElementAcccess widget
		ifNotNil: [ :widget | 
			| accessVariable |
			accessVariable := 'this.' , widget id.
			(self exporterAngularConfiguration angularRepresentationOf: widget)
				isNative
				ifTrue: [ self
						inParenthesisNoIndent: [ self <<< ('<any>' , accessVariable) ];
						<<< '.nativeElement' ]
				ifFalse: [ self <<< accessVariable ] ]
		ifNil: [ self <<< 'ERROR DOM ELEMENT ACCESS' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [

	self
		<< (aFASTJavaMethodEntity uniqueNameInPage: self currentPage);
		<<< '('.
	aFASTJavaMethodEntity parameters
		do: [ :parameter | self accept: parameter ]
		separatedBy: [ self <<< ', ' ].
	self <<< ') {'.
	self rootMethod = aFASTJavaMethodEntity ifTrue: [ self <<< '/*' ].
	self
		indentPlus;
		crlf.
	aFASTJavaMethodEntity statements
		do: [ :statement | 
			self indent.
			self accept: statement ]
		separatedBy: [ 
			self
				writeErrorIfSome;
				crlf ].
	self
		crlf;
		indentMinus;
		indent.
	self rootMethod = aFASTJavaMethodEntity ifTrue: [ self <<< '*/' ].
	self <<< '}'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitGetElementAttribute: aGetElementAttribute [
	aGetElementAttribute receiver
		ifNotNil: [ :receiver | 
			self accept: receiver.
			self <<< '.' ].
	self <<< aGetElementAttribute attribute name
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitNavigation: aNavigation [
	self <<< 'this.openPhase('.
	aNavigation page
		ifNotNil: [ :page | 
			self
				<<< 'this.';
				<<< page name ]
		ifNil: [ self <<< '''TODO''' ].
	self <<< ')'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitOpenDialog: anOpenDialog [
	self <<< 'this.'.
	anOpenDialog dialog affectedActions
		ifNotNil: [ :affectedActions | self <<< affectedActions uniqueName ]
		ifNil: [ self <<< 'unknowDialog'.
			self errorStream
				<< 'unknowDialog: ';
				<< anOpenDialog dialog sources printString ].
	self <<< '.openDialog()'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitPopUp: aPopUp [
	self <<< 'this._snackBar.open('.
	self accept: aPopUp data.
	self <<< ', "Fermer")'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitSetElementAttribute: aSetElementAttribute [
	aSetElementAttribute receiver
		ifNotNil: [ :receiver | 
			self accept: receiver.
			self <<< '.' ].
	self
		<<< 'set';
		<<< aSetElementAttribute attribute name;
		<<< '('.
	aSetElementAttribute arguments do: [ :argument | self accept: argument ] separatedBy: [ self <<< ', ' ].
	self <<< ')'
]
