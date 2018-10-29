Class {
	#name : #BLWidgetFactoryAngular,
	#superclass : #BLWidgetFactory,
	#category : #'BL-Model-Importer-Java'
}

{ #category : #factory }
BLWidgetFactoryAngular >> createAttributeFromInvocation: invoc for: widget [
	^ widget createAttributeFromAngularInvocation: invoc withImporter: self importer
]

{ #category : #factory }
BLWidgetFactoryAngular >> createBusinessPageFromFAMIXClass: aFAMIXClass [
	^ BLBusinessPage new
		name: aFAMIXClass mooseName;
		sourceAnchor: aFAMIXClass sourceAnchor;
		source: aFAMIXClass;
		computeTitle 
]

{ #category : #factory }
BLWidgetFactoryAngular >> createPageFromXMLElement: xmlElement [
	| blPhase |
	blPhase := BLPage new
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ (xmlElement parent attributeAt: 'name') = self moduleHomeName
						ifTrue:
							[ ((self importer sourceModel allModelClasses select: [ :e | (e superInheritances collect: [ :a | a to name ]) includes: 'HomePhaseController' ]) at: 1) mooseName ]
						ifFalse: [ ^ nil ] ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue);
		name: (xmlElement attributeAt: #codeValue).
	blPhase
		source: (self importer getClassNamed: blPhase realClassName);
		computeTitle;
		computeSubtitle.
	^ blPhase
]

{ #category : #factory }
BLWidgetFactoryAngular >> moduleHomeName [
	^ 'BL_HOME_PHASE_MODULE'
]
