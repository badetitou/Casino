"
A CSNBehaviorModelExporterAngularTest is a test class for testing the behavior of CSNBehaviorModelExporterAngular
"
Class {
	#name : #CSNBehaviorModelExporterAngularTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Casino-Behavior-Model-Exporter-Angular-Tests'
}

{ #category : #'as yet unclassified' }
CSNBehaviorModelExporterAngularTest >> methodToExport [
	^ 'public void onClick(ClickEvent event) {
	boolean[] b = { cbDataCollect.getValue(), cbDataCodeNet.getValue() };
}'
]

{ #category : #'as yet unclassified' }
CSNBehaviorModelExporterAngularTest >> setUp [
	super setUp.
	model := JavaSmaCCProgramNodeImporterVisitor parseCodeMethodString: self methodToExport.
]

{ #category : #'as yet unclassified' }
CSNBehaviorModelExporterAngularTest >> testMethodCorrectlyExported [
	self
		assert: (String streamContents: [ :stream | CSNBehaviorModelExporterAngular export: (model allWithType: FASTJavaMethodEntity) first on: stream ])
		equals:
			(String
				streamContents: [ :stream | 
					stream
						<< 'onClick(event) {';
						crlf;
						<< '    let b = [cbDataCollect.getValue(), cbDataCodeNet.getValue()];';
						crlf;
						<< '}' ])
]
