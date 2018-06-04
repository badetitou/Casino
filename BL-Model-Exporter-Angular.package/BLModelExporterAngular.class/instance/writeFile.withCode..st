accessing
writeFile: aFileReference withCode: theSourceCode
	(aFileReference writeStream nextPutAll: theSourceCode) flush