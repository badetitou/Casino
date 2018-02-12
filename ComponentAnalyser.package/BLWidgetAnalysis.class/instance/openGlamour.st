glamour
openGlamour
	GLMCompositePresentation new tabulator
		with: [ :t | 
			t
				column: #index;
				column: #details.
			t transmit
				to: #index;
				andShow: [ :composite | 
					composite list
						title: 'Widgets';
						format: [ :each | each name ] ].
			t transmit
				from: #index;
				to: #details;
				andShow: [ :composite | 
					composite roassal2
						title: 'Adherence';
						initializeView: [ RTMondrian new ];
						painting:
								[ :view :class | self viewReferencesToCoreMixMethodForClassMatch: '*' , class name , '*' toGl: view ] ] ];
		title: 'Widget adherence';
		openOn: self modelWidget