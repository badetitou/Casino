accessing
rootFolder
	^ rootFolder ifNil: [ self error: 'Root Not Defined' ]