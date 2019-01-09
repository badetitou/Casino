Extension { #name : #BLClickHandler }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ClickHandler'
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLClickHandler class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'click';
		yourself
]
