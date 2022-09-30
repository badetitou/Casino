Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> actionsTagFrom: anExporter [
	^ self actions flatCollect: [ :action | ' ' , (anExporter angularActionRepresentationOf: action) ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> angularComponent [
	^ WidgetRepresentation new
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> attributesTagWith: anExporter [
	^ (self computeSelfAttributes flattened groupedBy: #name) asDictionary
		associationsDo: [ :mapAttributeNameValues | 
			anExporter
				<<< ' ';
				<<< mapAttributeNameValues key;
				<<< '="'.
			mapAttributeNameValues value asOrderedCollection do: [ :attribute | anExporter visit: attribute ] separatedBy: [ anExporter <<< ' ' ].
			anExporter <<< '"' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> collectPhaseCalled [
	^ (self recursiveWidgets flattened
		flatCollect: [ :localWidget | 
			(localWidget actions
				select: #isActionAppel
				thenCollect: #call) select: #isNotNil ]) asSet asOrderedCollection sort: #name ascending 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> componentSubWidgetsUsing: anExporter [

	"I returned sub widgets in the sub component (for instance, not going inside dialog definition)"

	| widgs |
	widgs := self widgets reject: [ :w | 
		           (anExporter angularRepresentationOf: w) isSubComponent ].

	^ { 
		  widgs.
		  (widgs collect: [ :w | w componentSubWidgetsUsing: anExporter ]) }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> computeSelfAttributes [

	^ { 
		  self attributes.
		  self getPositionAttribute.
		  self generateDefaultClassAttribute.
		  self containedElementAttribute } flattened asOrderedCollection
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> containedElementAttribute [

	^ self container
		  ifNil: [ {  } ]
		  ifNotNil: [ :a | a hierarchalAttributes ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> container [
	^ self cellOwner ifNil: [ self widgetContainer ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> csnInAngular: aBuilder [

	<inspectorPresentationOrder: 1008 title: 'Angular HTML'>
	| config code attributeExporter presenter |
	config := CSNExporterAngularConfiguration.
	attributeExporter := CSNExporterAngularAttribute.
	code := aBuilder newCode
		        beNotEditable;
		        withLineNumbers;
		        withoutSyntaxHighlight.
	^ (self isKindOf: CSNPage) not
		  ifTrue: [ 
			  presenter := SpPresenter new.
			  presenter layout: (SpBoxLayout newTopToBottom
					   add: (aBuilder newDropList
							    extent: 800 @ 25;
							    items: CSNExporterAngularConfiguration withAllSubclasses;
							    display: [ :aClass | aClass name ];
							    whenSelectedItemChangedDo: [ :aClass | 
								    config := aClass.
								    code text: (String streamContents: [ :s | 
												     | exporter |
												     exporter := (CSNModelExporterAngular on: s)
													                 currentPage: (self atAnyScope: { 
																	                  CSNPage.
																	                  CSNBusinessPage }) anyOne;
													                 attributeExporter: attributeExporter new;
													                 exporterAngularConfiguration: config new.
												     (self isKindOf: CSNBusinessPage)
													     ifFalse: [ self accept: exporter ]
													     ifTrue: [ 
													     exporter generateHTMLSourceCodeForBusinessPage: self ] ]) ];
							    selectIndex: 1;
							    yourself)
					   expand: false;
					   add: code;
					   yourself).
			  presenter ]
		  ifFalse: [ aBuilder newText text: 'Not supported' ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> exportAttribute: normalyOneOfMyWidget with: anExporter [
	(anExporter angularRepresentationOf: self) exportAttribute: normalyOneOfMyWidget with: anExporter
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> generateDefaultClassAttribute [
	"Use me to add a Attribute to all the widget during the exportation
	ex: Adding a class to all the dom with the name of the widget"
	^ {  }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getAcceptedName [
	^ self id
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getExternalDependenciesFrom: anExporter [

	^ { 
		  (self getExternalDependencyFrom: anExporter).
		  ((self getExternalDependencyFrom: anExporter) collect: [ :representation | representation internalDependenciesOf: self ]) } flattened
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getExternalDependencyFrom: anExporter [
	^ { anExporter angularRepresentationOf: self }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getHTMLName [
	^ self id  , '.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getImportStringFromLocalPath [

	^  self getAcceptedName
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getImportStringWithLocalPath: aLocalPath [

	^ 'import { ' , self componentName , ' } from ''' , aLocalPath, '/'
	  , self getImportStringFromLocalPath , '/' , self getAcceptedName
	  , '.component'';'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getListPropertiesAsStringWith: anExporter [
	anExporter <<< (self getSelectorFrom: anExporter).
	(anExporter angularRepresentationOf: self) componentAttributeOn: anExporter forWidget: self.
	anExporter <<< (self actionsTagFrom: anExporter).
	anExporter <<< self idTag
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getPositionAttribute [
	^ self position
		ifNotNil: [ CSNUIStyle new
				name: 'style';
				styleAttribute: 'text-align';
				attributeValue: self position angularValue;
				yourself ]
		ifNil: [ {} ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getSelectorFrom: anExporter [
	^ (anExporter angularRepresentationOf: self) getSelector
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> getTSName [
	^ self id  , '.component.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> gtInAngular: composite [
	<gtInspectorPresentationOrder: 1005>
	composite text
		title: 'Angular HTML';
		display: [ String streamContents: [ :s | (CSNModelExporterAngular on: s) visit: self ] ];
		withLineNumbers: true;
		when: [ self isPageMetier not and: [ (self isKindOf: CSNPage) not ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> hierarchalAttributes [ 
	^ {  }
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> id [
	| dic |
	dic := self rootNode
		cacheAt: #widgetUniqueName
		ifAbsentPut: [ {(self -> self realName)} asDictionary ].
	^ dic
		at: self
		ifAbsentPut: [ | index potentialName |
			index := 0.
			potentialName := self realName.
			[ dic includes: potentialName ]
				whileTrue: [ potentialName := (potentialName removeSuffix: index asString)
						, (index + 1) asString.
					index := index + 1 ].
			potentialName ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> idTag [

	^ (self variable isNil or: [ self variable isNotFound ])
		  ifTrue: [ '' ]
		  ifFalse: [ ' #' , self id ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> idViewChildFrom: anExporter [
	^ (self variable isNil or: [ self variable isInvocation ])
		  ifTrue: [ '' ]
		  ifFalse: [ 
			  '    @ViewChild(''' , self id , ''', { static: false}) ' , self id , ': '
			  , (anExporter angularRepresentationOf: self) moduleName , ';' , String crlf ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> isPageMetier [
	^ false
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> printImportStringForSubComponentsFrom: aLocalPath using: anExporter [

	(anExporter angularRepresentationOf: self) isSubComponent
		ifTrue: [ 
			anExporter
				<< (self getImportStringWithLocalPath: aLocalPath);
				crlf.
			self subWidgets do: [ :widget | 
				widget
					printImportStringForSubComponentsFrom:
					aLocalPath , '/' , self getImportStringFromLocalPath
					using: anExporter ] ]
		ifFalse: [ 
			self subWidgets do: [ :widget | 
				widget
					printImportStringForSubComponentsFrom: aLocalPath
					using: anExporter ] ]
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNWidget >> widgetsDependenciesFrom: anExporter [

	^ (((self recursiveWidgets , { self }) flattened collect: [ :el | 
		    el getExternalDependenciesFrom: anExporter ]) flattened asSet
		   asOrderedCollection
		   collect: [ :dependency | dependency importString ]
		   as: Set) asOrderedCollection
]
