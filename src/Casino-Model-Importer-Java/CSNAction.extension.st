Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction classSide >> canHandle: aFAMIXElement [
	^ false
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction classSide >> canHandle: aFAMIXElement for: aWidgetInstanc [
	^ self canHandle: aFAMIXElement
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction classSide >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ self new
		source: aClass;
		name: aClass name;
		caller: aWidgetInstance;
		yourself
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction classSide >> newFrom: aClass for: aWidgetInstance withImporter: anImporter [

	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: aClass for: aWidgetInstance withImporter: anImporter.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: aClass for: aWidgetInstance)
		ifTrue: [ ^ self createActionFrom: aClass for: aWidgetInstance withImporter: anImporter ]
		ifFalse: [ ^ nil ]
]
