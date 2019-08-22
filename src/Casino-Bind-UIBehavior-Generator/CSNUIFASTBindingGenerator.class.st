Class {
	#name : #CSNUIFASTBindingGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'action',
		'javaMethod',
		'navigation',
		'page',
		'serviceAPI',
		'call'
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

	^ { FASTJavaMetamodelGenerator. CSNMetamodelGenerator .CSNLayoutMetamodelGenerator. CSNBehaviorModelGenerator }
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineClasses [
	super defineClasses.
	action := self remoteEntity: #Action withPrefix: #CSN.
	javaMethod := self remoteEntity: #MethodEntity withPrefix: #FASTJava.
	navigation := self remoteEntity: #Navigation withPrefix: #CSNB.
	page := self remoteEntity: #Page withPrefix: #CSN.
	serviceAPI := self remoteEntity: #ServiceAPI withPrefix: #CSN.
	call := self remoteEntity: #Call withPrefix: #CSNB.
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineRelations [
	super defineRelations.
	(action property: #behavior) -* (javaMethod property: #ui).
	(navigation property: #page) *- (page property: #navigations).
	(serviceAPI property: #callers) -* (call property: #distantService)
]
