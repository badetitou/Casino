*BL-Model-Exporter-Angular
getBehaviorImportString
	^ ''
		,
			(self calledBehavior
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction serviceActionOwner mooseName , ' } from ''' , self relativePathToHome
						, serviceAction serviceActionOwner getLocalPath , ''';' , String crlf ])