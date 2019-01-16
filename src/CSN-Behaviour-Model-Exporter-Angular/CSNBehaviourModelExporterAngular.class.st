"
behaviouralModel do: [ :model | model allFASTJavaMethodEntity first accept: CSNBehaviourModelExporterAngular new ].
"
Class {
	#name : #CSNBehaviourModelExporterAngular,
	#superclass : #CSNBehaviourModelExporter,
	#category : #'CSN-Behaviour-Model-Exporter-Angular'
}

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTBooleanLiteral: aFASTBooleanLiteral [
	^ aFASTBooleanLiteral value
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTExpressionStatement: aFASTExpressionStatement [
	^ ( self clone accept: aFASTExpressionStatement expression) , ';'
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
	^ (self clone accept: aFASTJavaAssignementExpression variable), ' = ', (self clone accept: aFASTJavaAssignementExpression expression)
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	^ '<', (self clone accept: aFASTJavaCastExpression type), '> ', (self clone accept: aFASTJavaCastExpression expression)
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	^ 'catch (', (aFASTJavaCatchPartStatement parameters flatCollect: [:parameter | (self clone accept: parameter), ','] ), ') ' , (self clone accept: aFASTJavaCatchPartStatement body)
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	^ (self clone accept: aFASTJavaClassProperty type), '.'
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	^ aFASTJavaConditionStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	^ aFASTJavaElsePartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ aFASTJavaIdentifier name
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	| text |
	text := 'if (', (self clone accept: aFASTJavaIfStatement condition) , ')', (self clone accept: aFASTJavaIfStatement thenPart).
	aFASTJavaIfStatement elsePart ifNotNil: [ text := text , 'else ', (self clone accept: aFASTJavaIfStatement elsePart) ].
	^ text
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ (self clone accept: aFASTJavaInfixOperation leftOperand) , ' ', ( aFASTJavaInfixOperation operator), ' ', (self clone accept: aFASTJavaInfixOperation rightOperand).
	
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [
	^ aFASTJavaMethodEntity name, '(', (aFASTJavaMethodEntity parameters flatCollect: [:parameter | (self clone accept: parameter), ',' ]), ') { 
	', (aFASTJavaMethodEntity statements flatCollect: [ :statement | (self clone accept: statement) ]), '
	}'.
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	^  (aFASTJavaMethodInvocation receiver ifNotNil: [ :receiver | (self clone accept: receiver) ] ifNil: [ '' ]), 
	  aFASTJavaMethodInvocation name, '(', (aFASTJavaMethodInvocation arguments flatCollect: [:argument | (self clone accept: argument)]),')'
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ 'null'
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ aFASTJavaOperationLeftOperand childrenNode flatCollect: [:child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [ 
	^ aFASTJavaOperationRightOperand childrenNode flatCollect: [:child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ '''', aFASTJavaStringLiteral value, ''''
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ aFASTJavaThenPartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	^ 'try {
	', (self clone accept: aFASTJavaTryCatchStatement try), '}
	',
	(aFASTJavaTryCatchStatement catches flatCollect: [:catch | self clone accept: catch])
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	^ aFASTJavaTryPartStatement childrenNode flatCollect: [ :child | self clone accept: child ]
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	^ 'let ', (aFASTJavaVarDeclStatement declarators flatCollect: [ :declarator | (self clone accept: declarator) , ' ' ]), ';'.
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	^ (self clone accept: aFASTJavaVariableDeclarator variable)
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	^ 'while(', (self clone accept: aFASTJavaWhileStatement condition), ')', (self clone accept: aFASTJavaWhileStatement body)
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTLiteral: aFASTLiteral [
	^ aFASTLiteral value
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTNamedEntity: aFASTNamedEntity [
	^ aFASTNamedEntity name
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTStatement: aFASTStatement [
	^ '', (aFASTStatement childrenNode flatCollect: [:child | self clone accept: aFASTStatement child])
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTStatementBlock: aFASTStatementBlock [
	^ ' {', String crlf,( aFASTStatementBlock statements flatCollect: [ :statement | (self clone accept: statement) , String crlf  ]) , '}', String crlf
]
