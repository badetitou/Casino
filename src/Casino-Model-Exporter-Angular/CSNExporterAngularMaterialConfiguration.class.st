Class {
	#name : #CSNExporterAngularMaterialConfiguration,
	#superclass : #CSNExporterAngularConfiguration,
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #initialization }
CSNExporterAngularMaterialConfiguration >> defaultConfiguration [
	^ super defaultConfiguration
		addAll:
			{(CSNUIButton -> MCButton).
			(CSNUICWAutoComplete -> MCAutocomplete).
			(CSNUICWLinkSimple -> MCButton).
			(CSNUICWProgressBar -> MCProgressBar).
			(CSNUIFieldset -> MCCard).
			(CSNUIInput -> MCInput).
			(CSNUICWSwitch -> MCSlideToggle).
			(CSNUIInputCheckbox -> MCCheckbox).
			(CSNUIInputDate -> MCDatePicker).
			(CSNUIInputRadio -> MCRadioButton).
			(CSNUIInputRange -> MCSlider).
			(CSNUISelect -> MCSelect).
			(CSNUITab -> MCTab).
			(CSNUITabManager -> MCTabGroup)} asDictionary;
		yourself
]
