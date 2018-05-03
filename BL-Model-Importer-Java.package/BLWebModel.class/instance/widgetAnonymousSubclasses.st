as yet unclassified
widgetAnonymousSubclasses
	^ ((self modelWidget flatCollect: [ :widget | widget subclassHierarchy ]) select: #isAnonymousClass) asOrderedCollection 