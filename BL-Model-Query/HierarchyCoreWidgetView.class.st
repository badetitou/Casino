Class {
	#name : #HierarchyCoreWidgetView,
	#superclass : #WidgetAnalysisView,
	#category : #'BL-Model-Query-Fireworks'
}

{ #category : #'view creation' }
HierarchyCoreWidgetView >> openView [
	^ self viewDependancyHeritCoreAndDepth: 9
]

{ #category : #'view creation' }
HierarchyCoreWidgetView >> viewDependancyHeritCoreAndDepth: theDepth [
	| view nodes |
	nodes := self modelWidget asSet reject: #isAnonymousClass.
	1 to: theDepth do: [ :val | nodes addAll: (nodes collect: #superclass thenSelect: #isNotNil) ].
	view := RTMondrian new.
	view shape rectangle
		color: [ :cl | 
			(self isClassFromGWT: cl)
				ifTrue: [ Color blue ]
				ifFalse: [ Color green ] ];
		height: [ :cl | cl methods size ];
		width: [ :cl | (cl methods select: #isOverriding) size ].
	view nodes: {nodes} flatten asSet.
	(view shape line arrowedLine headOffset: 1.0) shape head
		baseSize: 5.0;
		size: 8.
	view edgesFrom: #superclass.
	view treeLayout
		verticalGap: 10;
		horizontalGap: 10.
	^ view
]
