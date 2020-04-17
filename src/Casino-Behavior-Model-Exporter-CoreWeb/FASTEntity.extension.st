Extension { #name : #FASTEntity }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
FASTEntity >> gtInAngular: composite [
	<gtInspectorPresentationOrder: 1005>
	composite text
		title: 'Angular';
		display: [ String streamContents: [ :s | CSNBehaviorModelExporterCoreWeb export: self rootNode on: s ] ];
		withLineNumbers: true;
		when: [ self mooseModel isKindOf: CSNBModel ]
]
