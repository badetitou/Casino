"
This class contains tests
"
Class {
	#name : #CSNBehaviorImporterJavaDOMElementAccessTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#instVars : [
		'famixModel',
		'method',
		'uiModel'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaDOMElementAccessTest >> famixModelString [
	"package hello;

public class Hello {
   private void _testDialogBox() {		
		
		final BLLinkLabel _llTestModalDialog = new BLLinkLabel(""Boite de dialogue modale"");
		_llTestModalDialog.addClickHandler(new ClickHandler(){
			@Override
			public void onClick(ClickEvent event) {
				IBLDialogBox db = new BLDialogBox(_llTestModalDialog.getText(), true);				
				db.show();
			}
		});
	}

}"
	^ '(
	(Famix-Java-Entities.Inheritance (id: 1)
		(subclass (ref: 15))
		(superclass (ref: 16)))
	(Famix-Java-Entities.Method (id: 2)
		(name ''_testDialogBox'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 43))
		(numberOfStatements 2)
		(parentType (ref: 15))
		(signature ''_testDialogBox()'')
		(visibility ''private''))
	(Famix-Java-Entities.Class (id: 3)
		(name ''_Anonymous(ClickHandler)'')
		(typeContainer (ref: 2))
		(visibility ''package''))
	(Famix-Java-Entities.IndexedFileAnchor (id: 4)
		(element (ref: 29))
		(endPos 272)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 257))
	(Famix-Java-Entities.IndexedFileAnchor (id: 5)
		(element (ref: 3))
		(endPos 378)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 219))
	(Famix-Java-Entities.Method (id: 6)
		(name ''BLDialogBox'')
		(isStub true)
		(kind ''constructor'')
		(parentType (ref: 41))
		(signature ''BLDialogBox()'')
		(visibility ''public''))
	(Famix-Java-Entities.Class (id: 7)
		(name ''BLDialogBox'')
		(isStub true)
		(typeContainer (ref: 14)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 8)
		(element (ref: 40))
		(endPos 379)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 166))
	(Famix-Java-Entities.Class (id: 9)
		(name ''BLLinkLabel'')
		(isStub true)
		(typeContainer (ref: 2)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 10)
		(element (ref: 22))
		(endPos 349)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 299))
	(Famix-Java-Entities.LocalVariable (id: 11)
		(name ''db'')
		(parentBehaviouralEntity (ref: 14)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 12)
		(element (ref: 47))
		(endPos 349)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 299))
	(Famix-Java-Entities.Method (id: 13)
		(name ''_Anonymous(ClickHandler)'')
		(isStub true)
		(kind ''constructor'')
		(parentType (ref: 3))
		(signature ''_Anonymous(ClickHandler)()'')
		(visibility ''package''))
	(Famix-Java-Entities.Method (id: 14)
		(name ''onClick'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 43))
		(numberOfStatements 2)
		(parentType (ref: 3))
		(signature ''onClick()'')
		(visibility ''public''))
	(Famix-Java-Entities.Class (id: 15)
		(name ''Hello'')
		(typeContainer (ref: 24))
		(visibility ''public''))
	(Famix-Java-Entities.Class (id: 16)
		(name ''Object'')
		(isStub true)
		(typeContainer (ref: 36)))
	(Famix-Java-Entities.Type (id: 17)
		(name ''BLLinkLabel'')
		(isStub true)
		(typeContainer (ref: 15)))
	(Famix-Java-Entities.Package (id: 18)
		(name ''<Default Package>'')
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 19)
		(element (ref: 48))
		(endPos 161)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 119))
	(Famix-Java-Entities.Method (id: 20)
		(name ''BLLinkLabel'')
		(isStub true)
		(kind ''constructor'')
		(parentType (ref: 23))
		(signature ''BLLinkLabel(?)'')
		(visibility ''package''))
	(Famix-Java-Entities.Inheritance (id: 21)
		(subclass (ref: 3))
		(superclass (ref: 16)))
	(Famix-Java-Entities.Invocation (id: 22)
		(candidates (ref: 6))
		(sender (ref: 14))
		(signature ''BLDialogBox(_llTestModalDialog.getText(),true)''))
	(Famix-Java-Entities.Class (id: 23)
		(name ''BLLinkLabel'')
		(isStub true)
		(typeContainer (ref: 2)))
	(Famix-Java-Entities.Package (id: 24)
		(name ''hello''))
	(Famix-Java-Entities.IndexedFileAnchor (id: 25)
		(element (ref: 34))
		(endPos 368)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 360))
	(Famix-Java-Entities.IndexedFileAnchor (id: 26)
		(element (ref: 15))
		(endPos 386)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 17))
	(Famix-Java-Entities.Inheritance (id: 27)
		(subclass (ref: 31))
		(superclass (ref: 16)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 28)
		(element (ref: 30))
		(endPos 161)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 98))
	(Famix-Java-Entities.Parameter (id: 29)
		(name ''event'')
		(parentBehaviouralEntity (ref: 14)))
	(Famix-Java-Entities.LocalVariable (id: 30)
		(name ''_llTestModalDialog'')
		(parentBehaviouralEntity (ref: 2)))
	(Famix-Java-Entities.Class (id: 31)
		(name ''<StubMethodContainer>'')
		(isStub true)
		(typeContainer (ref: 18)))
	(Famix-Java-Entities.Invocation (id: 32)
		(candidates (ref: 13))
		(previous (ref: 40))
		(sender (ref: 2))
		(signature ''_Anonymous(ClickHandler)()''))
	(Famix-Java-Entities.IndexedFileAnchor (id: 33)
		(element (ref: 32))
		(endPos 378)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 201))
	(Famix-Java-Entities.Invocation (id: 34)
		(candidates (ref: 46))
		(previous (ref: 39))
		(sender (ref: 14))
		(signature ''show()''))
	(Famix-Java-Entities.IndexedFileAnchor (id: 35)
		(element (ref: 11))
		(endPos 349)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 294))
	(Famix-Java-Entities.Package (id: 36)
		(name ''lang'')
		(isStub true)
		(parentPackage (ref: 49)))
	(Famix-Java-Entities.Type (id: 37)
		(name ''IBLDialogBox'')
		(isStub true)
		(typeContainer (ref: 3)))
	(Famix-Java-Entities.Method (id: 38)
		(name ''addClickHandler'')
		(isStub true)
		(parentType (ref: 31))
		(signature ''addClickHandler(?)'')
		(visibility ''package''))
	(Famix-Java-Entities.Invocation (id: 39)
		(candidates (ref: 45))
		(previous (ref: 22))
		(sender (ref: 14))
		(signature ''getText()''))
	(Famix-Java-Entities.Invocation (id: 40)
		(candidates (ref: 38))
		(previous (ref: 48))
		(sender (ref: 2))
		(signature ''addClickHandler(new ClickHandler(){
  @Override public void onClick(  ClickEvent event){
    IBLDialogBox db=new BLDialogBox(_llTestModalDialog.getText(),true);
    db.show();
  }
}
)''))
	(Famix-Java-Entities.Class (id: 41)
		(name ''BLDialogBox'')
		(isStub true)
		(typeContainer (ref: 14)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 42)
		(element (ref: 44))
		(endPos 161)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 119))
	(Famix-Java-Entities.PrimitiveType (id: 43)
		(name ''void'')
		(isStub true))
	(Famix-Java-Entities.Reference (id: 44)
		(referencer (ref: 2))
		(referredType (ref: 9)))
	(Famix-Java-Entities.Method (id: 45)
		(name ''getText'')
		(isStub true)
		(parentType (ref: 31))
		(signature ''getText()'')
		(visibility ''package''))
	(Famix-Java-Entities.Method (id: 46)
		(name ''show'')
		(isStub true)
		(parentType (ref: 31))
		(signature ''show()'')
		(visibility ''package''))
	(Famix-Java-Entities.Reference (id: 47)
		(previous (ref: 44))
		(referencer (ref: 14))
		(referredType (ref: 7)))
	(Famix-Java-Entities.Invocation (id: 48)
		(candidates (ref: 20))
		(sender (ref: 2))
		(signature ''BLLinkLabel("Boite de dialogue modale")''))
	(Famix-Java-Entities.Package (id: 49)
		(name ''java'')
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 50)
		(element (ref: 2))
		(endPos 383)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 41))
	(Famix-Java-Entities.IndexedFileAnchor (id: 51)
		(element (ref: 14))
		(endPos 374)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 224))
	(Famix-Java-Entities.IndexedFileAnchor (id: 52)
		(element (ref: 39))
		(endPos 342)
		(fileName ''..\tbehavioral\hello\test.java'')
		(startPos 315))
	(Famix-Java-Entities.SourceLanguage (id: 53)))'
]

{ #category : #running }
CSNBehaviorImporterJavaDOMElementAccessTest >> resourcesFileReference [
	| repo filePath |
	filePath := '/home/runner/work/Casino/Casino'.
	repo := filePath asFileReference exists
		ifTrue: [ filePath asFileReference ]
		ifFalse: [ (IceRepository registry
				detect: [ :each | each includesPackageNamed: self class package name ]
				ifNone: [ self error: 'Please add a clone of this project to Iceberg to access to the resources' ]) location ].
	^ repo / 'tests-resources'
]

{ #category : #running }
CSNBehaviorImporterJavaDOMElementAccessTest >> setUp [

	super setUp.
	famixModel := FamixJavaModel new.
	famixModel importFromMSEStream: self famixModelString readStream.
	famixModel name: #famixModel.
	famixModel rootFolder: self resourcesFileReference / 'tbehavioral'.
	method := (famixModel allWithType: FamixJavaMethod) detect: [ :a | 
		          a name = 'onClick' ].
	model := method generateFastAndBind
		         metamodel: CSNBModel metamodel;
		         yourself.
	uiModel := CSNUICWModel new.
	uiModel add: (CSNUICWDialog new
			 affectedActions:
				 ((famixModel allWithType: FamixJavaLocalVariable) detect: [ :a | 
						  a name = 'db' ]);
			 yourself).
	uiModel add: (CSNUILink new
			 affectedActions:
				 ((famixModel allWithType: FamixJavaLocalVariable) detect: [ :a | 
						  a name = '_llTestModalDialog' ]);
			 yourself).
	(CSNBehaviorPatternDOMElementAccess on: model fromUiModel: uiModel)
		run
]

{ #category : #tests }
CSNBehaviorImporterJavaDOMElementAccessTest >> testCorrectAccessedElement [

	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'show' ]) receiver
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = 'db' ]).
	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'show' ])
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = 'db' ]) receiverOwner.
	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'getText' ])
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = '_llTestModalDialog' ])
				receiverOwner.
	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'getText' ]) receiver
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = '_llTestModalDialog' ])
]

{ #category : #tests }
CSNBehaviorImporterJavaDOMElementAccessTest >> testCorrectParentNode [

	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'show' ])
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = 'db' ]) parentNode.
	self
		assert:
			((model allWithType: FASTJavaMethodInvocation) detect: [ :invoc | 
				 invoc name = 'getText' ])
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | 
				 access widget affectedActions name = '_llTestModalDialog' ])
				parentNode
]

{ #category : #tests }
CSNBehaviorImporterJavaDOMElementAccessTest >> testImportDOMElemeentAccessNumber [

	self assert: (model allWithType: CSNBDOMElementAcccess) size equals: 2
]
