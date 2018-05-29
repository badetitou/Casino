*BL-Fast-Java-Angular-Extensions
angularString
	^ ' {', String crlf,( self statements flatCollect: [ :statement | statement angularString, String crlf  ]) , '}', String crlf