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
CSNBehaviourModelExporterAngular >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	^ aFASTJavaIdentifier name
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	| text |
	text := 'if (', (self clone accept: aFASTJavaIfStatement condition) , ')', (self clone accept: aFASTJavaIfStatement thenPart).
	aFASTJavaIfStatement ifNotNil: [ text := text , 'else ', (self clone accept: aFASTJavaIfStatement elsePart) ].
	^ text
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	^ (self clone accept: aFASTJavaInfixOperation leftOperand) , ' ', (self clone accept: aFASTJavaInfixOperation operator), ' ', (self clone accept: aFASTJavaInfixOperation rightOperand).
	
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	^ 'null'
]

{ #category : #generated }
CSNBehaviourModelExporterAngular >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	^ '''', aFASTJavaStringLiteral value, ''''
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
CSNBehaviourModelExporterAngular >> visitFASTStatementBlock: aFASTStatementBlock [
	^ ' {', String crlf,( aFASTStatementBlock statements flatCollect: [ :statement | (self clone accept: statement) , String crlf  ]) , '}', String crlf
]
