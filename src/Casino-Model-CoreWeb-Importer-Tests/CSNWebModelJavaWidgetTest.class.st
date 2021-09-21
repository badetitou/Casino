Class {
	#name : #CSNWebModelJavaWidgetTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> createGWTNamespace [
	| com google gwt user client ui |
	com := FamixJavaPackage new
		name: #com;
		yourself.
	google := FamixJavaPackage new
		name: #google;
		parentPackage: com.
	gwt := FamixJavaPackage new
		name: #gwt;
		parentPackage: google.
	user := FamixJavaPackage new
		name: #user;
		parentPackage: gwt.
	client := FamixJavaPackage new
		name: #client;
		parentPackage: user.
	ui := FamixJavaPackage new
		name: #ui;
		parentPackage: client.
	uiImporter sourceModel
		silentlyAddAll:
			{com.
			google.
			gwt.
			user.
			client.
			ui}.
	^ ui
]

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> createWidgetNamespaces [
	| fr bl client core refui sedit refui2 |
	fr := FamixJavaPackage new
		name: #fr;
		yourself.
	bl := FamixJavaPackage new
		name: #bl;
		parentPackage: fr.
	client := FamixJavaPackage new
		name: #client;
		parentPackage: bl.
	core := FamixJavaPackage new
		name: #core;
		parentPackage: client.
	refui := FamixJavaPackage new
		name: #refui;
		parentPackage: core.
	sedit := FamixJavaPackage new
		name: #sedit;
		parentPackage: client.
	refui2 := FamixJavaPackage new
		name: #refui;
		parentPackage: sedit.
	uiImporter sourceModel
		silentlyAddAll:
			{fr.
			bl.
			client.
			core.
			refui.
			sedit.
			refui2}.
	^ {refui.
	refui2}
]

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> inheritanceWithSuperclass: aFAMIXClass andSubclass: aFAMIXClass2 [
	uiImporter sourceModel
		add:
			(FamixJavaInheritance new
				superclass: aFAMIXClass;
				subclass: aFAMIXClass2;
				yourself)
]

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> setUp [
	| refuiCol gwtNamespace abstractWidget gwtWidget coreWidget seditWidget anOutscopeWidgetSubclass anInscopeNotWidgetSubclass |
	super setUp.
	refuiCol := self createWidgetNamespaces.
	gwtNamespace := self createGWTNamespace.
	abstractWidget := FamixJavaClass new
		name: #Widget;
		yourself.
	gwtWidget := FamixJavaClass new
		name: #GWTWidget;
		yourself.
	coreWidget := FamixJavaClass new
		name: #CoreWidget;
		yourself.
	seditWidget := FamixJavaClass new
		name: #SeditWidget;
		yourself.
	anOutscopeWidgetSubclass := FamixJavaClass new
		name: #OutscopeWidgetSubclass;
		yourself.
	anInscopeNotWidgetSubclass := FamixJavaClass new
		name: #InscopeNotWidgetSubclass;
		yourself.
	gwtNamespace addType: gwtWidget.
	gwtNamespace addType: anInscopeNotWidgetSubclass.
	refuiCol first addType: coreWidget.
	refuiCol second addType: seditWidget.
	self inheritanceWithSuperclass: abstractWidget andSubclass: gwtWidget.
	self
		inheritanceWithSuperclass: abstractWidget
		andSubclass: coreWidget.
	self
		inheritanceWithSuperclass: abstractWidget
		andSubclass: seditWidget.
	self
		inheritanceWithSuperclass: abstractWidget
		andSubclass: anOutscopeWidgetSubclass.
	uiImporter sourceModel
		silentlyAddAll:
			{abstractWidget.
			gwtWidget.
			coreWidget.
			seditWidget.
			anOutscopeWidgetSubclass.
			anInscopeNotWidgetSubclass}
]

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> testModelWidget [
	self assert: uiImporter modelWidget size equals: 3
]
