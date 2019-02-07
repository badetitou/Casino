Class {
	#name : #CSNBehaviorModelGenerator,
	#superclass : #FASTMetamodelGenerator,
	#instVars : [
		'navigation',
		'call',
		'asynchroneCall',
		'synchroneCall'
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
CSNBehaviorModelGenerator >> commentForNavigation [
	^ 'I represent a special call that lead to the navigation to another page of the application'
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
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineHierarchy [
	super defineHierarchy.
	navigation --|> expression.
	call --|> expression.
	asynchroneCall --|> call.
	synchroneCall --|> call.
]

{ #category : #definition }
CSNBehaviorModelGenerator >> defineProperties [
	super defineProperties.
	self flag: 'This is a temporary property... I should be replace in the futur by a link to the business model'.
	(call property: #distantService type: #String) comment: 'The link to service I call'.
	
	"because we do not want to break the container thing".
	(call property: #onSuccess type: #CSNBStatement) comment: 'The statement executed if the call return ''ok'''.
	
	(call property: #onFailure type: #CSNBStatement) comment: 'The statement executed if the call return ''ko'''
]
