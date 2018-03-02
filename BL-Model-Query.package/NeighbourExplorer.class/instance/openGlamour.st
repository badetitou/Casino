accessing
openGlamour
	^ GLMCompositePresentation new tabulator
		with: [ :t | 
			t
				row: [ :r | 
					r
						column: #index;
						column: #neighbour ].
			t row: [ :r | r column: #details ].
			t transmit
				to: #index;
				andShow: [ :composite | 
					composite list
						title: 'Phase';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #neighbour;
				andShow: [ :composite | 
					composite roassal2
						title: 'Neighbour';
						initializeView: [ RTMondrian new ];
						painting: [ :view :aBLPhase | self viewNeighbourOf: aBLPhase toRTMondrian: view ] ].
			t transmit
				from: #neighbour;
				to: #details;
				andShow: [ :composite | 
					composite text
						title: 'Details';
						display: [ :blEl | blEl asString ] ] ];
		title: 'Neighbour Explorer';
		openOn: self model allBLPhase