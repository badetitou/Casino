Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Exporter-Angular' }
CSNContainer >> componentSubWidgetsUsing: anExporter [

	"I returned sub widgets in the sub component (for instance, not going inside dialog definition)"

	| widgs |
	widgs := (self widgets , (self layout
		           ifNotNil: [ :a | 
		           a cell collect: #widget thenReject: #isNil ]
		           ifNil: [ {  } ]) reject: [ :el | el = self ]) reject: [ 
		         :w | 
		         (anExporter angularRepresentationOf: w) isSubComponent: w ].

	^ { 
		  widgs.
		  (widgs collect: [ :w | w componentSubWidgetsUsing: anExporter ]) }
]
