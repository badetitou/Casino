Class {
	#name : #CSNUICoreWebGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'chart',
		'clickHandler',
		'coreCellWidth',
		'coreHorizontalAlignement',
		'coreRowSpan',
		'coreVerticalAlignement',
		'dialog',
		'dynamicFieldset',
		'groupFieldset',
		'html',
		'autoComplete',
		'richTextArea',
		'splitButton',
		'switch',
		'lightFieldset',
		'open',
		'progressBar',
		'csnContainer',
		'csnAction',
		'csnAttribute',
		'coreColSpan',
		'uiInput',
		'csnVariableAttribute'
	],
	#category : #'Casino-Model-CoreWeb-Generator'
}

{ #category : #accessing }
CSNUICoreWebGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
CSNUICoreWebGenerator class >> packageName [

	^ 'Casino-Model-CoreWeb'
]

{ #category : #accessing }
CSNUICoreWebGenerator class >> prefix [

	^ 'CSNUICW'
]

{ #category : #accessing }
CSNUICoreWebGenerator class >> submetamodels [
	^ { CSNMetamodelGenerator . CSNUISubEntitiesGenerator }
]

{ #category : #definition }
CSNUICoreWebGenerator >> defineClasses [
	super defineClasses.
	chart := builder newClassNamed: #Chart.
	clickHandler := builder newClassNamed: #ClickHandler.
	coreCellWidth := builder newClassNamed: #CoreCellWidth.
	coreColSpan := builder newClassNamed: #CoreColSpan.
	coreHorizontalAlignement := builder newClassNamed: #CoreHorizontalAlignement.
	coreRowSpan := builder newClassNamed: #CoreRowSpan.
	coreVerticalAlignement := builder newClassNamed: #CoreVerticalAlignement.
	dialog := builder newClassNamed: #Dialog.
	dynamicFieldset := builder newClassNamed: #DynamicFieldset.
	groupFieldset := builder newClassNamed: #GroupFieldset.
	html := builder newClassNamed: #HTML.
	autoComplete := builder newClassNamed: #AutoComplete.
	richTextArea := builder newClassNamed: #RichTextArea.
	splitButton := builder newClassNamed: #SplitButton.
	switch := builder newClassNamed: #Switch.
	lightFieldset := builder newClassNamed: #LightFieldset.
	open := builder newClassNamed: #Open.
	progressBar := builder newClassNamed: #ProgressBar.
	
	csnContainer := self remoteEntity: #Container withPrefix: #CSN.
	csnAction := self remoteEntity: #Action withPrefix: #CSN.
	csnAttribute := self remoteEntity: #Attribute withPrefix: #CSN.
	csnVariableAttribute := self remoteEntity: #VariableAttribute withPrefix: #CSN.
	
	uiInput := self remoteEntity: #Input withPrefix: #CSNUI.
]

{ #category : #definition }
CSNUICoreWebGenerator >> defineHierarchy [
	super defineHierarchy.
	chart --|> csnContainer.
	dialog --|> csnContainer.
	html --|> csnContainer.
	progressBar --|> csnContainer.

	autoComplete --|> uiInput.
	richTextArea --|> uiInput.
	splitButton --|> uiInput.
	switch --|> uiInput.


	dynamicFieldset --|> csnAttribute.
	groupFieldset --|> csnAttribute.
	clickHandler --|> csnAction.
	coreCellWidth --|> csnAttribute.
	coreColSpan --|> csnAttribute.
	coreHorizontalAlignement --|> csnAttribute.
	coreRowSpan --|> csnAttribute.
	coreVerticalAlignement --|> csnAttribute.
	lightFieldset --|> csnAttribute.

	open --|> csnAttribute
]
