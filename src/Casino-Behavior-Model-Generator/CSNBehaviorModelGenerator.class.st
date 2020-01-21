Class {
	#name : #CSNBehaviorModelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'navigation',
		'call',
		'asynchroneCall',
		'synchroneCall',
		'expression',
		'popUp',
		'page',
		'fastBehaviouralEntity',
		'statement',
		'openDialog',
		'domElementAcccess',
		'action',
		'javaMethod',
		'serviceAPI',
		'cwDialog',
		'csnWidget'
	],
	#category : #'Casino-Behavior-Model-Generator'
}

{ #category : #accessing }
CSNBehaviorModelGenerator class >> packageName [

	^ #'Casino-Behavior-Model'
]

{ #category : #accessing }
CSNBehaviorModelGenerator class >> prefix [
	^ #CSNB
]

{ #category : #accessing }
CSNBehaviorModelGenerator class >> submetamodels [
	^ { 
		  FASTMetamodelGenerator.
		  FASTJavaMetamodelGenerator.
		  CSNLayoutMetamodelGenerator.
		  CSNMetamodelGenerator.
		  CSNUICoreWebGenerator }
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForAsynchroneCall [
	
	^  'I represent an asynchrone call to a distant service'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForCall [
	^ 'I represent an abstract call to a distant service
	
Since I''m abstract, I should not be instanciate (but, it is a reasonnable solution if you don''t know witch call instanciate)'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForDOMElementAccess [
	^ 'Access to a DOM element'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForNavigation [
	^ 'I represent a special call that lead to the navigation to another page of the application'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForOpenDialog [
	^ 'I represent a call which will create a dialog with the data as inside it (it corresponds most of the time to a String, but it can change)'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForPopUp [
	^ 'I represent a call which will create a pop up with the data as inside it (it corresponds most of the time to a String, but it can change)'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForSynchroneCall [
	
	^  'I represent an Synchrone call (normal call) to a distant service'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineClasses [
	super defineClasses.
	navigation := builder newClassNamed: #Navigation comment: self commentForNavigation.
	call := builder newClassNamed: #Call comment: self commentForCall.
	asynchroneCall  := builder newClassNamed: #AsynchroneCall comment: self commentForAsynchroneCall.
	synchroneCall  := builder newClassNamed: #SynchroneCall comment: self commentForSynchroneCall.
	popUp := builder newClassNamed: #PopUp comment: self commentForPopUp.
	openDialog := builder newClassNamed: #OpenDialog comment: self commentForOpenDialog.
	domElementAcccess := builder newClassNamed: #DOMElementAcccess comment: self commentForDOMElementAccess.
	expression := self remoteEntity: #Expression withPrefix: #FAST.
	fastBehaviouralEntity := self remoteEntity: #BehaviouralEntity withPrefix: #FAST.
	statement := self remoteEntity: #Statement withPrefix: #FAST.
	
	action := self remoteEntity: #Action withPrefix: #CSN.
	csnWidget := self remoteEntity: #Widget withPrefix: #CSN.
	javaMethod := self remoteEntity: #MethodEntity withPrefix: #FASTJava.
	page := self remoteEntity: #Page withPrefix: #CSN.
	serviceAPI := self remoteEntity: #ServiceAPI withPrefix: #CSN.

	cwDialog := self remoteEntity: #Dialog withPrefix: #CSNUICW.
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineHierarchy [
	super defineHierarchy.
	navigation --|> expression.
	call --|> expression.
	asynchroneCall --|> call.
	synchroneCall --|> call.
	popUp --|> expression.
	openDialog --|> expression.
	domElementAcccess --|> expression.
	domElementAcccess --|> #TReceiver
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineRelations [
	super defineRelations.
	((navigation property: #arguments)
	 <>-* (expression property: #navigation)) withoutPrimaryContainer.
	(((call property: #onSuccess) comment:
		  'The statement executed if the call return ''ok''')
	 <>- (fastBehaviouralEntity property: #carrefourOnSuccessOwner))
		withoutPrimaryContainer.
	(((call property: #onFailure) comment:
		  'The statement executed if the call return ''ko''')
	 <>- (fastBehaviouralEntity property: #carrefourOnFailureOwner))
		withoutPrimaryContainer.
	(((popUp property: #data) comment:
		  'The data that will be displayed in the popUp')
	 <>- (expression property: #carrefourPopUpOwner))
		withoutPrimaryContainer.
		
	(action property: #behavior) -* (javaMethod property: #ui).
	(navigation property: #page) *- (page property: #navigations).
	(serviceAPI property: #callers) -* (call property: #distantService).
	(openDialog property: #dialog) *- (cwDialog property: #opener).
	(domElementAcccess property: #widget) *- (csnWidget property: #behavioralAccess)
]
