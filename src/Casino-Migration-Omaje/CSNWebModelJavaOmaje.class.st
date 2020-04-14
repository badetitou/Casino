Class {
	#name : #CSNWebModelJavaOmaje,
	#superclass : #CSNWebModelJava,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #accessing }
CSNWebModelJavaOmaje >> applicationSource [
	"name of the directory with the GWT application"
	^  'BLOmajeGwt'
]

{ #category : #initialization }
CSNWebModelJavaOmaje >> createFactory [
	factory := CSNWidgetFactoryAngularOmaje new
		model: model;
		importer: self;
		addVisitorImporter: CSNModelImporterCoreWebVisitor new;
		yourself
]
