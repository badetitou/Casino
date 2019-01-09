Extension { #name : #BLAction }

{ #category : #'*BL-Model-Importer-Java' }
BLAction class >> canHandle: aFAMIXElement [
	^ false
]

{ #category : #'*BL-Model-Importer-Java' }
BLAction class >> canHandle: aFAMIXElement for: aWidgetInstanc [
	^ self canHandle: aFAMIXElement
]

{ #category : #'*BL-Model-Importer-Java' }
BLAction class >> createActionFrom: aClass for: aWidgetInstance withImporter: anImporter [
	^ self new
		source: aClass;
		name: aClass name;
		caller: aWidgetInstance;
		yourself
]

{ #category : #'*BL-Model-Importer-Java' }
BLAction class >> newFrom: aClass for: aWidgetInstance withImporter: anImporter [

	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: aClass for: aWidgetInstance withImporter: anImporter.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: aClass for: aWidgetInstance)
		ifTrue: [ ^ self createActionFrom: aClass for: aWidgetInstance withImporter: anImporter ]
		ifFalse: [ ^ nil ]
]
