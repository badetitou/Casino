"
## Usage 

```st
CSNVModulesDependency new
	modules: aCollectionOfCSNIModule;
	build;
	vizualization
```
"
Class {
	#name : #CSNVModulesDependency,
	#superclass : #Object,
	#instVars : [
		'modules',
		'collapseModuleWhen',
		'vizualization',
		'propertiesForModuleBlock'
	],
	#category : #'Casino-Model-Visualisation-Modules'
}

{ #category : #accessing }
CSNVModulesDependency >> build [

	"I build the vizualization"

	| rootNode modulesNodes subNodes |
	rootNode := HNode new name: 'Root'.
	rootNode layout: RSSugiyamaLayout new.
	modulesNodes := modules collect: [ :module | 
		                CSNVNode new
			                rawModel: module;
			                name: module name;
			                propertiesDic: (self propertiesForModule: module);
			                yourself ].
	subNodes := (modulesNodes collect: [ :moduleNode | 
		             | pagesNode |
		             pagesNode := moduleNode rawModel pages collect: [ :page | 
			                          CSNVNode new
				                          rawModel: page;
				                          name: page name;
				                          yourself ].
		             moduleNode addAll: pagesNode.
		             pagesNode ]) flattened.

	subNodes do: [ :pageNode | 
		pageNode rawModel caller do: [ :caller | 
			(caller caller rootNode isKindOf: CSNPage) ifTrue: [ 
				(subNodes detect: [ :node | 
					 node rawModel = caller caller rootNode ]) dependencyTo: pageNode ] ] ].

	rootNode addAll: modulesNodes.
	rootNode.

	modulesNodes do: [ :moduleNode | 
		(collapseModuleWhen cull: moduleNode rawModel) ifTrue: [ 
			moduleNode collapse ] ].

	vizualization := CSNVSimpleVisualizationBuilder new
		                 rootNode: rootNode;
		                 build.
	vizualization zoomToFit.
	vizualization @ RSCanvasController new noLegend
]

{ #category : #accessing }
CSNVModulesDependency >> collapseAllModules [

	collapseModuleWhen := [ :module | true ]
]

{ #category : #accessing }
CSNVModulesDependency >> collapseModuleWhen [

	^ collapseModuleWhen
]

{ #category : #accessing }
CSNVModulesDependency >> collapseModuleWhen: anObject [

	collapseModuleWhen := anObject
]

{ #category : #initialization }
CSNVModulesDependency >> initialize [

	super initialize.
	collapseModuleWhen := [ :module | false ].
	propertiesForModuleBlock := [ :module | {  } asDictionary ]
]

{ #category : #accessing }
CSNVModulesDependency >> modules [

	^ modules
]

{ #category : #accessing }
CSNVModulesDependency >> modules: anObject [

	modules := anObject
]

{ #category : #accessing }
CSNVModulesDependency >> propertiesForModule: aModule [
	^ self propertiesForModuleBlock value: aModule
]

{ #category : #accessing }
CSNVModulesDependency >> propertiesForModuleBlock [

	^ propertiesForModuleBlock
]

{ #category : #accessing }
CSNVModulesDependency >> propertiesForModuleBlock: anObject [

	propertiesForModuleBlock := anObject
]

{ #category : #accessing }
CSNVModulesDependency >> vizualization [

	^ vizualization
]
