Extension { #name : #CSNUICWClickHandler }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUICWClickHandler class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ClickHandler'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUICWClickHandler class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'click';
		yourself
]
