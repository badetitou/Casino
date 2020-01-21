Class {
	#name : #CSNBehaviorPatternOpenDialog,
	#superclass : #CSNBehaviorPattern,
	#category : #'Casino-Behavior-Model-Importer-Java-Pattern'
}

{ #category : #running }
CSNBehaviorPatternOpenDialog >> newOpenDialog: aDialog [
	^ self model silentlyAdd: CSNBOpenDialog new
]

{ #category : #running }
CSNBehaviorPatternOpenDialog >> run [
	(self model allWithSubTypesOf: FASTJavaMethodInvocation)
		asOrderedCollection
		select: [ :invocation | 
			invocation name = 'show' and: [ 
				(self uiModel allWithSubTypesOf: CSNUICWDialog) anySatisfy: [ 
					:dialog |
					dialog affectedActions = invocation receiver famixVariable ] ] ]
		thenDo: [ :invocation | 
			| dialog openDialog parent  |
			dialog := (self uiModel allWithSubTypesOf: CSNUICWDialog) detect: [ 
				          :testDialog | 
				          testDialog affectedActions
				          = invocation receiver famixVariable ].
			openDialog := self newOpenDialog: dialog.
			openDialog dialog: dialog.
			parent := invocation parentNode.
			invocation removeAllPotentialParentNode.
			parent expression: openDialog.
			 ]
]
