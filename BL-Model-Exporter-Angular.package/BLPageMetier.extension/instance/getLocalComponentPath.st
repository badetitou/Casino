*BL-Model-Exporter-Angular
getLocalComponentPath
	" return   pageMetierName/pageMetierName.component"
	^ self getAcceptedName , '/' , self getAcceptedName , '.component'