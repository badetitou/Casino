accessing
export
	root := (FileSystem disk workingDirectory / model name) asFileReference.
	rootPhases := root / 'phases'.
	self visit: model