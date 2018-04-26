*BL-Model-Exporter-Angular
getLocalPath
	" return   pageMetierName/pageMetierName.component"

	^ (self container at: 1) getLocalPath , '/components/' , self getAcceptedName