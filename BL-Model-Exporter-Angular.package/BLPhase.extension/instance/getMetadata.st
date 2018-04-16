*BL-Model-Exporter-Angular
getMetadata
	" asString : 
        id: 'phase1_2',
        code: 'phase1',
        label: 'Phase 1 - 2',
        link: 'phase1',
        subLabel: 'Bienvenue sur la phase 1 - 2',
        icon: 'address-book',
        datas: {'text': '2'}
   "

	^ 'id: ''' , self name , ''',' , String crlf , 'code: ''' , self name , ''','
		, String crlf , 'label: '''',' , String crlf , 'link: ''' , self name , ''','
		, String crlf , 'subLabel: '''',' , String crlf , 'icon: ''address-book'','
		, String crlf , 'datas: {},' , String crlf