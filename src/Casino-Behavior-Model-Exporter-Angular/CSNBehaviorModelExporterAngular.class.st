"
behavioralModel := CSNBehaviorModelImporterJava new uiModel: gwtModel; sourceCodeModel: gwtMooseModel; resetUIAndGenerateBehavioralModel.
behavioralModel asOrderedCollection.

behaviouralModel collect: [ :model | model allFASTJavaMethodEntity first ui source sourceText  ].
behaviouralModel collect: [ :model | CSNBehaviourModelExporterAngular new accept: model allFASTJavaMethodEntity first  ].
behaviouralModel collect: [ :model | String crlf join: (model allFASTJavaMethodEntity collect: [:method | (CSNBehaviourModelExporterAngular new accept: method) ]) ]. 
"
Class {
	#name : #CSNBehaviorModelExporterAngular,
	#superclass : #CSNBehaviorModelExporter,
	#category : #'Casino-Behavior-Model-Exporter-Angular'
}

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitCall: aCall [
	^ 'this.' , aCall distantService serviceOwner uniqueName uncapitalized , '.' , aCall distantService uniqueName , '().subscribe(' , String crlf
		,
			((aCall onSuccess ifNil: [ '' ] ifNotNil: [ :success | 'data => ' , (self accept: success statementBlock) , ',' , String crlf ])
				, (aCall onFailure ifNil: [ '' ] ifNotNil: [ :failure | 'error => ' , (self accept: failure statementBlock) ]) indentBy: 4) , String crlf, ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTBooleanLiteral: aFASTBooleanLiteral [
	^ aFASTBooleanLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTEntity: aFASTEntity [
	^ self error: 'You need to implement a visitor because we must not export an ''Entity'''
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTExpressionStatement: aFASTExpressionStatement [
	^ (self accept: aFASTExpressionStatement expression) , ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ (self accept: aFASTJavaAssignementExpression variable), ' = ', (self accept: aFASTJavaAssignementExpression expression)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ '(<', (self accept: aFASTJavaCastExpression type), '> ', (self accept: aFASTJavaCastExpression expression), ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ 'catch (' , (aFASTJavaCatchPartStatement parameter
		   ifNotNil: [ :parameter | self accept: parameter ]
		   ifNil: [ '' ]) , ') '
	  , (self accept: aFASTJavaCatchPartStatement body)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ (self accept: aFASTJavaClassProperty type) , '.', aFASTJavaClassProperty fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	^ self accept: aFASTJavaClassTypeExpression typeName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ aFASTJavaConditionStatement childrenNode flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ aFASTJavaElsePartStatement childrenNode flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	^ aFASTJavaFieldAccess fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	^ (self accept: aFASTJavaForEachStatement list) , '.forEach((' , (self accept: aFASTJavaForEachStatement fieldname) , ') => '
		, (self accept: aFASTJavaForEachStatement body) , ');'.
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ aFASTJavaIdentifier famixVariable ifNil: [ aFASTJavaIdentifier name ] ifNotNil: [ :famixVariable | famixVariable uniqueName ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	| text |
	text := 'if (' , (self accept: aFASTJavaIfStatement condition) , ')' , (self accept: aFASTJavaIfStatement thenPart).
	aFASTJavaIfStatement elsePart ifNotNil: [ text := text , 'else ' , (self accept: aFASTJavaIfStatement elsePart) ].
	^ text
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ (self accept: aFASTJavaInfixOperation leftOperand) , ' ', ( aFASTJavaInfixOperation operator), ' ', (self accept: aFASTJavaInfixOperation rightOperand).
	
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity name , '(' , (', ' join: (aFASTJavaMethodEntity parameters collect: [ :parameter | self accept: parameter ]))
		,
			') {
' , (String crlf join: (aFASTJavaMethodEntity statements collect: [ :statement | (self accept: statement) indentBy: 4 ]))
		,
			'
}'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^ (aFASTJavaMethodInvocation receiver ifNotNil: [ :receiver | (self accept: receiver), '.' ] ifNil: [ '' ])
		, aFASTJavaMethodInvocation uniqueName , '('
		, (', ' join: (aFASTJavaMethodInvocation arguments collect: [ :argument | self accept: argument ])) , ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
 	^ (super visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression), ' {
',
	(String crlf join: ( aFASTJavaNewClassExpression declarations collect: [ :method | (self accept: method) indentBy: 4 ] )), ' 
}'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	^ 'new ', (self accept: aFASTJavaNewExpression type), '(', (aFASTJavaNewExpression arguments flatCollect: [:arg | (self accept: arg), ',']), ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ 'null'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ aFASTJavaOperationLeftOperand childrenNode flatCollect: [:child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [ 
	^ aFASTJavaOperationRightOperand childrenNode flatCollect: [:child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	^ (self accept: aFASTJavaOuterThis type) ,'this'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ '''' , (aFASTJavaStringLiteral value copyReplaceAll: '''' with: '\''' ) , ''''
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ aFASTJavaThenPartStatement childrenNode flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ 'try ' , (self accept: aFASTJavaTryCatchStatement try)
		,
		(aFASTJavaTryCatchStatement catches flatCollect: [ :catch | self accept: catch ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ aFASTJavaTryPartStatement childrenNode flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTypeName: aFASTJavaTypeName [
	^ aFASTJavaTypeName name
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	^ aFASTJavaUnaryExpression isPrefixedUnaryExpression
		ifTrue: [ aFASTJavaUnaryExpression operator
				, (self accept: aFASTJavaUnaryExpression expression) ]
		ifFalse: [ (self accept: aFASTJavaUnaryExpression expression)
				, aFASTJavaUnaryExpression operator ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ 'let '
		,
			(aFASTJavaVarDeclStatement declarators
				flatCollect: [ :declarator | (self accept: declarator) , ' ' ]) , ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	^ (self accept: aFASTJavaVariableDeclarator variable)
		,
			(aFASTJavaVariableDeclarator expression
				ifNil: [ '' ]
				ifNotNil: [ ' = ', (self accept: aFASTJavaVariableDeclarator expression) ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ 'while(', (self accept: aFASTJavaWhileStatement condition), ')', (self accept: aFASTJavaWhileStatement body)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTLiteral: aFASTLiteral [
	^ aFASTLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTNamedEntity: aFASTNamedEntity [
	^ aFASTNamedEntity name
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatement: aFASTStatement [
	^ '' , (aFASTStatement orderedChildren flatCollect: [ :child | self accept: child ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatementBlock: aFASTStatementBlock [
	^ ' {' , String crlf
		, (aFASTStatementBlock statements flatCollect: [ :statement | ((self accept: statement) indentBy: 4) , String crlf ])
		, '}' , String crlf
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTVariableExpression: aFASTVariableExpression [
	^ aFASTVariableExpression famixVariable ifNil: [ aFASTVariableExpression name ] ifNotNil: [ :famixVariable | famixVariable uniqueName ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitNavigation: aNavigation [
	^ 'this.openPhase(''', (aNavigation arguments ifNotEmpty: [ :args | args flatCollect: [ :arg | (self accept: arg), ',' ] ] ifEmpty:  ['']), ''')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitPopUp: aPopUp [
	^ String streamContents: [:stream | stream << 'alert(' << (self accept: aPopUp data) << ')' ]
]
