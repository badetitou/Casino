as yet unclassified
getListOfServiceActionForServiceClass: aServiceClass
	"Looking for class with `aServiceClass name ', Async'` 
	
	Currently disable because we don't know why we should want NOT async method... and all the method are the same.
	So we can say that all the non async method are also all the async method (with an arg less)
	Please consider this method return all the async method"

	| listOfSubAsyncClass |
	listOfSubAsyncClass := {} "self getAsyncClassFrom: aServiceClass".
	^ (listOfSubAsyncClass flatCollect: #methods) , aServiceClass methods reject: [ :method | method sourceAnchor sourceText isEmpty "reject method from src/target/... In source"]
		thenCollect: [ :method | BLServiceAction newFor: method ]