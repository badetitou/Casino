*BL-Model-Exporter-Angular
generateHTMLSourceCodeDependOfPageMetier
	(self metiers size == 1) ifTrue: [ ^ self generateHTMLSourceCodeFor1PageMetier ].
	(self metiers size > 1) ifTrue: [ ^ self generateHTMLSourceCodeForMultiplePageMetier ].
	^ 'INDEX ONLY'