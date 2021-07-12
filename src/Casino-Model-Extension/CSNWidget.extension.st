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
CSNWidget >> gtActionsIn: composite [
	<gtInspectorPresentationOrder: 1001>
	^ composite table
		title: 'Actions';
		display: [ :anObject | anObject mooseInterestingEntity actions ];
		sorted: [ :x :y | x name asString < y name asString ];
		column: 'Names' evaluated: [ :each | each name ];
		when: [ :anObject | anObject mooseInterestingEntity isWidget and: [ anObject actions isNotEmpty ] ]
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> gtAttributesIn: composite [
	<gtInspectorPresentationOrder: 1001>
	^ composite table
		title: 'Attributes';
		display: [ :anObject | anObject mooseInterestingEntity attributes ];
		sorted: [ :x :y | x name asString < y name asString ];
		column: 'Names' evaluated: [ :each | each name ];
		column: 'Attribute Value' evaluated: [ :each :anObject | each attributeValue ];
		when: [ :anObject | (anObject mooseInterestingEntity isWidget) or: [ anObject mooseInterestingEntity isKindOf: CSNLLayout ] ].
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 1002>
	^ composite text
		  title: 'Source Code';
		  display: [ :anObject | 
			  anObject mooseInterestingEntity sources anyOne sourceAnchor
				  sourceText ];
		  when: [ :anObject | 
			  anObject mooseInterestingEntity sources isNotEmpty and: [ 
					  anObject mooseInterestingEntity sources anyOne sourceAnchor
						  isNotNil ] ];
		  withLineNumbers: true
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> gtSourcesIn: composite [
	<gtInspectorPresentationOrder: 1001>
	^ composite list
		title: 'Sources';
		display: [ :anObject | anObject mooseInterestingEntity sources ]
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> isWidget [ 
	^ true
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
CSNWidget >> widgets [
	^ { } asOrderedCollection 
]
