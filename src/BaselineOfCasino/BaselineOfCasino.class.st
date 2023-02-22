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
BaselineOfCasino >> defineBehaviorPackages: spec [

	"behavior-core"

	spec
		package: 'Casino-Behavior-Model'
		with: [ 
			spec requires: #( 'FASTJava' 'Casino-Behavior-Model-Generator' ) ];
		package: 'Casino-Behavior-Model-Generator'
		with: [ spec requires: #( 'FASTJava' ) ];
		package: 'Casino-Behavior-Model-Visitor'
		with: [ spec requires: #( 'Casino-Behavior-Model' ) ];
		package: 'Casino-Behavior-Model-Extension'
		with: [ spec requires: #( 'Casino-Behavior-Model' ) ];
		"behavior-importer"package: 'Casino-Behavior-Model-Importer'
		with: [ spec requires: #( 'FASTJava' ) ];
		package: 'Casino-Behavior-Model-Importer-Java'
		with: [ 
			spec requires: #( 'Carrefour' 'Casino-Behavior-Model-Importer' ) ];
		package: 'Casino-Behavior-Model-Importer-Java-Tests' with: [ 
			spec requires: #( 'Casino-Behavior-Model-Importer-Java'
					   'Casino-Behavior-Model-Extension' ) ];
		"behavior-exporter"package: 'Casino-Behavior-Model-Exporter'
		with: [ 
			spec requires:
					#( 'Casino-Exporter' 'Casino-Behavior-Model'
					   'Casino-Behavior-Model-Visitor' ) ];
		package: 'Casino-Behavior-Model-Exporter-Angular'
		with: [ spec requires: #( 'Casino-Behavior-Model-Exporter' ) ];
		package: 'Casino-Behavior-Model-Exporter-CoreWeb'
		with: [ 
			spec requires: #( 'Casino-Behavior-Model-Exporter-Angular' ) ];
		package: 'Casino-BL-GWT-ServiceRest-Exporter' with: [ 
			spec requires:
					#( 'Casino-Helper' 'Famix2Java' 'Casino-Business-Model' ) ]
]

{ #category : #baselines }
BaselineOfCasino >> defineBusinessPackages: spec [

	"behavior-core"

	spec
		package: 'Casino-Business-Model'
		with: [ spec requires: #( 'Casino-Business-Model-Generator' ) ];
		package: 'Casino-Business-Model-Extension'
		with: [ spec requires: #( 'Casino-Business-Model' ) ];
		package: 'Casino-Business-Model-Generator';
		package: 'Casino-Business-Model-Importer-CoreWeb'
		with: [ spec requires: #( 'Casino-Business-Model'
				   'Famix2Java' ) ];
		package: 'Casino-Business-Model-Exporter-CoreWeb' with: [ 
			spec requires:
					#( 'Casino-Business-Model' 'Casino-Exporter' 'Casino-Business-Model-Extension' ) ];
		package: 'Casino-Business-Model-Importer-CoreWeb-Tests'
		with: [ 
			spec requires: #( 'Casino-Business-Model-Importer-CoreWeb' ) ];
		package: 'Casino-Business-Model-Exporter-CoreWeb-Tests'
		with: [ 
			spec requires: #( 'Casino-Business-Model-Exporter-CoreWeb' ) ]
]

{ #category : #baselines }
BaselineOfCasino >> defineDependencies: spec [

	spec baseline: 'FASTJava' with: [ 
		spec
			loads: #( 'smacc' 'visitor' );
			repository: 'github://moosetechnology/FAST-Java:v3/src' ].
	spec
		baseline: 'XMLParser'
		with: [ 
		spec repository: 'github://pharo-contributions/XML-XMLParser/src' ].
	spec baseline: 'TelescopeCytoscape' with: [ 
		spec repository:
			'github://TelescopeSt/TelescopeCytoscape:v2.x.x/src' ].
	spec
		baseline: 'Carrefour'
		with: [ spec repository: 'github://badetitou/Carrefour:v4/src' ].
	spec
		baseline: 'MoreLogger'
		with: [ spec repository: 'github://badetitou/MoreLogger:main/src' ].
	spec
		baseline: 'Famix2Java'
		with: [ 
		spec repository: 'github://moosetechnology/FAMIX2Java:v3/src' ].
	spec baseline: 'PharoStringCaseFormating' with: [ 
		spec repository:
			'github://badetitou/PharoStringCaseFormating:main/src' ]
]

{ #category : #baselines }
BaselineOfCasino >> defineGroups: spec [

	spec
		group: 'default'
		with: #( 'core-extented' 'Casino-Model-Exporter-Angular'
			   'Casino-Model-Importer-Java' 'Casino-Helper' );
		group: 'default-tests'
		with: #( 'default' 'Casino-Model-Importer-Java-Tests'
			   'Casino-Model-Importer-Tests' 'Casino-Model-Extension-Tests'
			   'Casino-Model-Exporter-Angular-Tests'
			   'Casino-Model-Layout-Tests' );
		group: 'model'
		with: #( 'Casino-Model' 'Casino-Core-ExternalLibrary'
			   'Casino-Model-Extension' );
		group: 'core'
		with: #( 'model' 'Casino-Model-Exporter' 'Casino-Model-Importer' );
		group: 'core-extented'
		with:
			#( 'core' 'Casino-Model-UI-SubEntities'
			   'Casino-Model-Layout-Extension' );
		group: 'importer-java'
		with: #( 'core-extented' 'Casino-Model-Importer-Java' );
		group: 'bl-tests'
		with: #( 'bl' 'default-tests' 'Casino-Model-CoreWeb-Importer-Tests'
			   'Casino-Model-CoreWeb-Exporter-Tests' );
		group: 'tests'
		with:
			#( 'bl-tests' 'default-tests' 'behavior-tests' 'business-tests' );
		group: 'ui-bl' with: #( 'bl' 'tests' );
		group: 'bl'
		with:
			#( 'default' 'Casino-Model-CoreWeb' 'Casino-Model-CoreWeb-Exporter'
			   'Casino-Model-CoreWeb-Importer' );
		group: 'behavior'
		with: #( 'ui-bl' 'Casino-Behavior-Model-Generator'
			   'Casino-Behavior-Model-Importer-Java'
			   'Casino-Behavior-Model' );
		group: 'behavior-tests'
		with: #( 'behavior' 'Casino-Behavior-Model-Importer-Java-Tests' );
		"bl"group: 'behavior-bl'
		with: #( 'behavior-importer-java' 'behavior-exporter-angular' );
		group: 'behavior-importer-java'
		with: #( 'behavior' 'Casino-Behavior-Model-Importer-Java' );
		group: 'behavior-exporter-angular'
		with: #( 'behavior' 'Casino-Behavior-Model-Exporter-CoreWeb'
			   'Casino-Behavior-Model-Exporter-Angular-Tests' );
		"business"group: 'business'
		with:
			#( 'Casino-Business-Model' 'Casino-Business-Model-Importer-CoreWeb'
			   'Casino-Business-Model-Exporter-CoreWeb' );
		group: 'business-tests'
		with: #( 'business' 'Casino-Business-Model-Importer-CoreWeb-Tests'
			   'Casino-Business-Model-Exporter-CoreWeb-Tests' );
		"export java"group: 'rest-java'
		with: #( 'Casino-BL-GWT-ServiceRest-Exporter' )
]

{ #category : #baselines }
BaselineOfCasino >> definePackages: spec [
	spec
		package: 'Casino-Helper' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model' with: [ spec requires: #('Casino-Model-Generator') ];
		package: 'Casino-Model-Extension' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-Model-Extension-Tests' with: [ spec requires: #('Casino-Model-Extension') ];
		package: 'Casino-Core-ExternalLibrary' with: [ spec requires: #('Casino-Model') ];
		package: 'Casino-CoreWeb-ExternalLibrary' with: [ spec requires: #('Casino-Core-ExternalLibrary') ];
		package: 'Casino-Model-Generator';
		package: 'Casino-Model-UI-SubEntities' with: [ spec requires: #('Casino-Model' 'Casino-Model-UI-SubEntities-Generator') ];
		package: 'Casino-Model-UI-SubEntities-Generator';
		package: 'Casino-Model-Layout' with: [ spec requires: #('Casino-Model' 'Casino-Model-Layout-Generator') ];
		package: 'Casino-Model-Layout-Extension' with: [ spec requires: #('Casino-Model-Layout') ];
		package: 'Casino-Model-Layout-Tests' with: [ spec requires: #('Casino-Model-Layout-Extension') ];
		package: 'Casino-Model-Layout-Generator';
		package: 'Casino-Model-Visitor' with: [ spec requires: #('model' 'Casino-Model-CoreWeb') ];
		package: 'Casino-Model-CoreWeb-Visitor' with: [ spec requires: #('Casino-Model-Visitor' 'Casino-Model-CoreWeb') ];
		package: 'Casino-Exporter';
		package: 'Casino-Model-Exporter' with: [ spec requires: #('Casino-Model-CoreWeb-Visitor' 'Casino-Exporter' 'Casino-Helper') ];
		package: 'Casino-Model-Exporter-Angular'
			with: [ spec requires: #('Casino-Model-Exporter' 'Casino-CoreWeb-ExternalLibrary' 'Casino-Core-ExternalLibrary' 'PharoStringCaseFormating') ];
		package: 'Casino-Model-Exporter-Angular-Tests' with: ['Casino-Model-Exporter-Angular' ];
		package: 'Casino-Behavior-Model-Exporter-Angular-Tests' with: [ spec requires: #('Casino-Model-Exporter-Angular') ];
		package: 'Casino-Model-Importer' with: [ spec requires: #('Casino-Model-CoreWeb-Visitor' 'MoreLogger' 'Casino-Helper') ];
		package: 'Casino-Model-Importer-Tests' with: [ spec requires: #('Casino-Model-Importer') ];
		package: 'Casino-Model-Importer-Java' with: [ spec requires: #('Casino-Model-Importer' 'Carrefour') ];
		package: 'Casino-Model-Importer-Java-Tests' with: [ spec requires: #('Casino-Model-Importer-Java') ];
		package: 'Casino-Model-CoreWeb' with: [ spec requires: #('Casino-Model-UI-SubEntities' 'Casino-Model' 'Casino-Model-CoreWeb-Generator') ];
		package: 'Casino-Model-CoreWeb-Generator' with: [ spec requires: #('Casino-Model-UI-SubEntities-Generator' 'Casino-Model-Generator') ];
		package: 'Casino-Model-CoreWeb-Exporter' with: [ spec requires: #('Casino-Model-Exporter-Angular') ];
		package: 'Casino-Model-CoreWeb-Exporter-Tests' with: [ spec requires: #('Casino-Model-CoreWeb-Exporter') ];
		package: 'Casino-Model-CoreWeb-Importer' with: [ spec requires: #('XMLParser' 'Casino-Model-CoreWeb' 'Casino-Model-Importer-Java') ];
		package: 'Casino-Model-CoreWeb-Importer-Tests' with: [ spec requires: #('Casino-Model-CoreWeb-Importer' 'Casino-Model-Importer-Java-Tests') ];
		package: 'CSN-UIFASTBinding' with: [ spec requires: #('Casino-Model' 'FASTJava') ].
	"models"
	self defineBehaviorPackages: spec.
	self defineBusinessPackages: spec
]
