"
I return the class methods you give to me as the source code of thoses methods commented
"
Class {
	#name : #BLMoulinetteNullStrategy,
	#superclass : #BLMoulinetteStrategy,
	#category : #'BL-Model-Extension'
}

{ #category : #'as yet unclassified' }
BLMoulinetteNullStrategy >> convertCodeMetierModelTo: aFAMIXClass [
	^ aFAMIXClass "methods collect: [ :method | method" sourceText replaceAllRegex: '\*/' with: '//'", String crlf ]"
]

{ #category : #'as yet unclassified' }
BLMoulinetteNullStrategy >> convertFAMIXClassToCodeMetierModel: aFAMIXClass [
	^ aFAMIXClass "methods collect: [ :method | method" sourceText replaceAllRegex: '\*/' with: '//'", String crlf ]"
]
