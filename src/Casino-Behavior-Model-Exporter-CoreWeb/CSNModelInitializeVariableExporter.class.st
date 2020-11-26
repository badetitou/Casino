Class {
	#name : #CSNModelInitializeVariableExporter,
	#superclass : #CSNModelDependencyExporter,
	#category : #'Casino-Behavior-Model-Exporter-CoreWeb'
}

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitCSNAction: anAction [
	^ anAction behavior collect: [ :behavior | self accept: behavior ]
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitCSNActionAppel: anActionAppel [
	^ ''
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitCall: aCall [
	^ 'private ', aCall distantService serviceOwner uniqueName uncapitalized, ': ', aCall distantService serviceOwner uniqueName
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitNavigation: aNavigation [
	^ ''
]

{ #category : #generated }
CSNModelInitializeVariableExporter >> visitPopUp: aPopUp [
	^ 'private _snackBar: MatSnackBar'
]
