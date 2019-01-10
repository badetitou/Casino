"
""I contain an importer for the behavioural code.""
""I also linked the behavioural model to the UI model.""

behaviouralModel := CSNBehaviourModelImporterJava new behaviouralModel: MooseModel new; uiModel: gwtModel; sourceCodeModel: gwtMooseModel; generateBehaviouralModel.
"
Class {
	#name : #ManifestCSNBehaviourModelImporterJava,
	#superclass : #PackageManifest,
	#category : #'CSN-Behaviour-Model-Importer-Java'
}
