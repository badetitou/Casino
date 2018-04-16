*BL-Model-Exporter-Angular
generateHTMLSourceCode
	^ '<bl-phase-container>
	' , self generateHTMLSourceCodeDependOfPageMetier
		,
			'
</bl-phase-container>'