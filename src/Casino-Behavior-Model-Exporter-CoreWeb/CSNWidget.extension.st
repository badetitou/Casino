Extension { #name : #CSNWidget }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNWidget >> gtActionsAngularCodeIn: composite [
	<gtInspectorPresentationOrder: 1012>
	composite text
		title: 'Angular Code';
		display: [ String
				streamContents: [ :s | 
					| exporter |
					exporter := (CSNBehaviorModelExporterCoreWeb on: s)
						currentPage: self rootNode anyOne;
						yourself.
					self actions anyOne behavior do: [ :behavior | exporter export: behavior ] ] ];
		withLineNumbers: true;
		when: [ self actions isNotEmpty and: [ self actions anyOne behavior isNotEmpty ] ]
]
