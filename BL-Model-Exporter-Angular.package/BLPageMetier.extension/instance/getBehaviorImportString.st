*BL-Model-Exporter-Angular
getBehaviorImportString
	^ ''
		,
			(self calledBehavior
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction service mooseName , ' } from ''' , self relativePathToHome
						, serviceAction service getLocalPath , ''';' , String crlf ])