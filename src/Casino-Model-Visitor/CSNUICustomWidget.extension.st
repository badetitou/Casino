Extension { #name : #CSNUICustomWidget }

{ #category : #'*Casino-Model-Visitor' }
CSNUICustomWidget >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUICustomWidget: self
]
