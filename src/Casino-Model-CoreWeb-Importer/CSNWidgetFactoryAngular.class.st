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
	^ widget createAttributeFromAngularInvocation: invoc withImporter: self uiModel
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createAttributeFrom: invoc forCellOf: widget [
	^ (CSNAttribute newFrom: invoc for: nil withImporter: self)
		ifNotNil: [ :attribute | widget layout at: invoc setAttribute: attribute ]
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createBusinessPageFromFAMIXClass: aFAMIXClass [
	self model
		silentlyAdd:
			(CSNBusinessPage new
				name: aFAMIXClass name;
				sourceAnchor: aFAMIXClass sourceAnchor;
				source: aFAMIXClass;
				computeTitle)
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createPageFromXMLElement: xmlElement [
	| blPhase |
	blPhase := CSNPage new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ (xmlElement parent attributeAt: 'name') = self moduleHomeName
						ifTrue: [ ((self uiModel sourceModel allModelClasses
								select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ])
								at: 1) mooseName ]
						ifFalse: [ 'STUB C/S' ] ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue);
		name: (xmlElement attributeAt: #codeValue).
	model silentlyAdd: (blPhase realClassName = 'STUB C/S'
		ifTrue: [ blPhase ]
		ifFalse: [ blPhase
				source: (self uiModel getClassNamed: blPhase realClassName);
				computeTitle;
				computeSubtitle.
			blPhase ])
]

{ #category : #factory }
CSNWidgetFactoryAngular >> createServiceFromServiceClass: aServiceClass [
	self model silentlyAdd: (CSNService new
		name: aServiceClass name;
		source: aServiceClass;
		yourself)
	
]

{ #category : #factory }
CSNWidgetFactoryAngular >> moduleHomeName [
	^ 'BL_HOME_PHASE_MODULE'
]
