Class {
	#name : #BaselineOfBLToolkit,
	#superclass : #BaselineOf,
	#category : 'BaselineOfBLToolkit'
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
		configuration: 'PetitParser'
		with: [ spec
				versionString: #development;
				loads: 'Parser';
				repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main' ].
	spec
		configuration: 'PetitParser2'
		with: [ spec
				versionString: #development;
				loads: 'Headless';
				repository: 'github://kursjan/petitparser2' ]
]

{ #category : #baselines }
BaselineOfBLToolkit >> defineGroups: spec [
	spec
		group: 'default' with: #('core-extented' 'BL-Model-Exporter-Angular' 'BL-Model-Importer-Java');
		group: 'default-tests' with: #('default' 'BL-Model-Importer-Java-Tests');
		group: 'model' with: #('BL-MetamodelGenerator' 'BL-Model');
		group: 'core' with: #('BL-Model' 'BL-Model-Exporter' 'BL-Model-Importer' 'BL-Model-Extension' 'BL-MetamodelGenerator');
		group: 'core-extented' with: #('core' 'BL-Model-UI-SubEntities');
		group: 'importer-java' with: #('core-extented' 'BL-Model-Importer-Java');
		group: 'bl' with: #('default' 'BL-Model-Example' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter' 'BL-Model-CoreWeb-Importer');
		group: 'bl-tests' with: #('bl' 'default-tests' 'BL-Model-CoreWeb-Importer-Tests');
		group: 'tests' with: #('bl-tests' 'default-tests');
		group: 'pp' with: #('PetitParser');
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
		package: 'BL-Model-Example' with: [ spec requires: #('BL-Model-CoreWeb') ];
		package: 'BL-Model-Exporter' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Exporter-Angular' with: [ spec requires: #('BL-Model-Exporter' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Importer' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Importer-Java' with: [ spec requires: #('BL-Model-Importer' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Importer-Java-Tests' with: [ spec requires: #('BL-Model-Importer-Java') ];
		package: 'BL-Model-Query';
		package: 'BL-Model-UI-SubEntities' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-CoreWeb' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-CoreWeb-Exporter' with: [ spec requires: #('BL-Model-CoreWeb' 'BL-Model-Exporter-Angular') ];
		package: 'BL-Model-CoreWeb-Importer' with: [ spec requires: #('PetitParser' 'BL-Model-CoreWeb' 'BL-Model-Importer-Java') ];
		package: 'BL-Model-CoreWeb-Importer-Tests' with: [ spec requires: #('BL-Model-CoreWeb-Importer' 'BL-Model-Importer-Java-Tests') ];
		package: 'BL-Model-Toolkit' with: [ spec requires: #('BL-Model-CoreWeb') ]
]
