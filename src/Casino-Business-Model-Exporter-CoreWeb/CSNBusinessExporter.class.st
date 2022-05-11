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
CSNBusinessExporter >> barrelName [
	^ 'index.ts'
]

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

	self modelRoot / self barrelName writeStreamDo: [ :barrelStream | 
		self writeBarrelCommentOn: barrelStream.
		((aCSNBuModel allWithSubTypesOf: CSNBuBusinessType) asArray sorted:
			 #name ascending) do: [ :businessType | 
			self exportBusinessType: businessType.
			barrelStream << 'export * from ''./dto/' << businessType name
			<< '.model'';'.
			barrelStream crlf ] ]
]

{ #category : #accessing }
CSNBusinessExporter >> exportBusinessType: businessType [

	(self modelRoot / 'dto') ensureCreateDirectory.
	^ (self modelRoot / 'dto' / businessType name , 'model.ts')
		  deleteIfAbsent: nil;
		  writeStreamDo: [ :stream | 
			  self businessTypeExporter currentWriteStream: stream.
			  self businessTypeExporter exportBusinessType: businessType ]
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

{ #category : #accessing }
CSNBusinessExporter >> writeBarrelCommentOn: barrelStream [
	barrelStream
		<<
			'/**
 * @author Benoit Verhaeghe
 *
 * Until we fixed the problem of dependency please use this file to import the DTO
 **/

'
]
