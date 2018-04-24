*BL-Model-Exporter-Angular
generateHTMLSourceCodeDependOfPageMetier
	self hasMultiplePageMetier
		ifTrue: [ ^ self generateHTMLSourceCodeForMultiplePageMetier ].
	self hasNoPageMetier 
		ifTrue: [ self flag: #todo. ^'TODO' ].
	^ self generateHTMLSourceCodeFor1PageMetier