Extension { #name : #CSNUIInputRadio }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputRadio >> angularComponent [
	"^ MCRadioButton "
	^ CSNELCWBLRadioComponent
]

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNUIInputRadio >> computeSelfAttributes [
	^ {self attributes. self getPositionAttribute. {self generateDefaultClassAttribute}. self containedElementAttribute } flattened asOrderedCollection 
]
