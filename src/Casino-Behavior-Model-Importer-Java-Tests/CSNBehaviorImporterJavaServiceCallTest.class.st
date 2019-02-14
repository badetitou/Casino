Class {
	#name : #CSNBehaviorImporterJavaServiceCallTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#instVars : [
		'uiModel'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #testing }
CSNBehaviorImporterJavaServiceCallTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #CSNBehaviorImporterJavaServiceCallTest
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> createUiModel [
	 self subclassResponsibility
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> modelMse [
	^  ReadStream on: '(
	(FAST-Core-Model.ExpressionStatement (id: 1)
		(parentNode (ref: 2)))
	(FAST-Core-Model.JavaMethodInvocation (id: 3)
		(name ''generateError'')
		(parentNode (ref: 4))
		(receiver (ref: 5)))
	(FAST-Core-Model.StatementBlock (id: 2)
		(parentNode (ref: 6)))
	(FAST-Core-Model.JavaMethodEntity (id: 7)
		(name ''generateErrorDeeperInStack'')
		(ui (ref: 8)))
	(FAST-Core-Model.StatementBlock (id: 9)
		(parentNode (ref: 10)))
	(FAST-Core-Model.JavaClassProperty (id: 11)
		(fieldName ''Util'')
		(parentNode (ref: 12))
		(type (ref: 13)))
	(FAST-Core-Model.StatementBlock (id: 14)
		(parentNode (ref: 7)))
	(FAST-Core-Model.JavaMethodInvocation (id: 15)
		(name ''generateErrorDeeperInStack'')
		(parentNode (ref: 16))
		(receiver (ref: 17)))
	(FAST-Core-Model.JavaMethodEntity (id: 18)
		(name ''generateError'')
		(ui (ref: 8)))
	(FAST-Core-Model.JavaIdentifier (id: 5)
		(name ''this'')
		(parentNode (ref: 3)))
	(FAST-Core-Model.NamedEntity (id: 19)
		(name ''result'')
		(parentNode (ref: 10)))
	(FAST-Core-Model.JavaMethodInvocation (id: 20)
		(name ''displayWarningFixed'')
		(parentNode (ref: 1))
		(receiver (ref: 21)))
	(FAST-Core-Model.JavaMethodInvocation (id: 12)
		(name ''getInstance'')
		(parentNode (ref: 22))
		(receiver (ref: 11)))
	(FAST-Core-Model.JavaNewClassExpression (id: 23)
		(name ''SecureAsyncCallback'')
		(parentNode (ref: 22)))
	(FAST-Core-Model.ExpressionStatement (id: 24)
		(parentNode (ref: 14)))
	(FAST-Core-Model.JavaStringLiteral (id: 25)
		(parentNode (ref: 20))
		(value ''Erreur générée. Vous pourrez la voir dans les logs sous forme déobfusquée. (En mode développement, ce test n''''a pas de sens.)''))
	(FAST-Core-Model.JavaMethodInvocation (id: 26)
		(name ''onFailure'')
		(parentNode (ref: 27)))
	(FAST-Core-Model.ExpressionStatement (id: 27)
		(parentNode (ref: 2)))
	(FAST-Core-Model.NamedEntity (id: 28)
		(name ''caught'')
		(parentNode (ref: 6)))
	(FAST-Core-Model.StatementBlock (id: 29)
		(parentNode (ref: 18)))
	(FAST-Core-Model.JavaMethodInvocation (id: 22)
		(name ''generateError'')
		(parentNode (ref: 24))
		(receiver (ref: 12)))
	(FAST-Core-Model.NamedEntity (id: 30)
		(name ''event'')
		(parentNode (ref: 31)))
	(FAST-Core-Model.NamedEntity (id: 32)
		(name ''caught'')
		(parentNode (ref: 26)))
	(FAST-Core-Model.JavaMethodEntity (id: 31)
		(name ''onClick'')
		(ui (ref: 8)))
	(FAST-Core-Model.ExpressionStatement (id: 4)
		(parentNode (ref: 33)))
	(FAST-Core-Model.JavaMethodEntity (id: 10)
		(name ''onSuccess'')
		(parentNode (ref: 34)))
	(FAST-Core-Model.StatementBlock (id: 33)
		(parentNode (ref: 31)))
	(FAST-Core-Model.JavaMethodEntity (id: 6)
		(name ''onFailure'')
		(parentNode (ref: 35)))
	(FAST-Core-Model.ExpressionStatement (id: 16)
		(parentNode (ref: 29)))
	(FAST-Core-Model.JavaIdentifier (id: 21)
		(name ''BLEventPopup'')
		(parentNode (ref: 20)))
	(FAST-Core-Model.JavaIdentifier (id: 17)
		(name ''this'')
		(parentNode (ref: 15)))
	(FAST-Core-Model.NamedEntity (id: 13)
		(name ''IGwtServiceIncubator'')
		(parentNode (ref: 11))))'
]

{ #category : #running }
CSNBehaviorImporterJavaServiceCallTest >> setUp [
	super setUp.
	model importFromMSEStream: self modelMse.
	self createUiModel.
	(CSNBehaviorPatternServiceCall on: model fromUiModel: uiModel) run.
]
