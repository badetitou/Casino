Class {
	#name : #CSNWidgetFactoryAngularOmaje,
	#superclass : #CSNWidgetFactoryAngular,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #factory }
CSNWidgetFactoryAngularOmaje >> createPageFromXMLElement: xmlElement [
	| blPhase |
	blPhase := (self create: CSNPage)
		realClassName:
			((xmlElement attributeAt: #className)
				ifNotNil: [ :a | (a replaceAllRegex: '\.' with: '::') replaceAllRegex: ' ' with: '' ]
				ifNil: [ (xmlElement parent attributeAt: 'name') = self moduleHomeName
						ifTrue: [ (self importer sourceModel allModelClasses select: [ :e | (e superInheritances collect: [ :a | a target name ]) includes: 'HomePhaseController' ])
								ifEmpty: [ (self importer sourceModel allModelClasses detect: [ :a | a mooseName = 'fr::bl::client::omaje::PhaseAccueilOmaje' ]) mooseName ]
								ifNotEmpty: [ :collectionOfPossibleHomePage | collectionOfPossibleHomePage first mooseName ] ]
						ifFalse: [ 'STUB C/S' ] ]);
		codePhase: (xmlElement attributeAt: #codePhase);
		codeValue: (xmlElement attributeAt: #codeValue);
		shortcut: (xmlElement attributeAt: #raccourci);
		name: (xmlElement attributeAt: #codeValue).
	blPhase realClassName = 'STUB C/S'
		ifFalse: [ blPhase
				source: (self importer getClassNamed: blPhase realClassName);
				computeTitle;
				computeSubtitle ].
	^ blPhase
]
