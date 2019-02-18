Class {
	#name : #CSNBehaviorModelExporterCoreWeb,
	#superclass : #CSNBehaviorModelExporterAngular,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity uniqueName , '('
		, (', ' join: (aFASTJavaMethodEntity parameters collect: [ :parameter | self clone accept: parameter ]))
		,
			') { 
' , (String crlf join: (aFASTJavaMethodEntity statements collect: [ :statement | (self clone accept: statement) indentBy: 4 ]))
		,
			'
}'
]

{ #category : #generated }
CSNBehaviorModelExporterCoreWeb >> visitNavigation: aNavigation [
	^ 'openPhase(''', (aNavigation page ifNotNil: [ :page | page name ] ifNil:  ['TODO']), ''')'
]
