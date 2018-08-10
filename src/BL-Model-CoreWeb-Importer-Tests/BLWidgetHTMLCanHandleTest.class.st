Class {
	#name : #BLWidgetHTMLCanHandleTest,
	#superclass : #BLWidgetCanHandleTest,
	#category : #'BL-Model-CoreWeb-Importer-Tests'
}

{ #category : #running }
BLWidgetHTMLCanHandleTest >> generatedModelClass [
	"Change if specific widget exist"
	^ BLHTML 
]

{ #category : #running }
BLWidgetHTMLCanHandleTest >> javaClassName [
	^ #HTML
]
