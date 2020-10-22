Class {
	#name : #CSNWebModelJavaWidgetTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #setUp }
CSNWebModelJavaWidgetTest >> createGWTNamespace [
	| com google gwt user client ui |
	com := FAMIXNamespace new
		name: #com;
		yourself.
	google := FAMIXNamespace new
		name: #google;
		parentScope: com.
	gwt := FAMIXNamespace new
		name: #gwt;
		parentScope: google.
	user := FAMIXNamespace new
		name: #user;
		parentScope: gwt.
	client := FAMIXNamespace new
		name: #client;
		parentScope: user.
	ui := FAMIXNamespace new
		name: #ui;
		parentScope: client.
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
	fr := FAMIXNamespace new
		name: #fr;
		yourself.
	bl := FAMIXNamespace new
		name: #bl;
		parentScope: fr.
	client := FAMIXNamespace new
		name: #client;
		parentScope: bl.
	core := FAMIXNamespace new
		name: #core;
		parentScope: client.
	refui := FAMIXNamespace new
		name: #refui;
		parentScope: core.
	sedit := FAMIXNamespace new
		name: #sedit;
		parentScope: client.
	refui2 := FAMIXNamespace new
		name: #refui;
		parentScope: sedit.
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
			(FAMIXInheritance new
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
	abstractWidget := FAMIXClass new
		name: #Widget;
		yourself.
	gwtWidget := FAMIXClass new
		name: #GWTWidget;
		yourself.
	coreWidget := FAMIXClass new
		name: #CoreWidget;
		yourself.
	seditWidget := FAMIXClass new
		name: #SeditWidget;
		yourself.
	anOutscopeWidgetSubclass := FAMIXClass new
		name: #OutscopeWidgetSubclass;
		yourself.
	anInscopeNotWidgetSubclass := FAMIXClass new
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
