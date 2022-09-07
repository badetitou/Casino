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

	(self modelRoot / self barrelName)
		deleteIfAbsent: nil;
		writeStreamDo: [ :barrelStream | 
			| toExport exported |
			toExport := aCSNBuModel allWithSubTypesOf: CSNBuBusinessType.
			exported := Set new: toExport size.
			self writeBarrelCommentOn: barrelStream.
			(toExport sorted: [ :e1 :e2 | e1 name < e2 name ]) do: [ :buType | 
					(exported includes: buType) ifFalse: [ "recursively export buType's hierarchy, starting from the root"
							| root export |
							root := buType.
							[ root parent isNil ] whileFalse: [ root := root parent ].
							export := [ :businessType | 
							          self exportBusinessType: businessType.
							          barrelStream crlf.
							          barrelStream << 'export * from ''./dto/'
							          << businessType name << '.model'';'.
							          exported add: businessType.
							          businessType children do: export ].
							export value: root.
							barrelStream crlf ] ] ]
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

{ #category : #initialization }
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
