Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction class >> canHandle: aFAMIXElement [
	^ false
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction class >> canHandle: aFAMIXElement for: aWidgetInstanc [
	^ self canHandle: aFAMIXElement
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ self new
		source: aClass;
		name: aClass name;
		caller: aWidgetInstance;
		yourself
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAction class >> newFrom: aClass for: aWidgetInstance withImporter: anImporter [

	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: aClass for: aWidgetInstance withImporter: anImporter.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: aClass for: aWidgetInstance)
		ifTrue: [ ^ self createActionFrom: aClass for: aWidgetInstance withImporter: anImporter ]
		ifFalse: [ ^ nil ]
]
