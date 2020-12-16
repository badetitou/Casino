Class {
	#name : #CSNWidgetFactoryAngular,
	#superclass : #CSNWidgetFactory,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #factory }
CSNWidgetFactoryAngular >> createActionFromClass: aClass for: widget [
	^ (CSNAction newFrom: aClass for: widget withImporter: self)
		ifNotNil: [ :action | self model silentlyAdd: action ]
		ifNil: [ ('no corresponding action for ' , aClass asString) record ]
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createAttributeFrom: invoc forCellOf: widget [
	^ (self createAttributeFor: nil from: invoc) ifNotNil: [ :attribute | widget layout at: invoc setAttribute: attribute ]
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createBusinessPageFromFAMIXClass: aFAMIXClass [
	^ (self create: CSNBusinessPage)
		name: aFAMIXClass name;
		source: aFAMIXClass;
		computeTitle;
		yourself
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createPageFromXMLElement: xmlElement [

	| blPhase |
	blPhase := (self create: CSNPage)
		           realClassName: ((xmlElement attributeAt: #className)
				            ifNotEmpty: [ :a | (a copyReplaceAll: '.' with: '::') copyReplaceAll: ' ' with: '' ]
				            ifEmpty: [ 
					            (xmlElement parent attributeAt: 'name') = self moduleHomeName
						            ifTrue: [ 
							            self importer sourceModel allModelClasses
								            detect: [ :class | class name = #HomePhaseController ]
								            ifFound: [ :abstractHomePhase | abstractHomePhase subclassHierarchy first mooseName ]
								            ifNone: [ 'STUB C/S' ] ]
						            ifFalse: [ 'STUB C/S' ] ]);
		           codePhase: (xmlElement attributeAt: #codePhase);
		           codeValue: (xmlElement attributeAt: #codeValue);
		           shortcut: (xmlElement attributeAt: #raccourci);
		           name: (xmlElement attributeAt: #codeValue).
	blPhase realClassName = 'STUB C/S'
		ifTrue: [ blPhase ]
		ifFalse: [ 
			blPhase
				source: (self importer getClassNamed: blPhase realClassName);
				computeTitle;
				computeSubtitle ].
	^ blPhase
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createServiceFromServiceClass: aServiceClass [
	^ (self create: CSNService)
		name: (aServiceClass name removePrefix: 'IGwt');
		targetPoint: (aServiceClass name removePrefix: 'IGwt') ;
		source: aServiceClass;
		yourself
	
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createWidgetFor: theWidgetSource withParent: parent [
	^ (CSNWidget newFrom: theWidgetSource for: parent withImporters: visitorImporters)
		ifNil: [ | widget |
			widget := (self create: CSNUICustomWidget)
				source: theWidgetSource;
				realClass:
					((#(#FactoryBLLabel #ComponentUtils) includes: theWidgetSource invokedClassName)
						ifTrue: [ nil ]
						ifFalse: [ theWidgetSource invokedClass ]);
				yourself.
			(CSNLLayout newFrom: theWidgetSource for: theWidgetSource withImporters: self visitorImporters) ifNotNil: [ :layout | widget layout: layout ].
			widget ]
]

{ #category : #factory }
CSNWidgetFactoryAngular >> moduleHomeName [
	^ 'BL_HOME_PHASE_MODULE'
]
