*BL-Model-CoreWeb-Exporter
attributeMethod
	"If an attribute makes reference to a method (ex: click). You can override this method to precise the method to generate"

	^ '    public ' , self attributeValue
		,
			': void {
        // TODO by developers
        /*
', self oldMethod ,'
        */
    }' , String crlf , String crlf