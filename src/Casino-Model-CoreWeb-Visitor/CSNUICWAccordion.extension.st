Extension { #name : #CSNUICWAccordion }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWAccordion >> accept: aVisitor [
	^ aVisitor visitCSNUICWAccordion: self
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWAccordion class >> accept: aVisitor [
	^ aVisitor visitCSNUICWAccordion: self
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWAccordion >> addWidget: aWidget withInvocationOfAdd: anInvocation usingFactory: aFactory [

	super
		addWidget: aWidget
		withInvocationOfAdd: anInvocation
		usingFactory: aFactory.
	anInvocation parameters size >= 2 ifTrue: [ 
		aWidget addAttribute: ((aFactory create: CSNUITitle)
				 attributeValue: (anInvocation parameters at: 2);
				 yourself) ]
]
