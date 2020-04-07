"
return nil if fail
return the created entioty elsewhere
"
Class {
	#name : #CSNModelBehaviorImporterVisitor,
	#superclass : #CSNModelVisitor,
	#instVars : [
		'entity',
		'factory',
		'source'
	],
	#classInstVars : [
		'entity',
		'factory'
	],
	#category : #'Casino-Behavior-Model-Importer'
}

{ #category : #accessing }
CSNModelBehaviorImporterVisitor >> entity [
	"the owner entity"
	^ entity
]

{ #category : #accessing }
CSNModelBehaviorImporterVisitor >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
CSNModelBehaviorImporterVisitor >> source [
	^ source
]

{ #category : #accessing }
CSNModelBehaviorImporterVisitor >> source: anObject [
	source := anObject
]

{ #category : #visitor }
CSNModelBehaviorImporterVisitor >> visitCSNOriginedEntity: aCSNOriginedEntity [
	^ nil
]
