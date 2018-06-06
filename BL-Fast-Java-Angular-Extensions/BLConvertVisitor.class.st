"
I am a visitor of a FAST Model... with me, you will be able to convert your code into another model and extract the @BLBehavior of source code
"
Class {
	#name : #BLConvertVisitor,
	#superclass : #PJASTNodeVisitor,
	#instVars : [
		'handler'
	],
	#category : 'BL-Fast-Java-Angular-Extensions'
}

{ #category : #visiting }
BLConvertVisitor >> convertResponsabilitiesHandler [
	^ handler
]

{ #category : #visiting }
BLConvertVisitor >> initialize [
	handler := BLConverterHandlerAttributeName new
]

{ #category : #visiting }
BLConvertVisitor >> model: aModel [
	handler model: aModel
]

{ #category : #visiting }
BLConvertVisitor >> visitBooleanLiteralNode: aBooleanLiteralNode [
]

{ #category : #visiting }
BLConvertVisitor >> visitExpressionStatementNode: anExpressionStatementNode [
	 self visitNode: anExpressionStatementNode expression
]

{ #category : #visiting }
BLConvertVisitor >> visitIdentifierNode: anIdentifierNode [
	self convertResponsabilitiesHandler handleIdentifier: anIdentifierNode 
]

{ #category : #visiting }
BLConvertVisitor >> visitIfStatementNode: anIfStatementNode [
	self visitNode: anIfStatementNode condition.
	self visitNode: anIfStatementNode thenPart.
	anIfStatementNode elsePart ifNotNil: [ self visitNode: anIfStatementNode elsePart] 
]

{ #category : #visiting }
BLConvertVisitor >> visitInfixOperationNode: anInfixOperationNode [
	self visitNode: anInfixOperationNode left.
	self visitNode: anInfixOperationNode right
]

{ #category : #visiting }
BLConvertVisitor >> visitIntegerLiteralNode: aIntegerLiteralNode [
]

{ #category : #visiting }
BLConvertVisitor >> visitLocalVariableDeclarationStatementNode: aLocalVariableDeclarationStatementNode [
	self visitNode: aLocalVariableDeclarationStatementNode type.
	aLocalVariableDeclarationStatementNode modifiers ifNotNil: [ self visitNodes: aLocalVariableDeclarationStatementNode modifiers ].
	aLocalVariableDeclarationStatementNode declarators do: [:each | self visitNode: each ]
]

{ #category : #visiting }
BLConvertVisitor >> visitMethodDeclarationNode: aMethodDeclarationNode [
	self visitNode: aMethodDeclarationNode body
]

{ #category : #visiting }
BLConvertVisitor >> visitNullLiteralNode: aNullLiteralNode [
]

{ #category : #visiting }
BLConvertVisitor >> visitStatementBlockNode: aStatementBlockNode [
	aStatementBlockNode statements do: [:each | self visitNode: each ].
]

{ #category : #visiting }
BLConvertVisitor >> visitStringLiteralNode: aStringLiteralNode [
]

{ #category : #visiting }
BLConvertVisitor >> visitVariableDeclaratorNode: aVariableDeclaratorNode [
	self visitNode: aVariableDeclaratorNode variable.
	self visitNode: aVariableDeclaratorNode initializer
]
