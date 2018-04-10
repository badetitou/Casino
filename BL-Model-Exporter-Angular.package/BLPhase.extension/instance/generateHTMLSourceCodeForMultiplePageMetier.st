*BL-Model-Exporter-Angular
generateHTMLSourceCodeForMultiplePageMetier
	| text |
	text := '<bl-phase-business-pages-tab-container (tabSelected)="onTabSelected($event)">
        <bl-phase-business-pages-tab-header>
            <div class="save-action">
                <div class="cursor-pointer" (click)="save()">
                    <bl-icon icon="save"></bl-icon>
                </div>
            </div>
        </bl-phase-business-pages-tab-header>'.
	self metiers
		do: [ :metier | 
			text := text , ' <bl-phase-business-page-tab id="P1" title="Page 1" (tabSelected)="onTabSelected(1)">	' , String crlf
				, metier getTag , String crlf , '</bl-phase-business-page-tab>', String crlf ].
	text := text , '</bl-phase-business-pages-tab-container>'.
	^ text