Class {
	#name : #CSNWebModelJavaOffice,
	#superclass : #CSNWebModelJava,
	#category : #'Casino-Migration-Omaje'
}

{ #category : #accessing }
CSNWebModelJavaOffice >> applicationSource [
	"name of the directory with the GWT application"
	^  'BLThotGwt'
]

{ #category : #initialization }
CSNWebModelJavaOffice >> createFactory [
	factory := CSNWidgetFactoryAngular new
		model: model;
		importer: self;
		addVisitorImporter: CSNModelImporterOfficeVisitor new;
		yourself
]
