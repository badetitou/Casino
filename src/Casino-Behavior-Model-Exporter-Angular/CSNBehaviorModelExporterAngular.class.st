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
		'currentPage'
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
			self << 'data => '.
			self accept: success statementBlock.
			self
				<< ',';
				crlf ].
	aCall onFailure
		ifNotNil: [ :failure | 
			self << 'error => '.
			self accept: failure statementBlock ].
	self
		crlf;
		indentMinus;
		<< ')'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTBooleanLiteral: aFASTBooleanLiteral [
	self <<< aFASTBooleanLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTEntity: aFASTEntity [
	self debugMode
		ifTrue: [ self error: 'You need to implement a visitor because we must not export an ''Entity''' ]
		ifFalse: [ super visitFASTEntity: aFASTEntity ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTExpressionStatement: aFASTExpressionStatement [
	(self accept: aFASTExpressionStatement expression).
	self <<< ';'
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTJavaAssignementExpression: aFASTJavaAssignementExpression [
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
CSNBehaviorModelExporterAngular >> visitFASTJavaElsePartStatement: aFASTJavaElsePartStatement [
	aFASTJavaElsePartStatement orderedChildren flatCollect: [ :child | self accept: child ]
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
	((aFASTJavaMethodEntity parameters do: [ :parameter | self accept: parameter ] separatedBy: [ self <<< ', ' ]) / self)
		<<< ') {';
		indentPlus;
		crlf.
	aFASTJavaMethodEntity statements
		do: [ :statement | self accept: statement ]
		separatedBy: [ self
				writeErrorIfSome;
				crlf].
	self
		crlf;
		<< '}';
		indentMinus
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
CSNBehaviorModelExporterAngular >> visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression [
	super visitFASTJavaNewClassExpression: aFASTJavaNewClassExpression.
	self
		<<< ' {';
		crlf.
	aFASTJavaNewClassExpression declarations
		do: [ :method | 
			self indent.
			self accept: method.
			self crlf ].
	self
		crlf;
		<<< '}'
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
CSNBehaviorModelExporterAngular >> visitFASTJavaStringLiteral: aFASTJavaStringLiteral [
	self
		<<< '''';
		<<< (aFASTJavaStringLiteral value copyReplaceAll: '''' with: '\''');
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
CSNBehaviorModelExporterAngular >> visitFASTLiteral: aFASTLiteral [
	self <<< aFASTLiteral value
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTNamedEntity: aFASTNamedEntity [
	self <<< aFASTNamedEntity name
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatement: aFASTStatement [
	self indent.
	aFASTStatement orderedChildren flatCollect: [ :child | self accept: child ]
]

{ #category : #generated }
CSNBehaviorModelExporterAngular >> visitFASTStatementBlock: aFASTStatementBlock [
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
CSNBehaviorModelExporterAngular >> visitFASTVariableExpression: aFASTVariableExpression [
	self haltIf: [ aFASTVariableExpression name = 'caught' ].
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
