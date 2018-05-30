*BL-Model-Exporter-Angular
getServicesImportString
	^ ''
		,
			(self calledServices
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction service mooseName , ' } from ''' , self relativePathToHome
						, serviceAction service getLocalPath , ''';' , String crlf ])