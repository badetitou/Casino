*BL-Model-Exporter-Angular
getMetadata
	" asString :
{ 
    id: 'phase1_2',
    code: 'phase1',
    label: 'Phase 1 - 2',
    link: 'phase1',
    subLabel: 'Bienvenue sur la phase 1 - 2',
    icon: 'address-book',
    datas: {'text': '2'}
}
   "

	^ '{
    id: ''' , self name ,''',
    code: ''' , self name,''',
    label: ''' , self title protectQuote ,''',
    link: ''' , self name,''',
    subLabel: ''' , self subtitle protectQuote, ''',
    icon: ''address-book'',
    datas: {},
}'