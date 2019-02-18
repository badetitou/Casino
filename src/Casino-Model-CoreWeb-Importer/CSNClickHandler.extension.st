Extension { #name : #CSNClickHandler }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNClickHandler class >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ClickHandler'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNClickHandler class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'click';
		yourself
]
