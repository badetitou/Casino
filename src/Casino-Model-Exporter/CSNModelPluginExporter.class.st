"
I am a abstract plugin to the exporter.

People can create plugin and expect the exporter to call them at possible export position with specific method.
You should look at less abstract class of myself to better understand how to create a plugin for each exporter
"
Class {
	#name : #CSNModelPluginExporter,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'exporter'
	],
	#category : #'Casino-Model-Exporter'
}

{ #category : #testing }
CSNModelPluginExporter class >> isAbstract [
	
	^self name = #CSNModelPluginExporter
]
