*BL-Model-Exporter-Angular
getLocalPath
	" return   pageMetierName/pageMetierName.component"

	^ (self container) getLocalPath , '/components/' , self getAcceptedName