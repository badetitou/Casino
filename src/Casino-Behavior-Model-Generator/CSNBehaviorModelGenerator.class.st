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
		'serviceAPI',
		'cwDialog',
		'csnWidget',
		'setElementAttribute',
		'csnAttribute',
		'javaMethodInvocation',
		'accessElementAttribute',
		'getElementAttribute',
		'onChange',
		'onClick',
		'onError',
		'onSubmit',
		'onSubmitSuccess'
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
CSNBehaviorModelGenerator >> commentForOnChange [
	^ 'Should happen when the change event is fired'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForOnClick [
	^ 'Should happen when the click event is fired'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForOnError [
	^ 'Should happen when the error event is fired'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForOnSubmit [
	^ 'Should happen when the submit event is fired (on a form)'
]

{ #category : #definition }
CSNBehaviorModelGenerator >> commentForOnSubmitSuccess [
	^ 'Should happen when the submitSucess event is fired (on a form)
(when a submit has correcly proceed)'
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
	"AST"
	navigation := builder newClassNamed: #Navigation comment: self commentForNavigation.
	call := builder newClassNamed: #Call comment: self commentForCall.
	asynchroneCall  := builder newClassNamed: #AsynchroneCall comment: self commentForAsynchroneCall.
	synchroneCall  := builder newClassNamed: #SynchroneCall comment: self commentForSynchroneCall.
	popUp := builder newClassNamed: #PopUp comment: self commentForPopUp.
	openDialog := builder newClassNamed: #OpenDialog comment: self commentForOpenDialog.
	domElementAcccess := builder newClassNamed: #DOMElementAcccess comment: self commentForDOMElementAccess.
	accessElementAttribute := builder newClassNamed: #AccessElementAttribute comment: 'access the attribute value of an element accessed'.
	setElementAttribute := builder newClassNamed: #SetElementAttribute comment: 'set the attribute value of an element accessed'.
	getElementAttribute := builder newClassNamed: #GetElementAttribute comment: 'set the attribute value of an element accessed'.
	expression := self remoteEntity: #Expression withPrefix: #FAST.
	fastBehaviouralEntity := self remoteEntity: #BehaviouralEntity withPrefix: #FAST.
	statement := self remoteEntity: #Statement withPrefix: #FAST.
	
	action := self remoteEntity: #Action withPrefix: #CSN.
	csnWidget := self remoteEntity: #Widget withPrefix: #CSN.
	csnAttribute := self remoteEntity: #Attribute withPrefix: #CSN.
	javaMethodInvocation := self remoteEntity: #MethodInvocation withPrefix: #FASTJava.
	page := self remoteEntity: #Page withPrefix: #CSN.
	serviceAPI := self remoteEntity: #ServiceAPI withPrefix: #CSN.

	cwDialog := self remoteEntity: #Dialog withPrefix: #CSNUICW.
	"Event"
	onChange := builder newClassNamed: #OnChange comment: self commentForOnChange.
	onClick := builder newClassNamed: #OnClick comment: self commentForOnClick.
	onError := builder newClassNamed: #OnError comment: self commentForOnError.
	onSubmit := builder newClassNamed: #OnSubmit comment: self commentForOnSubmit.
	onSubmitSuccess := builder newClassNamed: #OnSubmitSuccess comment: self commentForOnSubmitSuccess
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineHierarchy [
	super defineHierarchy.
	"AST"
	navigation --|> expression.
	call --|> expression.
	asynchroneCall --|> call.
	synchroneCall --|> call.
	popUp --|> expression.
	openDialog --|> expression.
	domElementAcccess --|> expression.
	domElementAcccess --|> #TReceiver.
	accessElementAttribute --|> javaMethodInvocation.
	getElementAttribute --|> accessElementAttribute.
	setElementAttribute --|> accessElementAttribute.
	"Event"
	onChange --|> action.
	onClick --|> action.
	onError --|> action.
	onSubmit --|> action.
	onSubmitSuccess --|> action
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
		
	(action property: #behavior) -* (fastBehaviouralEntity property: #ui).
	(navigation property: #page) *- (page property: #navigations).
	(serviceAPI property: #callers) -* (call property: #distantService).
	(openDialog property: #dialog) *- (cwDialog property: #opener).
	(domElementAcccess property: #widget) *- (csnWidget property: #behavioralAccess).
	(accessElementAttribute property: #attribute) *- (csnAttribute property: #behavioralAccess)
]
