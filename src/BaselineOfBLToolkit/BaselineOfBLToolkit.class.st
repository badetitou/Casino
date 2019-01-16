Class {
	#name : #BaselineOfBLToolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfBLToolkit
}

{ #category : #baselines }
BaselineOfBLToolkit >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfBLToolkit >> defineDependencies: spec [
	spec
		baseline: 'FAST'
		with: [ spec
				loads: #('smacc' 'visitor');
				repository: 'github://moosetechnology/FAST:master/src' ].
	spec package: 'PetitXml' with: [ spec repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ]
]

{ #category : #baselines }
BaselineOfBLToolkit >> defineGroups: spec [
	spec
		group: 'default' with: #('core-extented' 'BL-Model-Exporter-Angular' 'BL-Model-Importer-Java');
		group: 'default-tests' with: #('default' 'BL-Model-Importer-Java-Tests');
		group: 'model' with: #('BL-MetamodelGenerator' 'BL-Model');
		group: 'core' with: #('model' 'BL-Model-Exporter' 'BL-Model-Importer' 'BL-Model-Extension');
		group: 'core-extented' with: #('core' 'BL-Model-Query' 'BL-Model-UI-SubEntities');
		group: 'query' with: #('core-extented');
		group: 'importer-java' with: #('core-extented' 'BL-Model-Importer-Java');
		group: 'bl' with: #('default' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter' 'BL-Model-CoreWeb-Importer');
		group: 'fast-bl' with: #('bl' 'CSN-UIFASTBinding' 'CSN-Behaviour-Model-Importer-Java');
		group: 'rh' with: #('bl' 'BL-Migration-RH');
		group: 'bl-tests' with: #('bl' 'default-tests' 'BL-Model-CoreWeb-Importer-Tests');
		group: 'tests' with: #('bl-tests' 'default-tests');
		group: 'pp' with: #('PetitXml');
		group: 'all' with: #('bl' 'tests' 'BL-Model-Query' 'BL-MetamodelGenerator')
]

{ #category : #baselines }
BaselineOfBLToolkit >> definePackages: spec [
	spec
		repository: 'https://github.com/badetitou/BL-ToolKit';
		package: 'BL-Model';
		package: 'BL-Model-FamixNGPatch';
		package: 'BL-Model-Extension';
		package: 'BL-MetamodelGenerator';
		package: 'BL-Model-Explorer';
		package: 'BL-Model-Exporter' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Exporter-Angular' with: [ spec requires: #('BL-Model-Exporter' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Importer' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Importer-Java' with: [ spec requires: #('BL-Model-Importer' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Importer-Java-Tests' with: [ spec requires: #('BL-Model-Importer-Java') ];
		package: 'BL-Model-Query' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-UI-SubEntities' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-CoreWeb' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-CoreWeb-Exporter' with: [ spec requires: #('BL-Model-CoreWeb' 'BL-Model-Exporter-Angular') ];
		package: 'BL-Model-CoreWeb-Importer' with: [ spec requires: #('pp' 'BL-Model-CoreWeb' 'BL-Model-Importer-Java') ];
		package: 'BL-Model-CoreWeb-Importer-Tests' with: [ spec requires: #('BL-Model-CoreWeb-Importer' 'BL-Model-Importer-Java-Tests') ];
		package: 'BL-Model-Toolkit' with: [ spec requires: #('BL-Model-CoreWeb') ];
		package: 'BL-Migration-RH' with: [ spec requires: #('BL-Model-CoreWeb-Importer') ];
		package: 'CSN-UIFASTBinding' with: [ spec requires: #('BL-Model' 'FAST') ];
		package: 'CSN-Behaviour-Model-Importer' with: [ spec requires: #('FAST') ];
		package: 'CSN-Behaviour-Model-Importer-Java' with: [ spec requires: #('CSN-Behaviour-Model-Importer' 'FAST') ]
]
