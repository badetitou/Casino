Extension { #name : #FamixJavaInvocation }

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> affectation [

	"in the case of
			TreeItemCopie service3 = new TreeItemCopie(new BLLabel(""SRHA - Se ']' expected ->rvice RH - Absences""));
	The BLLabel affectation must not be service3 (it is wrong)
"

	self cacheAt: #affectation ifPresent: [ :value | 
		^ value isNotFound
			  ifTrue: [ nil ]
			  ifFalse: [ value ] ].
	self sender isStub ifFalse: [ 
		self sender name = '<Initializer>'
			ifFalse: [ "Normal method" 
				self sender generateFastIfNotDoneAndBind "self source generateFastAndBind" ]
			ifTrue: [ "method initialize... We must generate and bind the class" 
				(self sender atScope: FamixTClass) anyOne
					generateFastIfNotDoneAndBind ].
		(self fast
			 atAnyScope: { 
					 FASTJavaAssignementExpression.
					 FASTJavaVariableDeclarator }
			 until: [ :node | 
				 self fast ~= node and: [ node isKindOf: FASTJavaNewExpression ] ]) 
			ifNotEmpty: [ :aScopeWithOneElement | 
				^ aScopeWithOneElement anyOne variable famixVariable
					  ifNotNil: [ :variable | 
					  self cacheAt: #affectation put: variable ]
					  ifNil: [ 
						  self cacheAt: #affectation put: CSNNotFound default.
						  nil ] ] ].
	"old way can be executed if new way fail"
	self container ifNotNil: [ 
		self cacheAt: #affectation put: CSNNotFound default.
		^ nil ].
	^ ((self sender localVariables select: [ :el | 
		    el sourceAnchor isNotNil ]) select: [ :localVariable | 
		   localVariable sourceAnchor startPos < self sourceAnchor startPos 
			   and: [ 
			   localVariable sourceAnchor endPos > self sourceAnchor endPos ] ])
		  at: 1
		  ifAbsent: [ 
			  ((self sender accesses select: #isWrite) select: [ :access | 
				   access sourceAnchor startPos < self sourceAnchor startPos and: [ 
					   access sourceAnchor endPos + 5 > self sourceAnchor startPos ] ])
				  ifNotEmpty: [ :accessCollection | 
					  accessCollection anyOneIfOnlyOneElement variable ]
				  ifEmpty: [ 
					  self sender isInstanciationInitializer ifTrue: [ 
						  ((self sender atScope: FamixTClass) anyOneIfOnlyOneElement
							   attributes select: [ :attribute | 
							   attribute sourceAnchor startPos < self sourceAnchor startPos 
								   and: [ 
								   attribute sourceAnchor endPos > self sourceAnchor endPos ] ])
							  at: 1
							  ifAbsent: [ nil ] ] ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> attributeName [
	^ (signature copyFrom: 4 to: ((signature findString: '(') - 1)) asLowercase.
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> isSuperInvocation [
	^ self signature beginsWith: #'super('
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> parameters [
	^ signature extractParameters 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> positionParameterNamed: aString [

	^ self parameters indexOf: aString
]
