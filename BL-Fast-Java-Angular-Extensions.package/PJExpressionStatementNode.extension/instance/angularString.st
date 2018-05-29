*BL-Fast-Java-Angular-Extensions
angularString
	^ (self expression flattened reject: #isNil) flatCollect: #angularString