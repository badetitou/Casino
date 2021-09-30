Class {
	#name : #CSNIRepositoryConfigurator,
	#superclass : #Object,
	#instVars : [
		'location',
		'csniModule',
		'port'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #api }
CSNIRepositoryConfigurator >> configure [
	self fixAngularJSON.
	self fixPackageJSON.
	self fixAppConfig.
	self fixWebPackConfig
]

{ #category : #accessing }
CSNIRepositoryConfigurator >> csniModule [

	^ csniModule
]

{ #category : #accessing }
CSNIRepositoryConfigurator >> csniModule: anObject [

	csniModule := anObject
]

{ #category : #private }
CSNIRepositoryConfigurator >> fixAngularJSON [
	| old new |
	old := (location / 'angular.json') contents.
	new := old copyReplaceAll: 'microfrontend' with: (csniModule name asLowercase).
	new := new copyReplaceAll: '4201' with: self port asString.
	(location / 'angular.json') delete.
	(location / 'angular.json') writeStreamDo: [ :stream | stream nextPutAll: new ]
]

{ #category : #api }
CSNIRepositoryConfigurator >> fixAppConfig [

	| old new |
	old := (location / 'src' / 'app' / 'configuration' / 'app.config.ts') contents.
	new := old copyReplaceAll: 'Microfrontend APP' with: csniModule name.
	(location / 'src' / 'app' / 'configuration' / 'app.config.ts') delete.
	location / 'src' / 'app' / 'configuration' / 'app.config.ts' writeStreamDo: [ :stream | stream nextPutAll: new ]
]

{ #category : #private }
CSNIRepositoryConfigurator >> fixPackageJSON [
	| old new |
	old := (location / 'package.json') contents.
	new := old copyReplaceAll: 'microfrontend' with: (csniModule name asLowercase).
	(location / 'package.json') delete.
	(location / 'package.json') writeStreamDo: [ :stream | stream nextPutAll: new ]
]

{ #category : #api }
CSNIRepositoryConfigurator >> fixWebPackConfig [

	| old new |
	old := (location / 'webpack.config.js') contents.
	new := old copyReplaceAll: 'microfrontend' with: csniModule name.
	(location / 'webpack.config.js') delete.
	location / 'webpack.config.js' writeStreamDo: [ :stream | stream nextPutAll: new ]
]

{ #category : #accessing }
CSNIRepositoryConfigurator >> location [

	^ location
]

{ #category : #accessing }
CSNIRepositoryConfigurator >> location: anObject [

	location := anObject
]

{ #category : #accessing }
CSNIRepositoryConfigurator >> port [

	^ self csniModule port
]
