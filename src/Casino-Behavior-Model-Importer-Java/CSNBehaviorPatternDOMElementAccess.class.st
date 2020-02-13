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
			| domAccess selector |
			selector := identifier currentParentSelector , ':'.
			domAccess := self newDOMAccessTo: widgets first.
			domAccess
				startPos: identifier startPos;
				endPos: identifier endPos.
			domAccess
				perform: selector
				withArguments: { identifier parentNode } ] ]
]
