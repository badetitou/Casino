Class {
	#name : #CSNUIFASTBindingGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'action',
		'javaMethod'
	],
	#category : #'CSN-UIFASTBindingGenerator'
}

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> packageName [

	<ignoreForCoverage>
	^ 'CSN-UIFASTBinding'
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> prefix [

	<ignoreForCoverage>
	^ #CSNUIFAST
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> submetamodels [

	^ { FASTJavaMetamodelGenerator. BLLayoutMetamodelGenerator }
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineClasses [
	super defineClasses.
	action := self remoteEntity: #Action withPrefix: #BL.
	javaMethod := self remoteEntity: #JavaMethodEntity withPrefix: #FAST 
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
