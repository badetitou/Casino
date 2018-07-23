Class {
	#name : #BLWidgetFlexTableCanHandleTest,
	#superclass : #BLWidgetCanHandleTest,
	#category : #'BL-Model-CoreWeb-Importer-Tests'
}

{ #category : #running }
BLWidgetFlexTableCanHandleTest >> generatedModelClass [
	"Change if specific widget exist"
	^ BLGrid  
]

{ #category : #running }
BLWidgetFlexTableCanHandleTest >> javaClassName [
	^ #BLFlexTable
]
