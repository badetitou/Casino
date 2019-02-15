"
""I contain an importer for the behavioural code.""
""I also linked the behavioural model to the UI model.""

behavioralModel := CSNBehaviorModelImporterJava new uiModel: gwtModel; sourceCodeModel: gwtMooseModel; generateBehavioralModel.
"
Class {
	#name : #ManifestCSNBehaviorModelImporterJava,
	#superclass : #PackageManifest,
	#category : #'Casino-Behavior-Model-Importer-Java'
}
