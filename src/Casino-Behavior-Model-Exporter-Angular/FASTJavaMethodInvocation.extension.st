Extension { #name : #FASTJavaMethodInvocation }

{ #category : #'*Casino-Behavior-Model-Exporter-Angular' }
FASTJavaMethodInvocation >> uniqueName [ 
	^ ((self famix isNotNil and: [ self famix candidates anyOne fast isNotNil ]) ifTrue: [ self famix candidates anyOne uniqueName ] ifFalse: [ self name ] )
]
