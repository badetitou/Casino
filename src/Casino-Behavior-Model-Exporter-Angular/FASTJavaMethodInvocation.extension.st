Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*Casino-Behavior-Model-Exporter-Angular' }
FASTJavaMethodInvocation >> uniqueName [ 
	^ ((self famix isNotNil and: [ self famix candidates anyOne fast isNotNil ]) ifTrue: [ self famix candidates anyOne uniqueName ] ifFalse: [ self name ] )
]

{ #category : #'*Casino-Behavior-Model-Exporter-Angular' }
FASTJavaMethodInvocation >> uniqueNameInPage: aPage [
	^ (self famix isNotNil and: [ self famix candidates anyOne fast isNotNil ])
		ifTrue: [ self famix candidates anyOne uniqueNameInPage: aPage ]
		ifFalse: [ self name ]
]
