Class {
	#name : #CSNBehaviorPatternDOMElementAccess,
	#superclass : #CSNBehaviorPattern,
	#instVars : [
		'reverseDic'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> newDOMAccessTo: aWidget [
	^ self model add: (CSNBDOMElementAcccess new
			   widget: aWidget;
			   yourself)
]

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> run [
	reverseDic := (CSNMultiValueDictionary newFrom:
			               ((self uiModel allWithSubTypesOf: CSNWidget) 
				                collect: [ :w | w affectedActions -> w ]))
		              removeKey: nil ifAbsent: [  ];
		              yourself.
	(self model allWithSubTypesOf: FASTJavaIdentifier) do: [ :identifier | 
		reverseDic at: identifier famixVariable ifPresent: [ :widgets | 
			| parent domAccess selector |
			self haltIf: [ widgets size > 1 ].
			selector := identifier currentParentSelector, ':'.
			identifier metamodel.
			domAccess := self newDOMAccessTo: widgets first.
			domAccess perform: selector withArguments: { identifier parentNode }
			  ] ]
]
