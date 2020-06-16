Class {
	#name : #CSNBehaviorPatternDOMElementAccess,
	#superclass : #CSNBehaviorPattern,
	#instVars : [
		'reverseDic'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> affectedActionsToWidgetsDic [
	^ reverseDic
		ifNil: [ reverseDic := (CSNMultiValueDictionary newFrom: ((self uiModel allWithSubTypesOf: CSNWidget) collect: [ :w | w affectedActions -> w ]))
				removeKey: nil ifAbsent: [  ];
				yourself ]
]

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> newDOMAccessTo: aWidget [
	^ self model add: (CSNBDOMElementAcccess new
			   widget: aWidget;
			   yourself)
]

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> reset [
	reverseDic := nil
]

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> run [
	(self model allWithSubTypesOf: FASTJavaIdentifier)
		do: [ :identifier | 
			self affectedActionsToWidgetsDic
				at: identifier famixVariable
				ifPresent: [ :widgets | 
					| domAccess selector |
					selector := identifier currentParentSelector , ':'.
					domAccess := self newDOMAccessTo: widgets first.
					domAccess
						startPos: identifier startPos;
						endPos: identifier endPos.
					domAccess perform: selector withArguments: {identifier parentNode} ] ]
]

{ #category : #running }
CSNBehaviorPatternDOMElementAccess >> uiModel: anObject [
	super uiModel: anObject.
	self reset
]
