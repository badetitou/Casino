*BL-Model-Exporter-Angular
idViewChild
	^ self variable ifNil: [ '' ] ifNotNil: [ '@ViewChild(''' , self id , ''', {read: ViewContainerRef}) ' , self id , ': ViewContainerRef;' , String crlf ]