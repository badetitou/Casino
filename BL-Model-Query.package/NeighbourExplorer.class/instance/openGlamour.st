accessing
openGlamour
	^ GLMCompositePresentation new tabulator
		with: [ :t | 
			t
				column: #index;
				column: #details.
			t transmit
				to: #index;
				andShow: [ :composite | 
					composite list
						title: 'Phase';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #details;
				andShow: [ :composite | 
					composite roassal2
						title: 'Neighbour';
						initializeView: [ RTMondrian new ];
						painting: [ :view :aBLPhase |  self viewNeighbourOf: aBLPhase toRTMondrian: view ] ] ];
		title: 'Neighbour Explorer';
		openOn: self model allBLPhase