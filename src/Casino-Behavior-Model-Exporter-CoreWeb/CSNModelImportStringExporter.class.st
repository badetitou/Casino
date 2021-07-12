Class {
	#name : #CSNModelImportStringExporter,
	#superclass : #CSNModelDependencyExporter,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNModelImportStringExporter >> visitCSNAction: anAction [
	^ anAction behavior collect: [ :behavior | self accept: behavior ]
]

{ #category : #generated }
CSNModelImportStringExporter >> visitCall: aCall [
	^ 'import { ' , aCall distantService serviceOwner uniqueName , ' } from ''app/', self context root basename, '/' , aCall distantService serviceOwner getLocalPath , ''';'
]

{ #category : #generated }
CSNModelImportStringExporter >> visitDOMElementAcccess: aDOMElementAcccess [
	^ (self exporterAngularConfiguration angularRepresentationOf: aDOMElementAcccess widget) importString
]

{ #category : #generated }
CSNModelImportStringExporter >> visitNavigation: aNavigation [
	^ ''
]

{ #category : #generated }
CSNModelImportStringExporter >> visitPopUp: aPopUp [
	^ 'import { MatSnackBar } from ''@angular/material/snack-bar'';'
]
