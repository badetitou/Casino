accessing
export
	root := (FileSystem disk workingDirectory / model name) asFileReference.
	root createDirectory.
	rootPhases := root / 'phases'.
	rootPhases createDirectory.
	 model allBLPhase do: [ :phase | self visit: phase ]