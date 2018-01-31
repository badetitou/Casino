accessing
getServiceConstructor
	| modelServices |
	modelServices := self modelServices.
	^ self getConstructor select: [ :method | modelServices includes: method parentType ]