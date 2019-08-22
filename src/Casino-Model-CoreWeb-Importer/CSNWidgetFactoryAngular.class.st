Class {
	#name : #CSNWidgetFactoryAngular,
	#superclass : #CSNWidgetFactory,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #factory }
CSNWidgetFactoryAngular >> createActionFromClass: aClass for: widget [
	^ (CSNAction newFrom: aClass for: widget withImporter: self) ifNotNil: [ :action | self model silentlyAdd: action ]
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createAttributeFrom: invoc for: widget [
	^ widget createAttributeFromAngularInvocation: invoc withImporter: self importer
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createAttributeFrom: invoc forCellOf: widget [
	^ (CSNAttribute newFrom: invoc for: nil withImporter: self)
		ifNotNil: [ :attribute | widget layout at: invoc setAttribute: attribute ]
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
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ (xmlElement parent attributeAt: 'name') = self moduleHomeName
						ifTrue: [ ((self importer sourceModel allModelClasses
								select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ])
								at: 1) mooseName ]
						ifFalse: [ 'STUB C/S' ] ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue);
		name: (xmlElement attributeAt: #codeValue).
	(blPhase realClassName = 'STUB C/S'
		ifTrue: [ blPhase ]
		ifFalse: [ blPhase
				source: (self importer getClassNamed: blPhase realClassName);
				computeTitle;
				computeSubtitle ]).
	^ blPhase
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createServiceFromServiceClass: aServiceClass [
	^ (self create: CSNService)
		name: aServiceClass name;
		targetPoint: CSNWebModelJava webRoot, '/services/', aServiceClass name asLowercase;
		source: aServiceClass;
		yourself
	
]

{ #category : #factory }
CSNWidgetFactoryAngular >> moduleHomeName [
	^ 'BL_HOME_PHASE_MODULE'
]
