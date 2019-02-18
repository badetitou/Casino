Class {
	#name : #BaselineOfCasino,
	#superclass : #BaselineOf,
	#category : #BaselineOfCasino
}

{ #category : #baselines }
BaselineOfCasino >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfCasino >> defineDependencies: spec [
	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('smacc' 'visitor');
				repository: 'github://moosetechnology/FAST:master/src' ].
	spec
		package: 'PetitXml'
		with:
			[ spec repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
	spec
		baseline: 'Telescope'
		with: [ spec repository: 'github://TelescopeSt/Telescope:v2.x.x/src' ].
	spec
		baseline: 'Carrefour'
		with: [ spec repository: 'github://badetitou/Carrefour/src' ]
]

{ #category : #baselines }
BaselineOfCasino >> defineGroups: spec [
	spec
		group: 'default' with: #('core-extented' 'Casino-Model-Exporter-Angular' 'Casino-Model-Importer-Java');
		group: 'default-tests' with: #('default' 'Casino-Model-Importer-Java-Tests');
		group: 'model' with: #('Casino-MetamodelGenerator' 'Casino-Model');
		group: 'core' with: #('model' 'Casino-Model-Exporter' 'Casino-Model-Importer' 'Casino-Model-Extension');
		group: 'core-extented' with: #('core' 'Casino-Model-UI-SubEntities');
		group: 'query' with: #('Casino-Model-Query');
		group: 'importer-java' with: #('core-extented' 'Casino-Model-Importer-Java');
		group: 'bl-tests' with: #('bl' 'default-tests' 'Casino-Model-CoreWeb-Importer-Tests');
		group: 'tests' with: #('bl-tests' 'default-tests' 'behavior-tests');
		group: 'rh' with: #('bl' 'Casino-Migration-RH');
		group: 'ui-bl' with: #('bl' 'tests' 'Casino-MetamodelGenerator');
		group: 'bl' with: #('default' 'Casino-Model-CoreWeb' 'Casino-Model-CoreWeb-Exporter' 'Casino-Model-CoreWeb-Importer');
		group: 'behavior' with: #('ui-bl' 'Casino-Bind-UIBehavior-Generator' 'Casino-Behavior-Model-Generator' 'Casino-Behavior-Model-Importer-Java' 'Casino-Bind-UIBehavior' 'Casino-Behavior-Model');
		group: 'behavior-tests' with: #('behavior' 'Casino-Behavior-Model-Importer-Java-Tests');
		
		"bl"
		group: 'behavior-bl' with: #('behavior-importer-java' 'behavior-exporter-angular');
		group: 'behavior-importer-java' with: #('behavior' 'Casino-Behavior-Model-Importer-Java');
		group: 'behavior-exporter-angular' with: #('behavior' 'Casino-Behavior-Model-Exporter-CoreWeb')
]

{ #category : #baselines }
BaselineOfCasino >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/Casino-ToolKit';
		package: 'Casino-Model';
		package: 'Casino-Model-FamixNGPatch';
		package: 'Casino-Model-Extension';
		package: 'Casino-MetamodelGenerator';
		package: 'Casino-Model-Explorer';
		package: 'Casino-Model-Exporter' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-Exporter-Angular' with: [ spec requires: #('Casino-Model-Exporter' 'Casino-Model-Toolkit') ];
		package: 'Casino-Model-Importer' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-Importer-Java' with: [ spec requires: #('Casino-Model-Importer' 'Casino-Model-Toolkit') ];
		package: 'Casino-Model-Importer-Java-Tests' with: [ spec requires: #('Casino-Model-Importer-Java') ];
		package: 'Casino-Model-Query' with: [ spec requires: #('Casino-Model' 'Telescope') ];
		package: 'Casino-Model-UI-SubEntities' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-CoreWeb' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-CoreWeb-Exporter' with: [ spec requires: #('Casino-Model-CoreWeb' 'Casino-Model-Exporter-Angular') ];
		package: 'Casino-Model-CoreWeb-Importer' with: [ spec requires: #('PetitXml' 'Casino-Model-CoreWeb' 'Casino-Model-Importer-Java') ];
		package: 'Casino-Model-CoreWeb-Importer-Tests' with: [ spec requires: #('Casino-Model-CoreWeb-Importer' 'Casino-Model-Importer-Java-Tests') ];
		package: 'Casino-Model-Toolkit' with: [ spec requires: #('Casino-Model-CoreWeb') ];
		package: 'Casino-Migration-RH' with: [ spec requires: #('Casino-Model-CoreWeb-Importer') ];
		package: 'CSN-UIFASTBinding' with: [ spec requires: #('Casino-Model' 'FAST') ];
		
		"behavior-core"
		package: 'Casino-Behavior-Model-Generator' with: [ spec requires: #('FAST') ];
		package: 'Casino-Behavior-Model' with: [ spec requires: #('FAST') ];
		package: 'Casino-Behavior-Model-Visitor' with: [ spec requires: #('Casino-Behavior-Model') ];
		package: 'Casino-Behavior-Model-Extension' with: [ spec requires: #('Casino-Behavior-Model') ];
		"behavior-importer"
		package: 'Casino-Behavior-Model-Importer' with: [ spec requires: #('FAST') ];
		package: 'Casino-Behavior-Model-Importer-Java' with: [ spec requires: #('Carrefour' 'Casino-Behavior-Model-Importer') ];
		package: 'Casino-Behavior-Model-Importer-Java-Tests' with: [ spec requires: #('Casino-Behavior-Model-Importer-Java' 'Casino-Behavior-Model-Extension') ];
		"behavior-exporter"
		package: 'Casino-Behavior-Model-Exporter' with: [ spec requires: #('Casino-Behavior-Model' 'Casino-Behavior-Model-Visitor') ];
		package: 'Casino-Behavior-Model-Exporter-Angular' with: [ spec requires: #('Casino-Behavior-Model-Exporter') ];
		package: 'Casino-Behavior-Model-Exporter-CoreWeb' with: [ spec requires: #('Casino-Behavior-Model-Exporter-Angular') ];
		
		
		"binding"
		package: 'Casino-Bind-UIBehavior' with: [ spec requires: #('Casino-Model' 'FAST') ];
		package: 'Casino-Bind-UIBehavior-Generator' with: [ spec requires: #('Casino-Model' 'FAST') ]
]
