Class {
	#name : #CSNUICoreWebGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'chart',
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
		'csnAttribute',
		'coreColSpan',
		'uiInput',
		'csnVariableAttribute',
		'header',
		'labelPosition',
		'listAndDetails',
		'linkSimple',
		'table',
		'multiCombo',
		'rechercheEtListe',
		'fileUploadPanel',
		'extendedLink',
		'uiLink',
		'csnActions'
	],
	#category : #'Casino-Model-CoreWeb-Generator'
}

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
	"components"
	chart := builder newClassNamed: #Chart.
	dialog := builder newClassNamed: #Dialog.
	dynamicFieldset := builder newClassNamed: #DynamicFieldset.
	groupFieldset := builder newClassNamed: #GroupFieldset.
	html := builder newClassNamed: #HTML.
	autoComplete := builder newClassNamed: #AutoComplete.
	richTextArea := builder newClassNamed: #RichTextArea.
	splitButton := builder newClassNamed: #SplitButton.
	switch := builder newClassNamed: #Switch.
	lightFieldset := builder newClassNamed: #LightFieldset.
	progressBar := builder newClassNamed: #ProgressBar.
	listAndDetails := (builder newClassNamed: #ListAndDetails)
		comment: 'Correspond to the BLCore class BLAbstractListeEtDetail';
		yourself.
	linkSimple := builder newClassNamed: #LinkSimple.
	extendedLink := builder newClassNamed: #ExtendedLink.
	multiCombo := builder newClassNamed: #MultiCombo.
	rechercheEtListe := (builder newClassNamed: #RechercheEtListe)
		comment: 'Correspond to the BLCore class BLAbstractRechercheEtListe';
		yourself.
	fileUploadPanel := (builder newClassNamed: #FileUploadPanel)
		comment: 'Correspond to the BLCore class BLFileUploadPanel';
		yourself. 

	"attributes"
	header := builder newClassNamed: #Header.
	labelPosition := builder newClassNamed: #LabelPosition.
	open := builder newClassNamed: #Open.
	coreCellWidth := builder newClassNamed: #CoreCellWidth.
	coreColSpan := builder newClassNamed: #CoreColSpan.
	coreHorizontalAlignement := builder newClassNamed: #CoreHorizontalAlignement.
	coreRowSpan := builder newClassNamed: #CoreRowSpan.
	coreVerticalAlignement := builder newClassNamed: #CoreVerticalAlignement.

	"remotes"
	csnContainer := self remoteEntity: #Container withPrefix: #CSN.
	csnAttribute := self remoteEntity: #Attribute withPrefix: #CSN.
	csnActions := self remoteEntity: #Action withPrefix: #CSN.
	csnVariableAttribute := self remoteEntity: #VariableAttribute withPrefix: #CSN.

	uiInput := self remoteEntity: #Input withPrefix: #CSNUI.
	uiLink := self remoteEntity: #Link withPrefix: #CSNUI
]

{ #category : #definition }
CSNUICoreWebGenerator >> defineHierarchy [
	super defineHierarchy.
	chart --|> csnContainer.
	dialog --|> csnContainer.
	html --|> csnContainer.
	progressBar --|> csnContainer.
	listAndDetails --|> csnContainer.
	linkSimple --|> csnContainer.
	multiCombo --|> csnContainer.
	rechercheEtListe --|> csnContainer.
	fileUploadPanel --|> csnContainer.

	autoComplete --|> csnContainer.
	richTextArea --|> uiInput.
	splitButton --|> csnContainer.
	switch --|> uiInput.
	
	extendedLink --|> uiLink.

	dynamicFieldset --|> csnAttribute.
	groupFieldset --|> csnAttribute.
	coreCellWidth --|> csnAttribute.
	coreColSpan --|> csnAttribute.
	coreHorizontalAlignement --|> csnAttribute.
	coreRowSpan --|> csnAttribute.
	coreVerticalAlignement --|> csnAttribute.
	lightFieldset --|> csnAttribute.
	
	labelPosition --|> csnAttribute.
	header --|> csnAttribute.

	open --|> csnAttribute
]

{ #category : #definition }
CSNUICoreWebGenerator >> defineRelations [

	super defineRelations.
	(extendedLink property: #additionalActions)
	-* (csnActions property: #linkExtended)
]
