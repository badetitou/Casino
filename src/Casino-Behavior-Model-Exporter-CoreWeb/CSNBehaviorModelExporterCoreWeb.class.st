Class {
	#name : #CSNBehaviorModelExporterCoreWeb,
	#superclass : #CSNBehaviorModelExporterAngular,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitDOMElementAcccess: aDOMElementAcccess [
	^ aDOMElementAcccess widget
		ifNotNil: [ :widget | 
			| accessVariable |
			accessVariable := 'this.' , widget affectedActions uniqueName.
			widget angularComponent isNative
				ifTrue: [ ('<any>', accessVariable) inParenthesis , '.nativeElement' ]
				ifFalse: [ accessVariable ] ]
		ifNil: [ 'ERROR DOM ELEMENT ACCESS' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity uniqueName , '(' , (', ' join: (aFASTJavaMethodEntity parameters collect: [ :parameter | self clone accept: parameter ]))
		,
			') {
' , (String crlf join: (aFASTJavaMethodEntity statements collect: [ :statement | (self clone accept: statement) indentBy: 4 ]))
		,
			'
}'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitGetElementAttribute: aGetElementAttribute [
	1halt.
	^ (aGetElementAttribute receiver
		   ifNotNil: [ :receiver | (self clone accept: receiver) , '.' ]
		   ifNil: [ '' ]) , 'getElementAccess'
	  , aGetElementAttribute attribute name, '(' , (', ' join:
		   (aGetElementAttribute arguments collect: [ :argument | 
			    self clone accept: argument ])) , ')'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitNavigation: aNavigation [
	^ 'this.openPhase(''', (aNavigation page ifNotNil: [ :page | page name ] ifNil:  ['TODO']), ''')'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitOpenDialog: anOpenDialog [
	^ 'this.' , anOpenDialog dialog affectedActions uniqueName , '.openDialog()'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitPopUp: aPopUp [
	^ String streamContents: [ :stream | stream << 'this._toastrService.success(' << (self clone accept: aPopUp data) << ')' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitSetElementAttribute: aSetElementAttribute [
	^ (aSetElementAttribute receiver
		   ifNotNil: [ :receiver | (self clone accept: receiver) , '.' ]
		   ifNil: [ '' ]) , 'set'
	  , aSetElementAttribute attribute name, '(' , (', ' join:
		   (aSetElementAttribute arguments collect: [ :argument | 
			    self clone accept: argument ])) , ')'
]
