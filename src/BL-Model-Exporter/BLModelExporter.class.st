Class {
	#name : #BLModelExporter,
	#superclass : #Object,
	#instVars : [
		'model',
		'root'
	],
	#category : 'BL-Model-Exporter'
}

{ #category : #actions }
BLModelExporter class >> export: aBLMooseModel [
	self new model: aBLMooseModel; export
]

{ #category : #run }
BLModelExporter >> export [
	self prepareExport.
	self visit: model.
	self postExport 
]

{ #category : #accessing }
BLModelExporter >> model [
	^ model
]

{ #category : #accessing }
BLModelExporter >> model: anObject [
	model := anObject
]

{ #category : #run }
BLModelExporter >> postExport [
	"can do something here"
]

{ #category : #api }
BLModelExporter >> prepareExport [
	"can be override"
]

{ #category : #accessing }
BLModelExporter >> root [
	^ root
]

{ #category : #visiting }
BLModelExporter >> visit: anElement [
	^ anElement accept: self
]

{ #category : #visiting }
BLModelExporter >> visitBLOriginedEntity: anElement [
	anElement prepareAcceptFor: self.
	anElement writeCodeWith: self.
	anElement visitSuccessorWith: self 
]

{ #category : #visiting }
BLModelExporter >> visitBLPageMetier: aBLPageMetier [
	^ self visitBLOriginedEntity: aBLPageMetier 
]

{ #category : #visiting }
BLModelExporter >> visitBLPhase: aBLPhase [
	^ self visitBLOriginedEntity: aBLPhase 
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading1: aBLUIHeading1 [
	^ self visitBLWidget: aBLUIHeading1
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading2: aBLUIHeading2 [
	^ self visitBLWidget: aBLUIHeading2
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading3: aBLUIHeading3 [
	^ self visitBLWidget: aBLUIHeading3
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading4: aBLUIHeading4 [
	^ self visitBLWidget: aBLUIHeading4
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading5: aBLUIHeading5 [
	^ self visitBLWidget: aBLUIHeading5
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIHeading6: aBLUIHeading6 [
	^ self visitBLWidget: aBLUIHeading6
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIImage: aBLUIImage [
	^ self visitBLWidget: aBLUIImage
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInput: aBLUIInput [
	^ self visitBLWidget: aBLUIInput
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputButton: aBLUIInputButton [
	^ self visitBLWidget: aBLUIInputButton
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputCheckbox: aBLUIInputCheckbox [
	^ self visitBLWidget: aBLUIInputCheckbox
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputColor: aBLUIInputColor [
	^ self visitBLWidget: aBLUIInputColor
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputDate: aBLUIInputDate [
	^ self visitBLWidget: aBLUIInputDate
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputDatetimeLocal: aBLUIInputDatetimeLocal [
	^ self visitBLWidget: aBLUIInputDatetimeLocal
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputEmail: aBLUIInputEmail [
	^ self visitBLWidget: aBLUIInputEmail
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputFile: aBLUIInputFile [
	^ self visitBLWidget: aBLUIInputFile
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputMonth: aBLUIInputMonth [
	^ self visitBLWidget: aBLUIInputMonth
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputNumber: aBLUIInputNumber [
	^ self visitBLWidget: aBLUIInputNumber
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputPassword: aBLUIInputPassword [
	^ self visitBLWidget: aBLUIInputPassword
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputRadio: aBLUIInputRadio [
	^ self visitBLWidget: aBLUIInputRadio
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputRange: aBLUIInputRange [
	^ self visitBLWidget: aBLUIInputRange
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputReset: aBLUIInputReset [
	^ self visitBLWidget: aBLUIInputReset
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputSearch: aBLUIInputSearch [
	^ self visitBLWidget: aBLUIInputSearch
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputSubmit: aBLUIInputSubmit [
	^ self visitBLWidget: aBLUIInputSubmit
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputTel: aBLUIInputTel [
	^ self visitBLWidget: aBLUIInputTel
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputText: aBLUIInputText [
	^ self visitBLWidget: aBLUIInputText
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputTime: aBLUIInputTime [
	^ self visitBLWidget: aBLUIInputTime
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputUrl: aBLUIInputUrl [
	^ self visitBLWidget: aBLUIInputUrl
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIInputWeek: aBLUIInputWeek [
	^ self visitBLWidget: aBLUIInputWeek
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUILink: aBLUILink [
	^ self visitBLWidget: aBLUILink
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIList: aBLUIList [
	^ self visitBLWidget: aBLUIList
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIOrderedList: aBLUIOrderedList [
	^ self visitBLWidget: aBLUIOrderedList
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIParagraph: aBLUIParagraph [
	^ self visitBLWidget: aBLUIParagraph
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITable: aBLUITable [
	^ self visitBLWidget: aBLUITable
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUITextarea: aBLUITextarea [
	^ self visitBLWidget: aBLUITextarea
]

{ #category : #'as yet unclassified' }
BLModelExporter >> visitBLUIUnorderedList: aBLUIUnorderedList [
	^ self visitBLWidget: aBLUIUnorderedList
]

{ #category : #visiting }
BLModelExporter >> visitBLWidget: aBLPhase [
	^ self visitBLOriginedEntity: aBLPhase 
]

{ #category : #visiting }
BLModelExporter >> visitMooseModel: aMooseModel [
	self subclassResponsibility 
]
