"
""I contain an importer for the behavioural code.""
""I also linked the behavioural model to the UI model.""

behaviouralModel := CSNBehaviourModelImporterJava new uiModel: gwtModel; sourceCodeModel: gwtMooseModel; generateBehaviouralModel.
"
Class {
	#name : #ManifestCSNBehaviorModelImporterJava,
	#superclass : #PackageManifest,
	#category : #'Casino-Behaviour-Model-Importer-Java'
}
