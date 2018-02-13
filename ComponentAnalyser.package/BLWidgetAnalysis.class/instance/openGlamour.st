glamour
openGlamour
	^GLMCompositePresentation new tabulator 
	with: [ :t |
		t column: #index; column: #details.
		t transmit to: #index; andShow: [ :composite | 
			composite list 
				title: 'Widgets';
				format: [:each | each name]].
			t transmit from: #index; to: #details; andShow: [ :composite |
			composite roassal2
				title: 'Adherence App-Core';
				initializeView: [ RTMondrian new ];
				painting: [ :view :class | 
					 (self viewReferencesToCoreMixMethodForClassMatch: '*',class name,'*' toGl: view).
					]. 
			composite roassal2
				title: 'Adherence Core-GWT';
				initializeView: [ RTMondrian new ];
				painting: [ :view :class | 
					 (self viewReferencesCoreToGWTRelativeColorForClassMatch: '*',class name,'*' toGl: view).
					]. 
			] ];
	title: 'Widget Adherences'; 
	openOn: (self modelWidget).