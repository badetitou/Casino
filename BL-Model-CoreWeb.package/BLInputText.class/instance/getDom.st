testing
getDom
	^ '<input id="float-' , self mooseID asString , '" type="text" value="' , value
		,
			'" placeholder="', text,'" pInputText>'