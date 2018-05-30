accessing
convertOldClass
	oldClass do: [ :pjMethod | pjMethod acceptVisitor: BLConvertVisitor new ]