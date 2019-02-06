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
	spec package: 'PetitXml' with: [ spec repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ]
]

{ #category : #baselines }
BaselineOfCasino >> defineGroups: spec [
	spec
		group: 'default' with: #('core-extented' 'Casino-Model-Exporter-Angular' 'Casino-Model-Importer-Java');
		group: 'default-tests' with: #('default' 'Casino-Model-Importer-Java-Tests');
		group: 'model' with: #('Casino-MetamodelGenerator' 'Casino-Model');
		group: 'core' with: #('model' 'Casino-Model-Exporter' 'Casino-Model-Importer' 'Casino-Model-Extension');
		group: 'core-extented' with: #('core' 'Casino-Model-Query' 'Casino-Model-UI-SubEntities');
		group: 'query' with: #('core-extented');
		group: 'importer-java' with: #('core-extented' 'Casino-Model-Importer-Java');
		group: 'bl' with: #('default' 'Casino-Model-CoreWeb' 'Casino-Model-CoreWeb-Exporter' 'Casino-Model-CoreWeb-Importer');
		group: 'fast-bl' with: #('bl' 'CSN-UIFASTBinding' 'CSN-Behaviour-Model-Importer-Java');
		group: 'rh' with: #('bl' 'Casino-Migration-RH');
		group: 'bl-tests' with: #('bl' 'default-tests' 'Casino-Model-CoreWeb-Importer-Tests');
		group: 'tests' with: #('bl-tests' 'default-tests');
		group: 'pp' with: #('PetitXml');
		group: 'all' with: #('bl' 'tests' 'Casino-Model-Query' 'Casino-MetamodelGenerator')
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
		package: 'Casino-Model-Query' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-UI-SubEntities' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-CoreWeb' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-CoreWeb-Exporter' with: [ spec requires: #('Casino-Model-CoreWeb' 'Casino-Model-Exporter-Angular') ];
		package: 'Casino-Model-CoreWeb-Importer' with: [ spec requires: #('pp' 'Casino-Model-CoreWeb' 'Casino-Model-Importer-Java') ];
		package: 'Casino-Model-CoreWeb-Importer-Tests' with: [ spec requires: #('Casino-Model-CoreWeb-Importer' 'Casino-Model-Importer-Java-Tests') ];
		package: 'Casino-Model-Toolkit' with: [ spec requires: #('Casino-Model-CoreWeb') ];
		package: 'Casino-Migration-RH' with: [ spec requires: #('Casino-Model-CoreWeb-Importer') ];
		package: 'CSN-UIFASTBinding' with: [ spec requires: #('Casino-Model' 'FAST') ];
		package: 'CSN-Behaviour-Model-Importer' with: [ spec requires: #('FAST') ];
		package: 'CSN-Behaviour-Model-Importer-Java' with: [ spec requires: #('CSN-Behaviour-Model-Importer' 'FAST') ]
]
