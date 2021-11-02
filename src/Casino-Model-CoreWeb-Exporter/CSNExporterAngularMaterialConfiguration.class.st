"
This configuration should only use Material Component
It is more present for demonstration than real usage
"
Class {
	#name : #CSNExporterAngularMaterialConfiguration,
	#superclass : #CSNExporterAngularConfiguration,
	#category : #'Casino-Model-CoreWeb-Exporter-BLMaterial'
}

{ #category : #initialization }
CSNExporterAngularMaterialConfiguration >> defaultConfiguration [

	^ super defaultConfiguration
		  addAll: { 
				  (CSNUIButton -> MCButton new).
				  (CSNUICWAutoComplete -> MCAutocomplete new).
				  (CSNUICWLinkSimple -> MCButton new).
				  (CSNUIFieldset -> MCCard new).
				  (CSNUIInput -> MCInput new).
				  (CSNUICWSwitch -> MCSlideToggle new).
				  (CSNUIInputCheckbox -> MCCheckbox new).
				  (CSNUIInputDate -> MCDatePicker new).
				  (CSNUIInputRadio -> MCRadioButton new).
				  (CSNUIInputRange -> MCSlider new).
				  (CSNUISelect -> MCSelect new).
				  (CSNUITab -> MCTab new).
				  (CSNUITabManager -> MCTabGroup new).
				  (CSNBusinessPage -> BLMBusinessPage new).
				  (CSNPage -> BLMPage new).
				  (CSNUIInputFile -> BLMAttachment new).
				  (CSNUICWFileUploadPanel -> BLMAttachment new).
				  (CSNUILink -> BLMHyperlink new).
				  (CSNUITextarea -> MCTextArea new).
				  (CSNUICWDynamicFieldset -> MCExpansionModule new).
				  (CSNUICWDialog -> MCDialog new).
				  (CSNUICWProgressBar -> BLMHorizontalGauge new).
				  (CSNUITable -> MCTable new).
				  (CSNUIImage -> HTMLImgComponent new) } asDictionary;
		  yourself
]
