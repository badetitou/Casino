Extension { #name : #CSNUIWidgetLabel }

{ #category : #'*Casino-Model-Visitor' }
CSNUIWidgetLabel >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUIWidgetLabel: self
]
