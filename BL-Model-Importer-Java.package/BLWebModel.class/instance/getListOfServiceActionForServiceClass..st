as yet unclassified
getListOfServiceActionForServiceClass: aServiceClass
	| listOfSubAsyncClass |
	listOfSubAsyncClass := self getAsyncClassFrom: aServiceClass.
	^ (listOfSubAsyncClass flatCollect: #methods) , aServiceClass methods reject: [ :method | method sourceAnchor sourceText isEmpty "reject method from src/target/... In source"]
		thenCollect: [ :method | BLServiceAction newFor: method ]