*BL-Model-Exporter-Angular
generateHTMLSourceCodeForMultiplePageMetier
	| text id |
	id := 1.
	text := '<bl-phase-business-pages-tab-container (tabSelected)="onTabSelected($event)">
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer" (click)="save()">
                    <bl-icon icon="save"></bl-icon>
                </div>
            </div>
        </bl-phase-business-pages-tab-header>'.
	text := text
		,
			(self metiers
				flatCollect: [ :metier | 
					id := id + 1.
					' <bl-phase-business-page-tab id="P' , id asString , '" title="Page ' , id asString
						, '">	' , String crlf , metier getTag , String crlf
						, '</bl-phase-business-page-tab>' , String crlf ]).
	text := text , '</bl-phase-business-pages-tab-container>'.
	^ text