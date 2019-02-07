Class {
	#name : #CSNUIFASTBindingGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'action',
		'javaMethod'
	],
	#category : #'Casino-Bind-UIBehavior-Generator'
}

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> packageName [

	<ignoreForCoverage>
	^ 'Casino-Bind-UIBehavior'
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> prefix [

	<ignoreForCoverage>
	^ #CSN
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> submetamodels [

	^ { CSNBehaviorModelGenerator. CSNLayoutMetamodelGenerator }
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineClasses [
	super defineClasses.
	action := self remoteEntity: #Action withPrefix: #CSN.
	javaMethod := self remoteEntity: #JavaMethodEntity withPrefix: #CSNB 
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineRelations [
	(action property: #behavior) -* (javaMethod property: #ui)
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> newBuilder [

	| mqBuilder |

	mqBuilder := FamixMooseQueryGenerator builderWithDefinitions.

	self adoptBuilder: mqBuilder.

	^ mqBuilder
		doNotGenerateCurrent;
		generator: self;
		yourself.
]
