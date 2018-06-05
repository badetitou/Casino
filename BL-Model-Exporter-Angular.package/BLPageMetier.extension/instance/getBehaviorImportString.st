*BL-Model-Exporter-Angular
getBehaviorImportString
	^ ''
		,
			(self calledBehavior
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction serviceAction mooseName , ' } from ''' , self relativePathToHome
						, serviceAction serviceAction getLocalPath , ''';' , String crlf ])