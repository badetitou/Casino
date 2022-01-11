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
		'onSubmitSuccess',
		'onFocus',
		'onLoad',
		'onOver',
		'onOut',
		'onBlur',
		'onKeyup',
		'onMouseout',
		'onKeydown',
		'onKeypress',
		'onDoubleclick',
		'onMouseup',
		'onDrop',
		'onMousemove'
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

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForAsynchroneCall [
	
	^  'I represent an asynchrone call to a distant service'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForCall [
	^ 'I represent an abstract call to a distant service
	
Since I''m abstract, I should not be instanciate (but, it is a reasonnable solution if you don''t know witch call instanciate)'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForDOMElementAccess [
	^ 'Access to a DOM element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForNavigation [
	^ 'I represent a special call that lead to the navigation to another page of the application'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnBlur [
	^ 'Event is fired when a dom element lose the focus'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnChange [
	^ 'Should happen when the change event is fired'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnClick [
	^ 'Should happen when the click event is fired'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnDoubleclick [
	^ 'Execute a JavaScript when an element is double-clicked'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnDrop [
	^ 'Is fired when an element is drop on the element having the action'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnError [
	^ 'Should happen when the error event is fired'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnFocus [
	^ 'When the user focus on an element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnKeydown [
	^ 'Execute a JavaScript when a user is pressing a key'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnKeypress [
	^ 'Execute a JavaScript when a user presses a key'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnKeyup [
	^ 'Execute when a keypress is finished.'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnLoad [
	^ 'Is fired when a page and all its components is loaded'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnMousemove [
	^ 'Execute a JavaScript when releasing a mouse move over an element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnMouseout [
	^ 'Triggered when the mouse pointer is moved out of the element.'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnMouseup [
	^ 'Execute a JavaScript when releasing a mouse button over an element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnOut [
	^ 'Event is fired when the mouse leave the DOM element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnOver [
	^ 'Event is fired when the mouse is over the dom element'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnSubmit [
	^ 'Should happen when the submit event is fired (on a form)'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOnSubmitSuccess [
	^ 'Should happen when the submitSucess event is fired (on a form)
(when a submit has correcly proceed)'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForOpenDialog [
	^ 'I represent a call which will create a dialog with the data as inside it (it corresponds most of the time to a String, but it can change)'
]

{ #category : #comments }
CSNBehaviorModelGenerator >> commentForPopUp [
	^ 'I represent a call which will create a pop up with the data as inside it (it corresponds most of the time to a String, but it can change)'
]

{ #category : #comments }
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
	expression := self remoteTrait: #TExpression withPrefix: #FAST.
	fastBehaviouralEntity := self remoteTrait: #TBehaviouralEntity withPrefix: #FAST.
	statement := self remoteTrait: #TStatement withPrefix: #FAST.
	
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
	onSubmitSuccess := builder newClassNamed: #OnSubmitSuccess comment: self commentForOnSubmitSuccess.
	onFocus := builder newClassNamed: #OnFocus comment: self commentForOnFocus.
	onLoad := builder newClassNamed: #OnLoad comment: self commentForOnLoad.
	onOver := builder newClassNamed: #OnOver comment: self commentForOnOver.
	onOut := builder newClassNamed: #OnOut comment: self commentForOnOut.
	onBlur := builder newClassNamed: #OnBlur comment: self commentForOnBlur.
	onKeyup := builder newClassNamed: #OnKeyup comment: self commentForOnKeyup.
	onMouseout := builder newClassNamed: #OnMouseout comment: self commentForOnMouseout.
	onKeydown := builder newClassNamed: #OnKeydown comment: self commentForOnKeydown.
	onKeypress := builder newClassNamed: #OnKeypress comment: self commentForOnKeypress.
	onDoubleclick := builder newClassNamed: #OnDoubleclick comment: self commentForOnDoubleclick.
	onMouseup := builder newClassNamed: #OnMouseup comment: self commentForOnMouseup.
	onDrop := builder newClassNamed: #OnDrop comment: self commentForOnDrop.
	onMousemove := builder newClassNamed: #OnMousemove comment: self commentForOnMousemove
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
	onSubmitSuccess --|> action.
	onFocus --|> action.
	onLoad --|> action.
	onOver --|> action.
	onOut --|> action.
	onBlur --|> action.
	onKeyup --|> action.
	onMouseout --|> action.
	onMouseup --|> action.	
	onKeydown --|> action.
	onKeypress --|> action.
	onDoubleclick --|> action.
	onDrop --|> action.
	onMousemove --|> action
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineRelations [
	super defineRelations.
	((navigation property: #arguments)
	 <>-* (expression property: #navigation)).
	(((call property: #onSuccess) comment:
		  'The statement executed if the call return ''ok''')
	 <>- (fastBehaviouralEntity property: #carrefourOnSuccessOwner)).
	(((call property: #onFailure) comment:
		  'The statement executed if the call return ''ko''')
	 <>- (fastBehaviouralEntity property: #carrefourOnFailureOwner)).
	(((popUp property: #data) comment:
		  'The data that will be displayed in the popUp')
	 <>- (expression property: #carrefourPopUpOwner)).
		
	(action property: #behavior) *-* (fastBehaviouralEntity property: #ui).
	(navigation property: #page) *- (page property: #navigations).
	(serviceAPI property: #callers) -* (call property: #distantService).
	(openDialog property: #dialog) *- (cwDialog property: #opener).
	(domElementAcccess property: #widget) *- (csnWidget property: #behavioralAccess).
	(accessElementAttribute property: #attribute) *- (csnAttribute property: #behavioralAccess)
]
