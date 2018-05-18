*BL-Model-CoreWeb-Exporter
attributeMethod
	"If an attribute makes reference to a method (ex: click). You can override this method to precise the method to generate"

	| methodsText |
	methodsText := self oldMethodConverted.
	^ (self oldMethod methods size = 1) ifTrue: [ '    public ' , self attributeValue
		,
			': void {
        // TODO by developers
        /*
' , (self extractOnClickMethod: methodsText)
		,
			'
        */
    }' , String crlf , String crlf ]
ifFalse: [ '    public ' , self attributeValue
		,
			': void {
        // TODO by developers
        /*
' , (methodsText)
		,
			'
        */
    }' , String crlf , String crlf ]