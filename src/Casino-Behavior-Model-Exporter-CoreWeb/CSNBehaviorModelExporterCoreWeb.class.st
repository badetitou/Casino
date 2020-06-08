Class {
	#name : #CSNBehaviorModelExporterCoreWeb,
	#superclass : #CSNBehaviorModelExporterAngular,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitDOMElementAcccess: aDOMElementAcccess [
	aDOMElementAcccess widget
		ifNotNil: [ :widget | 
			| accessVariable |
			accessVariable := 'this.' , widget id.
			widget angularComponent isNative
				ifTrue: [ self
						<<< ('<any>' , accessVariable) inParenthesis;
						<<< '.nativeElement' ]
				ifFalse: [ self <<< accessVariable ] ]
		ifNil: [ self <<< 'ERROR DOM ELEMENT ACCESS' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	self
		<< (aFASTJavaMethodEntity uniqueNameInPage: self currentPage);
		<<< '('.
	aFASTJavaMethodEntity parameters do: [ :parameter | self accept: parameter ] separatedBy: [ self <<< ', ' ].
	self
		<<< ') {';
		indentPlus;
		crlf.
	aFASTJavaMethodEntity statements
		do: [ :statement | 
			self indent.
			self accept: statement ]
		separatedBy: [ self
				writeErrorIfSome;
				crlf ].
	self
		crlf;
		indentMinus;
		<< '}'
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
	self
		<<< 'this.';
		<<< anOpenDialog dialog affectedActions uniqueName;
		<<< '.openDialog()'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitPopUp: aPopUp [
	self <<< 'this._toastrService.success('.
	self accept: aPopUp data.
	self <<< ')'
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
