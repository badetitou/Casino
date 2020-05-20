Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Extension' }
CSNAction >> gtCallerBehavior: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite tabulator
		title: 'Caller -> behavior';
		with: [ :browser | 
			browser
				row: #caller size: 100;
				row: #evaluator.
			browser transmit
				to: #caller;
				andShow: [ :a | 
					a text
						format: self caller name;
						yourself ].
			browser transmit
				to: #evaluator;
				andShow: [ :a | 
					a text
						format: self sources anyOne sourceAnchor completeText;
						initialize: [ :presentation |  presentation selectionInterval: (self sources anyOne sourceAnchor intervalAsCharPos) ];
						withLineNumbers: true;
						yourself ] ];
		yourself
]

{ #category : #'*Casino-Model-Extension' }
CSNAction >> isAction [
	^ true
]

{ #category : #'*Casino-Model-Extension' }
CSNAction >> isActionAppel [
	^ false
]

{ #category : #'*Casino-Model-Extension' }
CSNAction >> isActionService [
	^ false
]
