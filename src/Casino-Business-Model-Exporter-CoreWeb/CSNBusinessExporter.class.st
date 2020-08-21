Class {
	#name : #CSNBusinessExporter,
	#superclass : #Object,
	#instVars : [
		'businessTypeExporter',
		'modelRoot'
	],
	#category : #'Casino-Business-Model-Exporter-CoreWeb'
}

{ #category : #accessing }
CSNBusinessExporter >> businessTypeExporter [
	^ businessTypeExporter
]

{ #category : #accessing }
CSNBusinessExporter >> businessTypeExporter: anObject [
	businessTypeExporter := anObject
]

{ #category : #accessing }
CSNBusinessExporter >> export: aCSNBuModel [
	(self modelRoot / 'dto') ensureCreateDirectory.
	(aCSNBuModel allWithSubTypesOf: CSNBuBusinessType)
		do: [ :businessType | 
			 self modelRoot / 'dto' / (businessType name , '.model.ts')
				writeStreamDo: [ :stream | 
					self businessTypeExporter currentWriteStream: stream.
					self businessTypeExporter exportBusinessType: businessType ] ]
]

{ #category : #accessing }
CSNBusinessExporter >> initialize [
	super initialize.
	self businessTypeExporter: CSNBuModelExporter new
]

{ #category : #accessing }
CSNBusinessExporter >> modelRoot [
	^ modelRoot
]

{ #category : #accessing }
CSNBusinessExporter >> modelRoot: anObject [
	modelRoot := anObject
]
