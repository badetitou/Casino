"
This class contains tests
"
Class {
	#name : #CSNBehaviorImporterJavaGetAccessAttributeTest,
	#superclass : #CSNBehaviorImporterJavaTest,
	#instVars : [
		'famixModel',
		'method',
		'uiModel'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaGetAccessAttributeTest >> famixModelString [
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
	(Famix-Java-Entities.IndexedFileAnchor (id: 4)
		(element (ref: 29))
		(endPos 378)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 219))
	(Famix-Java-Entities.Reference (id: 7)
		(source (ref: 28))
		(target (ref: 37)))
	(Famix-Java-Entities.Reference (id: 8)
		(previous (ref: 7))
		(source (ref: 9))
		(target (ref: 12)))
	(Famix-Java-Entities.Type (id: 10)
		(name ''IBLDialogBox'')
		(container (ref: 29))
		(isStub true))
	(Famix-Java-Entities.Method (id: 11)
		(name ''getText'')
		(isStub true)
		(signature ''getText()'')
		(parentType (ref: 34)))
	(Famix-Java-Entities.Class (id: 12)
		(name ''BLDialogBox'')
		(container (ref: 9))
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 14)
		(element (ref: 44))
		(endPos 350)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 281))
	(Famix-Java-Entities.Package (id: 16)
		(name ''java'')
		(isStub true))
	(Famix-Java-Entities.Inheritance (id: 17)
		(subclass (ref: 15))
		(superclass (ref: 25)))
	(Famix-Java-Entities.Invocation (id: 18)
		(candidates (ref: 33))
		(previous (ref: 45))
		(sender (ref: 28))
		(signature ''addClickHandler(new ClickHandler(){
  @Override public void onClick(  ClickEvent event){
    IBLDialogBox db=new BLDialogBox(_llTestModalDialog.getText(),true);
    db.show();
  }
}
)'')
		(sourceAnchor (ref: 13)))
	(Famix-Java-Entities.Package (id: 20)
		(name ''lang'')
		(isStub true)
		(parentScope (ref: 16)))
	(Famix-Java-Entities.Class (id: 22)
		(name ''BLLinkLabel'')
		(container (ref: 28))
		(isStub true))
	(Famix-Java-Entities.Method (id: 23)
		(name ''BLLinkLabel'')
		(isStub true)
		(kind ''constructor'')
		(signature ''BLLinkLabel(?)'')
		(parentType (ref: 22)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 26)
		(element (ref: 15))
		(endPos 386)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 17))
	(Famix-Java-Entities.Class (id: 29)
		(name ''_Anonymous(ClickHandler)'')
		(container (ref: 28))
		(sourceAnchor (ref: 4)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 31)
		(element (ref: 6))
		(endPos 342)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 315))
	(Famix-Java-Entities.Class (id: 34)
		(name ''<StubMethodContainer>'')
		(container (ref: 35))
		(isStub true))
	(Famix-Java-Entities.Package (id: 35)
		(name ''<Default Package>'')
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 42)
		(element (ref: 9))
		(endPos 374)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 224))
	(Famix-Java-Entities.Class (id: 43)
		(name ''BLDialogBox'')
		(container (ref: 9))
		(isStub true))
	(Famix-Java-Entities.LocalVariable (id: 44)
		(name ''db'')
		(parentBehaviouralEntity (ref: 9))
		(sourceAnchor (ref: 14)))
	(Famix-Java-Entities.Invocation (id: 45)
		(candidates (ref: 23))
		(sender (ref: 28))
		(signature ''BLLinkLabel("Boite de dialogue modale")'')
		(sourceAnchor (ref: 5)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 48)
		(element (ref: 30))
		(endPos 374)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 224))
	(Famix-Java-Entities.IndexedFileAnchor (id: 1)
		(element (ref: 36))
		(endPos 162)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 80))
	(Famix-Java-Entities.Invocation (id: 2)
		(candidates (ref: 27))
		(sender (ref: 9))
		(signature ''BLDialogBox(_llTestModalDialog.getText(),true)'')
		(sourceAnchor (ref: 46)))
	(Famix-Java-Entities.Method (id: 3)
		(name ''show'')
		(isStub true)
		(signature ''show()'')
		(parentType (ref: 34)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 5)
		(element (ref: 45))
		(endPos 161)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 119))
	(Famix-Java-Entities.Invocation (id: 6)
		(candidates (ref: 11))
		(previous (ref: 2))
		(sender (ref: 9))
		(signature ''getText()'')
		(sourceAnchor (ref: 31)))
	(Famix-Java-Entities.Method (id: 9)
		(name ''onClick'')
		(bodyHash ''5BB7E8C4962094E0501C18F565A1B67C'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 41))
		(modifiers ''public'')
		(numberOfStatements 2)
		(signature ''onClick()'')
		(parentType (ref: 29))
		(sourceAnchor (ref: 42)))
	(Famix-Java-Entities.IndexedFileAnchor (id: 13)
		(element (ref: 18))
		(endPos 379)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 166))
	(Famix-Java-Entities.Class (id: 15)
		(name ''Hello'')
		(container (ref: 32))
		(modifiers ''public'')
		(sourceAnchor (ref: 26)))
	(Famix-Java-Entities.Invocation (id: 19)
		(candidates (ref: 3))
		(previous (ref: 6))
		(sender (ref: 9))
		(signature ''show()'')
		(sourceAnchor (ref: 47)))
	(Famix-Java-Entities.Inheritance (id: 21)
		(subclass (ref: 29))
		(superclass (ref: 25)))
	(Famix-Java-Entities.Inheritance (id: 24)
		(subclass (ref: 34))
		(superclass (ref: 25)))
	(Famix-Java-Entities.Class (id: 25)
		(name ''Object'')
		(container (ref: 20))
		(isStub true))
	(Famix-Java-Entities.Method (id: 27)
		(name ''BLDialogBox'')
		(isStub true)
		(kind ''constructor'')
		(modifiers ''public'')
		(signature ''BLDialogBox()'')
		(parentType (ref: 43)))
	(Famix-Java-Entities.Method (id: 28)
		(name ''_testDialogBox'')
		(bodyHash ''3D1067D94AE17E9A2AB0CEFFF8B179CB'')
		(cyclomaticComplexity 1)
		(declaredType (ref: 41))
		(modifiers ''private'')
		(numberOfStatements 2)
		(signature ''_testDialogBox()'')
		(parentType (ref: 15))
		(sourceAnchor (ref: 40)))
	(Famix-Java-Entities.Parameter (id: 30)
		(name ''event'')
		(parentBehaviouralEntity (ref: 9))
		(sourceAnchor (ref: 48)))
	(Famix-Java-Entities.Package (id: 32)
		(name ''hello''))
	(Famix-Java-Entities.Method (id: 33)
		(name ''addClickHandler'')
		(isStub true)
		(signature ''addClickHandler(?)'')
		(parentType (ref: 34)))
	(Famix-Java-Entities.LocalVariable (id: 36)
		(name ''_llTestModalDialog'')
		(parentBehaviouralEntity (ref: 28))
		(sourceAnchor (ref: 1)))
	(Famix-Java-Entities.Class (id: 37)
		(name ''BLLinkLabel'')
		(container (ref: 28))
		(isStub true))
	(Famix-Java-Entities.Type (id: 38)
		(name ''BLLinkLabel'')
		(container (ref: 15))
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 40)
		(element (ref: 28))
		(endPos 383)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 41))
	(Famix-Java-Entities.PrimitiveType (id: 41)
		(name ''void'')
		(isStub true))
	(Famix-Java-Entities.IndexedFileAnchor (id: 46)
		(element (ref: 2))
		(endPos 349)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 299))
	(Famix-Java-Entities.IndexedFileAnchor (id: 47)
		(element (ref: 19))
		(endPos 368)
		(fileName ''../tbehavioral/hello/test.java'')
		(startPos 360)))'
]

{ #category : #running }
CSNBehaviorImporterJavaGetAccessAttributeTest >> resourcesFileReference [
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
CSNBehaviorImporterJavaGetAccessAttributeTest >> setUp [

	super setUp.
	famixModel := FamixJavaModel new.
	famixModel importFromMSEStream: self famixModelString readStream.
	famixModel name: #famixModel.
	famixModel rootFolder: self resourcesFileReference / 'tbehavioral'.
	method := (famixModel allWithType: FamixJavaMethod)
		          detect: [ :a | a name = 'onClick' ]
		          ifNone: [ self error ].
	model := method generateFastAndBind
		         metamodel: CSNBModel metamodel;
		         yourself.
	uiModel := CSNUICWModel new.
	uiModel add: (CSNUICWDialog new
			 affectedActions: ((famixModel allWithType: FamixJavaLocalVariable)
					  detect: [ :a | a name = 'db' ]
					  ifNone: [ self error ]);
			 yourself).
	uiModel add: (CSNUILink new
			 affectedActions: ((famixModel allWithType: FamixJavaLocalVariable)
					  detect: [ :a | a name = '_llTestModalDialog' ]
					  ifNone: [ self error ]);
			 yourself).
	(CSNBehaviorPatternDOMElementAccess on: model fromUiModel: uiModel) run.
	(CSNBehaviorPatternDOMAccessGetAttribute on: model fromUiModel: uiModel) run
]

{ #category : #tests }
CSNBehaviorImporterJavaGetAccessAttributeTest >> testImportGetElementAttribute [

	self assert: (model allWithType: CSNBGetElementAttribute) size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaGetAccessAttributeTest >> testImportGetElementAttributeChildren [
	"test I have the good children"
	self
		assert: (model allWithType: CSNBGetElementAttribute) anyOne children anyOne
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | access widget affectedActions name = '_llTestModalDialog' ] ifNone: [ self error ]).
	"test my children have me as parent"
	self
		assert: (model allWithType: CSNBGetElementAttribute) anyOne
		equals:
			((model allWithType: CSNBDOMElementAcccess) detect: [ :access | access widget affectedActions name = '_llTestModalDialog' ] ifNone: [ self error ]) parentNode
]

{ #category : #tests }
CSNBehaviorImporterJavaGetAccessAttributeTest >> testImportGetElementAttributeNumberOfChildren [

	self assert: (model allWithType: CSNBGetElementAttribute) anyOne children size equals: 1
]

{ #category : #tests }
CSNBehaviorImporterJavaGetAccessAttributeTest >> testImportGetElementAttributeParentNode [
	"test I have the good parentNode"

	self assert: (model allWithType: CSNBGetElementAttribute) anyOne parentNode equals: (model allWithType: FASTJavaNewExpression) anyOne.
	"Test my parent has me as one of its children"
	self assertCollection: (model allWithType: FASTJavaNewExpression) anyOne children includesAll: (model allWithType: CSNBGetElementAttribute).
	"Test the old child I replaced is removed"	
	self assert: (model allWithType: FASTJavaNewExpression) anyOne arguments size equals: 2
]
