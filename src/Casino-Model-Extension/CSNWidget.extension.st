Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addAction: anBLAction [
	^ self actions add: anBLAction
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addAttribute: attribute [
	^ self attributes add: attribute
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addingPosition [
	<MSEProperty: #addingPosition type: #Number>
	^ self privateState
		attributeAt: #addingPosition
		ifAbsent: ((self source) ifNil: [ 0 ] ifNotNil: [ :widgetSource | widgetSource sourceAnchor ifNil: [ 0 ] ifNotNil: [ :sourceText | sourceText startPos ] ] )
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> addingPosition: anObject [
	self privateState attributeAt: #addingPosition put: anObject
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
		when: [ :anObject | (anObject mooseInterestingEntity isKindOf: CSNWidget) or: [ anObject mooseInterestingEntity isKindOf: CSNLLayout ] ].
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
CSNWidget >> parameters [
	<MSEProperty: #parameters type: #Object>
	^ self privateState attributeAt: #parameters ifAbsentPut: [ Dictionary new ]
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> parametersAt: aParameterName [
	^ self parameters at: aParameterName
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> parametersAt: aParameterName put: anObject [
	^ self parameters at: aParameterName put: anObject
]

{ #category : #'*Casino-Model-Extension' }
CSNWidget >> realClass [
	<MSEProperty: #realClass type: #Object>
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
