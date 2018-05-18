as yet unclassified
convertFAMIXClassToTypescriptString: aFAMIXClass
	| correspondingTSFile | 
	correspondingTSFile := self rootFolder / (self computeTSFileNameFromFAMIXCLass: aFAMIXClass).
	self computeTSClassNameFromFAMIXCLass: aFAMIXClass.
	correspondingTSFile.
	
	^ self halt. 