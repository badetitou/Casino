*BL-Model-CoreWeb-Importer
canHandle: aFAMIXClass
	^ aFAMIXClass isClass and: [ aFAMIXClass name includesSubstring: 'ClickHandler' ]