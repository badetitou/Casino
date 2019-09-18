Extension { #name : #CSNUICWClickHandler }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUICWClickHandler classSide >> canHandle: aFAMIXClass [
	^ aFAMIXClass name includesSubstring: 'ClickHandler'
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUICWClickHandler classSide >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ (super createActionFrom: aClass for: aWidgetInstance withImporter: anImporter)
		name: 'click';
		yourself
]
