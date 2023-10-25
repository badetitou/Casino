Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addingPosition [
	<FMProperty: #addingPosition type: #Number>
	^ self
		attributeAt: #addingPosition
		ifAbsent:
			(self source
				ifNil: [ 0 ]
				ifNotNil: [ :widgetSource | 
					widgetSource sourceAnchor
						ifNil: [ 0 ]
						ifNotNil: [ :sourceText | sourceText startPos ] ])
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addingPosition: anObject [
	self attributeAt: #addingPosition put: anObject
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> csnActionsIn: aBuilder [

	<inspectorPresentationOrder: 1003 title: 'Actions'>
	^ aBuilder newTable
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #printString);
		  items: self actions asOrderedCollection
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> csnAttributesIn: aBuilder [

	<inspectorPresentationOrder: 1001 title: 'Attributes'>
	^ aBuilder newTable
		  items: self attributes asOrderedCollection;
		  addColumn: (SpStringTableColumn title: 'Name' evaluated: #name);
		  addColumn: (SpStringTableColumn title: 'Value' evaluated: #attributeValue)
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> csnSourceCodeIn: aBuilder [

	<inspectorPresentationOrder: 1002 title: 'Source code'>
	^ (self sources isNotEmpty and: [ self sources anyOne sourceAnchor isNotNil ])
		  ifTrue: [ 
			  aBuilder newCode
				  text: self sources anyOne sourceAnchor sourceText;
				  beNotEditable;
				  withLineNumbers;
				  withoutSyntaxHighlight ]
		  ifFalse: [ aBuilder newText text: 'Not supported' ]
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> csnSourcesIn: aBuilder [

	<inspectorPresentationOrder: 100 title: 'Sources'>
	^ aBuilder newList
		items: self sources
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> getComponentSelector [
	^ self getAcceptedName
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> isWidget [ 
	^ true
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> miTreeExtension [

	<inspectorPresentationOrder: 15 title: 'CSN Tree'>
	^ SpTreeTablePresenter new
		  addColumn: (SpCompositeTableColumn new
				  " addColumn: ((SpImageTableColumn evaluated: #midasIcon)
						    width: 20;
						    yourself);"
				   addColumn: (SpStringTableColumn evaluated: [ :csnElement | 
						    csnElement name ifNil: [ '?' ] ]);
				   addColumn: ((SpImageTableColumn evaluated: [ :csnElement | 
							     String streamContents: [ :stream | 
									     stream
										     << '(';
										     << csnElement class name;
										     << ')' ] ])
						    width: 20;
						    yourself);
				   yourself);
		  children: [ :aClass | aClass children asOrderedCollection ];
		  beMultipleSelection;
		  roots: { self };
		  beResizable
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> name [
	^ (name ifNil: [ 'widget' ])  , self mooseID asString
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> realClass [
	<FMProperty: #realClass type: #Object>
	^ realClass
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> realClass: aClass [
	realClass := aClass
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> recursiveElements [
	^ (self widgets , (self widgets collect: #recursiveElements))
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> recursiveWidgets [
	^ (self widgets , (self widgets collect: #recursiveWidgets))
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> subWidgets [

	^ self widgets
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> verticalVeryDeepCopy [

	| widgetCopy |
	widgetCopy := self class new.
	self mooseModel ifNotNil: [ :model | model add: widgetCopy ].
	self attributes do: [ :attribute | 
		| attributeCopy |
		attributeCopy := attribute class new.
		attribute mooseModel ifNotNil: [ :model | model add: attributeCopy ].
		attributeCopy attributeValue: attribute attributeValue.
		widgetCopy addAttribute: attributeCopy ].
	self widgets do: [ :widget | 
		widgetCopy addWidget: widget verticalVeryDeepCopy ].
	widgetCopy sources: self sources copy.
	widgetCopy affectedActions: self affectedActions.
	widgetCopy realClass: self realClass.
	widgetCopy name: self realName.
	^ widgetCopy
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> widgets [
	^ { } asOrderedCollection 
]
