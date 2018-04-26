*BL-Model-Exporter-Angular
getLocalComponentPath
	" return pageMetierName/pageMetierName.component"

	^ self getLocalPath , '/' , self getAcceptedName , '.component'