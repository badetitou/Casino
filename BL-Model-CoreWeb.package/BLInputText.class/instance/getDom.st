testing
getDom
	^ '<span class="ui-float-label">
    <input id="float-' , self mooseID asString
		,
			'" type="text" size="30" pInputText> 
    <label for="float-' , self mooseID asString
		,
			'">', text, '</label>
</span>'