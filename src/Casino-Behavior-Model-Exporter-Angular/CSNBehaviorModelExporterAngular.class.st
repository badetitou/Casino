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
			((aCall onSuccess ifNil: [ '' ] ifNotNil: [ :success | 'data => ' , (self clone accept: success childrenNode first statementBlock) , ',' , String crlf ])
				, (aCall onFailure ifNil: [ '' ] ifNotNil: [ :failure | 'error => ' , (self clone accept: failure childrenNode first statementBlock) ]) indentBy: 4) , String crlf, ')'
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
	^ (self clone accept: aFASTExpressionStatement expression) , ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ (self clone accept: aFASTJavaAssignementExpression variable), ' = ', (self clone accept: aFASTJavaAssignementExpression expression)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ '(<', (self clone accept: aFASTJavaCastExpression type), '> ', (self clone accept: aFASTJavaCastExpression expression), ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ 'catch (' , (', ' join:(aFASTJavaCatchPartStatement parameters collect: [ :parameter | (self clone accept: parameter) ]))
		, ') ' , (self clone accept: aFASTJavaCatchPartStatement body)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ (self clone accept: aFASTJavaClassProperty type) , '.', aFASTJavaClassProperty fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ aFASTJavaConditionStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ aFASTJavaElsePartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	^ aFASTJavaFieldAccess fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ aFASTJavaIdentifier famixVariable ifNil: [ aFASTJavaIdentifier name ] ifNotNil: [ :famixVariable | famixVariable uniqueName ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	| text |
	text := 'if (' , (self clone accept: aFASTJavaIfStatement condition) , ')' , (self clone accept: aFASTJavaIfStatement thenPart).
	aFASTJavaIfStatement elsePart ifNotNil: [ text := text , 'else ' , (self clone accept: aFASTJavaIfStatement elsePart) ].
	^ text
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ (self clone accept: aFASTJavaInfixOperation leftOperand) , ' ', ( aFASTJavaInfixOperation operator), ' ', (self clone accept: aFASTJavaInfixOperation rightOperand).
	
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity name , '(' , (', ' join: (aFASTJavaMethodEntity parameters collect: [ :parameter | self clone accept: parameter ]))
		,
			') {
' , (String crlf join: (aFASTJavaMethodEntity statements collect: [ :statement | (self clone accept: statement) indentBy: 4 ]))
		,
			'
}'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^ (aFASTJavaMethodInvocation receiver ifNotNil: [ :receiver | (self clone accept: receiver), '.' ] ifNil: [ '' ])
		, aFASTJavaMethodInvocation uniqueName , '('
		, (', ' join: (aFASTJavaMethodInvocation arguments collect: [ :argument | self clone accept: argument ])) , ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
 	^ (super visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression), ' {
',
	(String crlf join: ( aFASTJavaNewClassExpression methods collect: [ :method | (self clone accept: method) indentBy: 4 ] )), ' 
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
	^ aFASTJavaOperationLeftOperand childrenNode flatCollect: [:child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [ 
	^ aFASTJavaOperationRightOperand childrenNode flatCollect: [:child | self clone accept: child ]
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
	^ aFASTJavaThenPartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ 'try ' , (self clone accept: aFASTJavaTryCatchStatement try)
		,
		(aFASTJavaTryCatchStatement catches flatCollect: [ :catch | self clone accept: catch ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ aFASTJavaTryPartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	^ aFASTJavaUnaryExpression isPrefixedUnaryExpression
		ifTrue: [ aFASTJavaUnaryExpression operator
				, (self clone accept: aFASTJavaUnaryExpression expression) ]
		ifFalse: [ (self clone accept: aFASTJavaUnaryExpression expression)
				, aFASTJavaUnaryExpression operator ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ 'let '
		,
			(aFASTJavaVarDeclStatement declarators
				flatCollect: [ :declarator | (self clone accept: declarator) , ' ' ]) , ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	^ (self clone accept: aFASTJavaVariableDeclarator variable)
		,
			(aFASTJavaVariableDeclarator expression
				ifNil: [ '' ]
				ifNotNil: [ ' = ', (self clone accept: aFASTJavaVariableDeclarator expression) ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ 'while(', (self clone accept: aFASTJavaWhileStatement condition), ')', (self clone accept: aFASTJavaWhileStatement body)
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTLiteral: aFASTLiteral [
	^ aFASTLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTNamedEntity: aFASTNamedEntity [
	^ aFASTNamedEntity famixVariable ifNil: [ aFASTNamedEntity name ] ifNotNil: [ :famixVariable | famixVariable uniqueName ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatement: aFASTStatement [
	^ '', (aFASTStatement childrenNode flatCollect: [:child | self clone accept: child])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatementBlock: aFASTStatementBlock [
	^ ' {' , String crlf
		, (aFASTStatementBlock statements flatCollect: [ :statement | ((self clone accept: statement) indentBy: 4) , String crlf ])
		, '}' , String crlf
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTVariableExpression: aFASTVariableExpression [
	^ aFASTVariableExpression famixVariable ifNil: [ aFASTVariableExpression name ] ifNotNil: [ :famixVariable | famixVariable uniqueName ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitNavigation: aNavigation [
	^ 'this.openPhase(''', (aNavigation arguments ifNotEmpty: [ :args | args flatCollect: [ :arg | (self clone accept: arg), ',' ] ] ifEmpty:  ['']), ''')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitPopUp: aPopUp [
	^ String streamContents: [:stream | stream << 'alert(' << (self clone accept: aPopUp data) << ')' ]
]
