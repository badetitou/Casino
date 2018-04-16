*BL-Model-Exporter-Angular
generateHTMLSourceCodeDependOfPageMetier
	self hasMultiplePageMetier
		ifTrue: [ ^ self generateHTMLSourceCodeForMultiplePageMetier ].
	^ self generateHTMLSourceCodeFor1PageMetier