Extension { #name : #FamixJavaInvocation }

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> affectation [

	"in the case of
			TreeItemCopie service3 = new TreeItemCopie(new BLLabel(""SRHA - Se ']' expected ->rvice RH - Absences""));
	The BLLabel affectation must not be service3 (it is wrong)
"

	self container ifNotNil: [ ^ nil ].
	self source hasSourceAnchor ifTrue: [ 
		self source name = '<Initializer>'
			ifFalse: [ "Normal method" self source generateFastIfNotDoneAndBind ]
			ifTrue: [ "method initialize... We must generate and bind the class" (self source atScope: FamixTClass) anyOne generateFastIfNotDoneAndBind ].
		(self fast atAnyScope: { 
				 FASTJavaAssignementExpression.
				 FASTJavaVariableDeclarator }) ifNotEmpty: [ :aScopeWithOneElement | ^ aScopeWithOneElement anyOne variable famixVariable ] ].

	"old way can be executed if new way fail"
	^ ((self source localVariables select: [ :el | el sourceAnchor isNotNil ]) select: [ :localVariable | 
		   localVariable sourceAnchor startPos < self sourceAnchor startPos and: [ localVariable sourceAnchor endPos > self sourceAnchor endPos ] ])
		  at: 1
		  ifAbsent: [ 
			  ((self source accesses select: #isWrite) select: [ :access | 
				   access sourceAnchor startPos < self sourceAnchor startPos and: [ access sourceAnchor endPos + 5 > self sourceAnchor startPos ] ])
				  ifNotEmpty: [ :accessCollection | accessCollection anyOneIfOnlyOneElement variable ]
				  ifEmpty: [ 
					  self source isInstanciationInitializer ifTrue: [ 
						  ((self source atScope: FamixTClass) anyOneIfOnlyOneElement attributes select: [ :attribute | 
							   attribute sourceAnchor startPos < self sourceAnchor startPos and: [ attribute sourceAnchor endPos > self sourceAnchor endPos ] ])
							  at: 1
							  ifAbsent: [ ^ nil ] ] ] ]
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> attributeName [
	^ (signature copyFrom: 4 to: ((signature findString: '(') - 1)) asLowercase.
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> parameters [
	^ signature extractParameters 
]

{ #category : #'*Casino-Model-Importer-Java' }
FamixJavaInvocation >> positionParameterNamed: aString [

	^ self parameters indexOf: aString
]
