Class {
	#name : #CSNUIFASTBindingGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'action',
		'javaMethod',
		'navigation',
		'page',
		'serviceAPI',
		'call',
		'openDialog',
		'cwDialog'
	],
	#category : #'Casino-Bind-UIBehavior-Generator'
}

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
	^ { 
		  FASTJavaMetamodelGenerator.
		  CSNMetamodelGenerator.
		  CSNLayoutMetamodelGenerator.
		  CSNBehaviorModelGenerator.
		  CSNUICoreWebGenerator }
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
	
	openDialog := self remoteEntity: #OpenDialog withPrefix: #CSNB.
	cwDialog := self remoteEntity: #Dialog withPrefix: #CSNUICW.
]

{ #category : #definition }
CSNUIFASTBindingGenerator >> defineRelations [
	super defineRelations.
	(action property: #behavior) -* (javaMethod property: #ui).
	(navigation property: #page) *- (page property: #navigations).
	(serviceAPI property: #callers) -* (call property: #distantService).
	
	(openDialog property: #dialog) *- (cwDialog property: #opener).
]
