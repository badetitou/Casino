Extension { #name : #FAMIXMethod }

{ #category : #'*Casino-Behavior-Model-Exporter-Angular' }
FAMIXMethod >> uniqueName [ 
	^ self name, self mooseID asString
]
