"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	reverseDic:		<Object>


    Implementation Points
"
Class {
	#name : #CSNBehaviorPatternDOMAccessGetAttribute,
	#superclass : #CSNBehaviorPattern,
	#instVars : [
		'canHandleVisitor'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #helper }
CSNBehaviorPatternDOMAccessGetAttribute class >> order [
	"allow to execute a pattern before another"
	^ 11
]

{ #category : #running }
CSNBehaviorPatternDOMAccessGetAttribute >> createGetAttribute: attributeType of: domAccess insteadOfInvocation: invocation [
	| elementAttribute |
	elementAttribute := self model add: (CSNBGetElementAttribute new
			                     receiver: domAccess;
			                     attribute:
				                     (self
					                      resolveAttribute: attributeType
					                      of: domAccess widget);
			                     startPos: invocation startPos;
			                     endPos: invocation endPos;
			                     yourself).
	invocation arguments do: [ :argument | 
		elementAttribute addArgument: argument ].
	invocation removeAllPotentialParentNode.
	^ elementAttribute
]

{ #category : #initialization }
CSNBehaviorPatternDOMAccessGetAttribute >> initialize [
	super initialize.
	canHandleVisitor := CSNModelCanHandleGetAttributeCoreWebVisitor new
]

{ #category : #running }
CSNBehaviorPatternDOMAccessGetAttribute >> resolveAttribute: attributeType of: widget [
	^ widget attributes
		  detect: [ :attribute | attribute isOfType: attributeType ]
		  ifNone: [ 
		  widget addAttribute: (self uiModel add: attributeType new) ]
]

{ #category : #running }
CSNBehaviorPatternDOMAccessGetAttribute >> run [
	(self model allWithType: CSNBDOMElementAcccess) asOrderedCollection
		select: [ :elementAccess | 
			(elementAccess parentNode isOfType: FASTJavaMethodInvocation) and: [ 
				elementAccess parentNode famixInvocation isNotNil ] ]
		thenDo: [ :elementAccess | 
			canHandleVisitor
				entity: elementAccess widget;
				source: elementAccess parentNode famixInvocation.
			CSNAttribute subclasses
				detect: [ :attributeType | attributeType accept: canHandleVisitor ]
				ifFound: [ :attributeType | 
					| getAttribute selector parentNode |
					selector := elementAccess parentNode currentParentSelector , ':'.
					parentNode := elementAccess parentNode parentNode.
					getAttribute := self
						                createGetAttribute: attributeType
						                of: elementAccess
						                insteadOfInvocation: elementAccess parentNode.
					getAttribute perform: selector withArguments: { parentNode }. ] ]
]
