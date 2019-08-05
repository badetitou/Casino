"
return nil if fail
return the created entioty elsewhere
"
Class {
	#name : #CSNModelImporterVisitor,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'factory',
		'entity'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNModelImporterVisitor >> create: anEntity [
	^ self factory create: anEntity
]

{ #category : #accessing }
CSNModelImporterVisitor >> entity [
	"the owner entity"
	^ entity
]

{ #category : #accessing }
CSNModelImporterVisitor >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
CSNModelImporterVisitor >> factory [
	^ factory
]

{ #category : #accessing }
CSNModelImporterVisitor >> factory: anObject [
	factory := anObject
]
