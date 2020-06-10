"
aWidget can not be present as a child of itself
"
Class {
	#name : #CSNAddWidgetTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Importer-Tests'
}

{ #category : #tests }
CSNAddWidgetTest >> testContainerAddAnotherContainerAndAddItself [
	| container container2 model |
	model := CSNUIModel new.
	container := CSNContainer new.
	container2 := CSNContainer new.
	model addAll: {container . container2}.
	container addWidget: container2.
	container2 addWidget: container.
	self assert: container2 children isEmpty.
	self assert: container parentNode isNil.
	self assert: container2 parentNode equals: container.
	self assert: (container children includes: container2)
]

{ #category : #tests }
CSNAddWidgetTest >> testContainerAddItself [
	| container model |
	model := CSNUIModel new.
	container := CSNContainer new.
	model add: container.
	container addWidget: container.
	self assert: container children isEmpty.
	self assert: container parentNode isNil
]

{ #category : #tests }
CSNAddWidgetTest >> testLayoutAddPanelThatIsAlreadyAParent [
	| panel layout model |
	model := CSNUIModel new.
	panel := CSNUIPanel new.
	layout := CSNLLayout new.
	model addAll: {panel . layout}.
	panel layout: layout.
	layout addWidget: panel.
	self assert: panel children anyOne children isEmpty.
	self assert: panel parentNode isNil
]

{ #category : #tests }
CSNAddWidgetTest >> testPanelAddPanel [
	| panel model |
	model := CSNUIModel new.
	panel := CSNUIPanel new.
	model add: panel.
	panel addWidget: panel.
	self assert: panel children isEmpty.
	self assert: panel parentNode isNil
]

{ #category : #tests }
CSNAddWidgetTest >> testPanelLayoutAddPanel [
	| panel layout model |
	model := CSNUIModel new.
	panel := CSNUIPanel new.
	layout := CSNLLayout new.
	model addAll: {panel . layout}.
	panel layout: layout.
	panel addWidget: panel.
	self assert: panel children anyOne children isEmpty.
	self assert: panel parentNode isNil
]
