"
This configuration should only use Material Component
It is more present for demonstration than real usage
"
Class {
	#name : #CSNExporterAngularMaterialConfiguration,
	#superclass : #CSNExporterAngularConfiguration,
	#category : #'Casino-Model-CoreWeb-Exporter'
}

{ #category : #initialization }
CSNExporterAngularMaterialConfiguration >> defaultConfiguration [
	^ super defaultConfiguration
		addAll:
			{(CSNUIButton -> MCButton new).
			(CSNUICWAutoComplete -> MCAutocomplete new).
			(CSNUICWLinkSimple -> MCButton new).
			(CSNUICWProgressBar -> MCProgressBar new).
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
			(CSNUILink
				->
					(MCButton new
						isLink: true;
						yourself)).
			(CSNUIImage -> HTMLImgComponent new)} asDictionary;
		yourself
]
