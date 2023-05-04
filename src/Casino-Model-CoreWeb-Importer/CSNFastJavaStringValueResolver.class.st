Class {
	#name : #CSNFastJavaStringValueResolver,
	#superclass : #FASTJavaVisitor,
	#instVars : [
		'stream'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Visitor'
}

{ #category : #resolving }
CSNFastJavaStringValueResolver class >> resolve: aNode [
	
	"('Resolve ' , aNode printString) record."
	^ String streamContents: [ :stream | 
		  aNode accept: (self new
				   stream: stream;
				   yourself) ]
]

{ #category : #accessing }
CSNFastJavaStringValueResolver >> stream [

	^ stream
]

{ #category : #accessing }
CSNFastJavaStringValueResolver >> stream: anObject [

	stream := anObject
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTJavaAssignmentExpression: aFASTJavaAssignementExpression [

	aFASTJavaAssignementExpression expression accept: self
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [

	self visitFASTTVariableExpression: aFASTJavaFieldAccess
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	 
	aFASTJavaInfixOperation leftOperand accept: self.
	aFASTJavaInfixOperation rightOperand accept: self
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self stream << aFASTJavaStringLiteral primitiveValue
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTTEntity: aFASTTEntity [
	
]

{ #category : #visiting }
CSNFastJavaStringValueResolver >> visitFASTTVariableExpression: aFASTVariableExpression [

	((aFASTVariableExpression famixVariable isKindOf: FamixJavaAttribute) 
		 or: [ 
			 aFASTVariableExpression famixVariable isKindOf:
				 FamixJavaLocalVariable ]) ifTrue: [ 
		(aFASTVariableExpression famixVariable allAtScope: FamixTClass)
			asOrderedCollection last isStub ifFalse: [ 
			(aFASTVariableExpression famixVariable allAtScope: FamixTClass)
				asOrderedCollection last generateFastIfNotDoneAndBind.
			(aFASTVariableExpression famixVariable fastDeclaration anyOne 
				 isKindOf: FASTJavaParameter) ifTrue: [ ^ self ].
			(aFASTVariableExpression famixVariable fastDeclaration anyOne
				 expression isKindOf: FASTJavaNullLiteral)
				ifFalse: [ 
					aFASTVariableExpression famixVariable fastDeclaration anyOne
						expression ifNotNil: [ :expression | expression accept: self ] ]
				ifTrue: [ 
					aFASTVariableExpression famixVariable fastAssignment 
						ifNotEmpty: [ :assignements | 
							(assignements sorted: [ :a :b | a startPos < b startPos ])
								first accept: self ] ] ] ]
]
