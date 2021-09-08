"
The coreweb2 configuration uses a mix of re-created component, html component, and material component.
"
Class {
	#name : #CSNExporterAngularCoreWeb2Configuration,
	#superclass : #CSNExporterAngularConfiguration,
	#category : #'Casino-Model-CoreWeb-Exporter-CoreWeb'
}

{ #category : #initialization }
CSNExporterAngularCoreWeb2Configuration >> defaultConfiguration [
	^ super defaultConfiguration
		addAll:
			{(CSNUIButton -> CSNELCWBLButtonLinkComponent new).
			(CSNUICWAutoComplete -> CSNELCWBLQuickSearch new).
			"(CSNUICWChart -> PNGChart new)."
			"(CSNUICWDialog -> PNGDialog new)."
			(CSNUICWFileUploadPanel -> CSNELCWBLInputFilePanel new).
			(CSNUICWLinkSimple -> CSNELCWBLLinkSimple new).
			(CSNUICWListAndDetails -> CSNELCWBLListAndDetailsComponent new).
			(CSNUICWProgressBar -> MCProgressBar new).
			(CSNUICWRechercheEtListe -> CSNELCWBLRechercheEtListeComponent new).
			"(CSNUICWSplitButton -> PNGSplitButton new)."
			(CSNUIFieldset -> CSNELCWBLFieldsetComponent new).
			(CSNUIInput -> CSNELCWBLInputComponent new).
			"(CSNUICWRichTextArea -> PNGEditor new)."
			(CSNUICWSwitch -> MCSlideToggle new).
			(CSNUIInputCheckbox -> CSNELCWBLCheckboxComponent new).
			(CSNUIInputColor -> MCInput new).
			(CSNUIInputDate -> CSNELCWBLInputComponent new).
			(CSNUIInputDatetimeLocal -> MCInput new).
			(CSNUIInputFile -> CSNELCWBLInputFile new).
			(CSNUIInputMonth -> MCInput new).
			(CSNUIInputNumber -> MCInput new).
			(CSNUIInputRadio -> CSNELCWBLRadioComponent new).
			(CSNUIInputRange -> MCSlider new).
			(CSNUIInputTime -> MCInput new).
			(CSNUIInputUrl -> MCInput new).
			(CSNUIInputWeek -> MCInput new).
			(CSNUISelect -> CSNELCWBLInputSelectComponent new).
			(CSNUILink -> CSNELCWBLSimpleLinkComponent new).
			(CSNUITab -> MCTab new).
			(CSNUITabManager -> MCTabGroup new).
			(CSNUITable -> CSNELCWBLTable new).
			(CSNUIImage -> HTMLImgComponent new).
			(CSNUIParagraph -> HTMLParagraphComponent new)} asDictionary;
		yourself
]
