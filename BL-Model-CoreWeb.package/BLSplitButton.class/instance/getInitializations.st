as yet unclassified
getInitializations
	^ '        this.items' , self mooseID asString , ' = ['
		
		,
			(self widgets
				flatCollect: [ :widget | '            {label: ''' , (widget parameters at: #label) , '''},' , String crlf ])
		,'
        ];'