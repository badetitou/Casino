Class {
	#name : #BLWidgetDialogCanHandleTest,
	#superclass : #BLWidgetCanHandleTest,
	#category : #'BL-Model-CoreWeb-Importer-Tests'
}

{ #category : #running }
BLWidgetDialogCanHandleTest >> generatedModelClass [
	"Change if specific widget exist"
	^ BLDialog 
]

{ #category : #running }
BLWidgetDialogCanHandleTest >> javaClassName [
	^ #BLDialogBox
]
