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
			accessVariable := 'this.' , widget id.
			widget angularComponent isNative
				ifTrue: [ ('<any>', accessVariable) inParenthesis , '.nativeElement' ]
				ifFalse: [ accessVariable ] ]
		ifNil: [ 'ERROR DOM ELEMENT ACCESS' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity uniqueName , '(' , (', ' join: (aFASTJavaMethodEntity parameters collect: [ :parameter | self accept: parameter ]))
		,
			') {
' , (String crlf join: (aFASTJavaMethodEntity statements collect: [ :statement | (self accept: statement) indentBy: 4 ]))
		,
			'
}'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitGetElementAttribute: aGetElementAttribute [
	^ (aGetElementAttribute receiver
		ifNotNil: [ :receiver | (self accept: receiver) , '.' ]
		ifNil: [ '' ]) , aGetElementAttribute attribute name
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
	^ String streamContents: [ :stream | stream << 'this._toastrService.success(' << (self accept: aPopUp data) << ')' ]
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitSetElementAttribute: aSetElementAttribute [
	^ (aSetElementAttribute receiver
		   ifNotNil: [ :receiver | (self accept: receiver) , '.' ]
		   ifNil: [ '' ]) , 'set'
	  , aSetElementAttribute attribute name, '(' , (', ' join:
		   (aSetElementAttribute arguments collect: [ :argument | 
			    self accept: argument ])) , ')'
]
