accessing
linkWidgetToService
	^ self modelAsync
		collect: [ :asyncClass | 
			| to |
			to := (asyncClass belongsTo outgoingInvocations
				flatCollect: [ :b | 
					| candidates adding |
					candidates := ((b candidates at: 1) atScope: FAMIXClass) asOrderedCollection.
					candidates
						ifEmpty: [ {} ]
						ifNotEmpty: [ adding := (candidates at: 1) belongsTo.
							[ adding isNamespace ]
								whileFalse: [ candidates add: adding.
									adding := adding belongsTo ].
							self modelServices asOrderedCollection intersection: candidates ] ]) at: 1.
			Association new key: asyncClass value: to ]