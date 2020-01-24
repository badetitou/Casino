Class {
	#name : #CSNBehaviorModelExporterCoreWeb,
	#superclass : #CSNBehaviorModelExporterAngular,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitDOMElementAcccess: aDOMElementAcccess [
	^ 'this.' , (aDOMElementAcccess widget
		   ifNotNil: [ :widget | 
			   widget affectedActions uniqueName
			   , (widget angularComponent isNative
					    ifTrue: [ '.nativeElement' ]
					    ifFalse: [ '' ]) ]
		   ifNil: [ 'BLA' ])
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
