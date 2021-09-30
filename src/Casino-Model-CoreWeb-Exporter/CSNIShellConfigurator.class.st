Class {
	#name : #CSNIShellConfigurator,
	#superclass : #Object,
	#instVars : [
		'location',
		'modules'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLIdentity'
}

{ #category : #accessing }
CSNIShellConfigurator >> configure [

	self fixWebPackConfig
]

{ #category : #api }
CSNIShellConfigurator >> fixWebPackConfig [

	| old new newRemotes startRemote |
	old := (location / 'webpack.config.js') contents.
	newRemotes := String streamContents: [ :stream | 
		              modules do: [ :module | 
			              stream
				              << '           ''';
				              << module name;
				              << ''': "';
				              << module name;
				              << '@http://localhost:';
				              << module port printString;
				              << '/remoteEntry.js",';
				              << String crlf ] ].
	startRemote := (old findString: 'remotes: {') + 'remotes: {' size.
	new := old copyReplaceFrom: startRemote + 1 to: (old findString: '}' startingAt: startRemote) - 1 with: newRemotes.
	(location / 'webpack.config.js')
		delete;
		writeStreamDo: [ :stream | stream nextPutAll: new ]
]

{ #category : #accessing }
CSNIShellConfigurator >> location [

	^ location
]

{ #category : #accessing }
CSNIShellConfigurator >> location: anObject [

	location := anObject
]

{ #category : #accessing }
CSNIShellConfigurator >> modules [

	^ modules
]

{ #category : #accessing }
CSNIShellConfigurator >> modules: anObject [

	modules := anObject
]
