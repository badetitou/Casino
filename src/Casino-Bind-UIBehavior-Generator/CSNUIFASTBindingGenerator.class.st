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
	^ #CSNBind
]

{ #category : #accessing }
CSNUIFASTBindingGenerator class >> submetamodels [

	^ { FASTJavaMetamodelGenerator. CSNLayoutMetamodelGenerator }
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineClasses [
	super defineClasses.
	action := self remoteEntity: #Action withPrefix: #CSN.
	javaMethod := self remoteEntity: #JavaMethodEntity withPrefix: #FAST 
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineRelations [
	super defineRelations.
	(action property: #behavior) -* (javaMethod property: #ui).
]
