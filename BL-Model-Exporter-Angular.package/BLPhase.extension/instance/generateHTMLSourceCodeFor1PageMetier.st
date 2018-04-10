*BL-Model-Exporter-Angular
generateHTMLSourceCodeFor1PageMetier
	^ '<bl-phase-business-page-container>
        <bl-phase-business-page-header>
            header actions
        </bl-phase-business-page-header>

        <bl-phase-business-page id="P1" title="Page 1">
' , (self metiers at: 1) getTag, 
			'
        </bl-phase-business-page>
    </bl-phase-business-page-container>'