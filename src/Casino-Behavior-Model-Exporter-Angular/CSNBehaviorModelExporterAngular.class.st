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
	#instVars : [
		'currentPage',
		'exporterAngularConfiguration'
	],
	#category : #'Casino-Behavior-Model-Exporter-Angular'
}

{ #category : #accessing }
CSNBehaviorModelExporterAngular >> currentPage [
	^ currentPage
]

{ #category : #accessing }
CSNBehaviorModelExporterAngular >> currentPage: anObject [
	currentPage := anObject
]

{ #category : #accessing }
CSNBehaviorModelExporterAngular >> exporterAngularConfiguration [
	^ exporterAngularConfiguration
]

{ #category : #accessing }
CSNBehaviorModelExporterAngular >> exporterAngularConfiguration: anObject [
	exporterAngularConfiguration := anObject
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitCall: aCall [
	self
		<<< 'this.';
		<<< aCall distantService serviceOwner uniqueName uncapitalized;
		<<< '.';
		<<< aCall distantService uniqueName;
		<<< '().subscribe(';
		crlf;
		indentPlus.
	aCall onSuccess
		ifNotNil: [ :success | 
			"set the futur variable with the good name"
			aCall onSuccess parameters first famixVariable uniqueName: 'data'.
			self << 'data => '.
			self accept: success statementBlock.
			self
				<< ',';
				crlf ].
	aCall onFailure
		ifNotNil: [ :failure | 
			"set the futur variable with the good name"
			aCall onFailure parameters first famixVariable uniqueName: 'error'.
			self << 'error => '.
			self accept: failure statementBlock ].
	self
		crlf;
		indentMinus;
		<< ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaArrayAccess: aFASTJavaArrayAccess [
	self accept: aFASTJavaArrayAccess array.
	self <<< '['.
	self accept: aFASTJavaArrayAccess expression.
	self <<< ']'.
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaArrayInitializer: aFASTJavaArrayInitializer [
	self <<< '['.
	aFASTJavaArrayInitializer initializers do: [ :initializer | self accept: initializer ] separatedBy: [ self <<< ', ' ].
	self <<< ']'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaAssignmentExpression: aFASTJavaAssignementExpression [
	self accept: aFASTJavaAssignementExpression variable.
	self <<< ' = '.
	self accept: aFASTJavaAssignementExpression expression
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCastExpression: aFASTJavaCastExpression [
	self <<< '(<'.
	self accept: aFASTJavaCastExpression type.
	self <<< '> '.
	self accept: aFASTJavaCastExpression expression.
	self <<< ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaCatchPartStatement: aFASTJavaCatchPartStatement [
	self <<< 'catch ('.
	aFASTJavaCatchPartStatement parameter ifNotNil: [ :parameter | self accept: parameter ].
	self <<< ') '.
	self accept: aFASTJavaCatchPartStatement body
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaClassProperty: aFASTJavaClassProperty [
	self accept: aFASTJavaClassProperty type.
	self
		<<< '.';
		<<< aFASTJavaClassProperty fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaClassTypeExpression: aFASTJavaClassTypeExpression [
	self accept: aFASTJavaClassTypeExpression typeName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaConditionStatement: aFASTJavaConditionStatement [
	aFASTJavaConditionStatement orderedChildren flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaConditionalExpression: aFASTJavaConditionalExpression [
	self accept: aFASTJavaConditionalExpression condition.
	self <<< ' ? '.
	self accept: aFASTJavaConditionalExpression thenPart.
	self <<< ' : '.
	self accept: aFASTJavaConditionalExpression elsePart
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	aFASTJavaElsePartStatement orderedChildren flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaEmptyDimExpression: aFASTJavaEmptyDimExpression [

	
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaEmptyMethodDeclaration: aFASTJavaEmptyMethodDeclaration [
	"This is empty and useless so I decided to remove this useless method declaration"
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaFieldAccess: aFASTJavaFieldAccess [
	self <<< aFASTJavaFieldAccess fieldName
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaForEachStatement: aFASTJavaForEachStatement [
	self accept: aFASTJavaForEachStatement list.
	self <<< '.forEach(('.
	self accept: aFASTJavaForEachStatement fieldname.
	self <<< ') => '.
	self accept: aFASTJavaForEachStatement body.
	self <<< ');'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIdentifier: aFASTJavaIdentifier [
	self
		<<<
			(aFASTJavaIdentifier famixVariable
				ifNil: [ aFASTJavaIdentifier name ]
				ifNotNil: [ :famixVariable | famixVariable uniqueName ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaIfStatement: aFASTJavaIfStatement [
	self <<< 'if ('.
	self accept: aFASTJavaIfStatement condition.
	self <<< ')'.
	self accept: aFASTJavaIfStatement thenPart.
	aFASTJavaIfStatement elsePart
		ifNotNil: [ self
				crlf;
				<< 'else '.
			self accept: aFASTJavaIfStatement elsePart ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaInfixOperation: aFASTJavaInfixOperation [
	self accept: aFASTJavaInfixOperation leftOperand.
	self
		<<< ' ';
		<<< aFASTJavaInfixOperation operator;
		<<< ' '.
	self accept: aFASTJavaInfixOperation rightOperand
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodEntity: aFASTJavaMethodEntity [

	self
		<< aFASTJavaMethodEntity name;
		<<< '('.
	aFASTJavaMethodEntity parameters do: [ :parameter | self accept: parameter ] separatedBy: [ self <<< ', ' ].
	self
		<<< ') {';
		indentPlus;
		crlf.

	aFASTJavaMethodEntity statements
		do: [ :statement | 
			self indent.
			self accept: statement ]
		separatedBy: [ 
			self
				writeErrorIfSome;
				crlf ].
	self
		crlf;
		indentMinus;
		<< '}'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaMethodInvocation: aFASTJavaMethodInvocation [
	aFASTJavaMethodInvocation receiver
		ifNotNil: [ :receiver | 
			self accept: receiver.
			self <<< '.' ].
	self
		<<< (aFASTJavaMethodInvocation uniqueNameInPage: self currentPage);
		<<< '('.
	aFASTJavaMethodInvocation arguments do: [ :argument | self accept: argument ] separatedBy: [ self <<< ', ' ].
	self <<< ')'.

	self errorStream << 'Unknow invocation: ' << (aFASTJavaMethodInvocation uniqueNameInPage: self currentPage) << '(...) | '
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewArray: aFASTJavaNewArray [

	aFASTJavaNewArray type accept: self.
	self <<< '['.
	aFASTJavaNewArray arguments
		do: [ :arg | self accept: arg ]
		separatedBy: [ self <<< ',' ].
	self <<< ']'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	aFASTJavaNewClassExpression famixType isAnonymousClass
		ifTrue: [ self <<< 'new class'.
			aFASTJavaNewClassExpression famixType superclass mooseName = #'java::lang::Object'
				ifFalse: [ self
						<<< ' extends ';
						<<< aFASTJavaNewClassExpression famixType superclass name ].
			(aFASTJavaNewClassExpression famixType superclassHierarchy select: #isInterface)
				ifNotEmpty: [ :interfaces | 
					self <<< ' implements'.
					interfaces
						do: [ :interface | 
							self
								<<< ' ';
								<<< interface name ]
						separatedBy: [ self <<< ',' ] ] ]
		ifFalse: [ super visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression ].

	self
		<<< ' {';
		crlf.
	aFASTJavaNewClassExpression declarations
		do: [ :method | 
			self indentPlus.
			self accept: method.
			self crlf.
			self indentMinus ].
	self << '}'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNewExpression: aFASTJavaNewExpression [
	self <<< 'new '.
	self accept: aFASTJavaNewExpression type.
	self <<< '('.
	aFASTJavaNewExpression arguments
		do: [ :arg | 
			self accept: arg.
			self <<< ',' ].
	self <<< ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaNullLiteral: aFASTJavaNullLiteral [
	self <<< 'null'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOperationLeftOperand: aFASTJavaOperationLeftOperand [
	^ aFASTJavaOperationLeftOperand orderedChildren flatCollect: [:child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOperationRightOperand: aFASTJavaOperationRightOperand [ 
	^ aFASTJavaOperationRightOperand orderedChildren flatCollect: [:child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaOuterThis: aFASTJavaOuterThis [
	self accept: aFASTJavaOuterThis type.
	self <<< 'this'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaParameter: aFASTJavaParameter [
	^ self visitFASTTVariableExpression: aFASTJavaParameter variable
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaStatement: aFASTJavaStatement [

	^ self visitFASTTStatement: aFASTJavaStatement
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self
		<<< '''';
		<<< aFASTJavaStringLiteral primitiveValue protectQuote;
		<<< ''''
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaThenPartStatement: aFASTJavaThenPartStatement [
	^ aFASTJavaThenPartStatement orderedChildren flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryCatchStatement: aFASTJavaTryCatchStatement [
	self <<< 'try'.
	self accept: aFASTJavaTryCatchStatement try.
	aFASTJavaTryCatchStatement catches
		do: [ :catch | 
			self indent.
			self accept: catch ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTryPartStatement: aFASTJavaTryPartStatement [
	aFASTJavaTryPartStatement orderedChildren do: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaTypeName: aFASTJavaTypeName [
	self <<< aFASTJavaTypeName name
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaUnaryExpression: aFASTJavaUnaryExpression [
	aFASTJavaUnaryExpression isPrefixedUnaryExpression
		ifTrue: [ self <<< aFASTJavaUnaryExpression operator.
			self accept: aFASTJavaUnaryExpression expression ]
		ifFalse: [ self accept: aFASTJavaUnaryExpression expression.
			self <<< aFASTJavaUnaryExpression operator ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVarDeclStatement: aFASTJavaVarDeclStatement [
	self <<< 'let '.
	aFASTJavaVarDeclStatement declarators do: [ :declarator | self accept: declarator ] separatedBy: [ self <<< ' ' ].
	self <<< ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaVariableDeclarator: aFASTJavaVariableDeclarator [
	self accept: aFASTJavaVariableDeclarator variable.

	aFASTJavaVariableDeclarator expression
		ifNotNil: [ self <<< ' = '.
			self accept: aFASTJavaVariableDeclarator expression ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaWhileStatement: aFASTJavaWhileStatement [
	self <<< 'while('.
	self accept: aFASTJavaWhileStatement condition.
	self <<< ')'.
	self accept: aFASTJavaWhileStatement body
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTBooleanLiteral: aFASTBooleanLiteral [
	self <<< aFASTBooleanLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTEntity: aFASTEntity [

	self debugMode
		ifTrue: [ 
			self error:
				'You need to implement a visitor because we must not export an ''Entity''. Issue raised with '
				, aFASTEntity class name ]
		ifFalse: [ super visitFASTEntity: aFASTEntity ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTExpressionStatement: aFASTExpressionStatement [
	(self accept: aFASTExpressionStatement expression).
	self <<< ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTLiteral: aFASTLiteral [
	self <<< aFASTLiteral primitiveValue
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTNamedEntity: aFASTNamedEntity [
	self <<< aFASTNamedEntity name
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTStatement: aFASTStatement [
	self indent.
	aFASTStatement orderedChildren do: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTStatementBlock: aFASTStatementBlock [
	self
		<<< ' {';
		indentPlus;
		crlf.
	aFASTStatementBlock statements
		do: [ :statement | 
			self indent.
			self accept: statement ]
		separatedBy: [ self writeErrorIfSome.
			self crlf ].
	self
		crlf;
		indentMinus;
		<< '}';
		crlf
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTTVariableExpression: aFASTVariableExpression [
	self
		<<<
			(aFASTVariableExpression famixVariable
				ifNil: [ aFASTVariableExpression name ]
				ifNotNil: [ :famixVariable | famixVariable uniqueName ])
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitNavigation: aNavigation [
	self <<< 'this.openPhase('''.
	aNavigation arguments
		ifNotEmpty: [ :args | 
			args
				do: [ :arg | 
					self
						<<< (self accept: arg);
						<<< ',' ] ].
	self <<< ''')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitPopUp: aPopUp [
	self <<< 'alert('.
	self accept: aPopUp data.
	self <<< ')'
]
