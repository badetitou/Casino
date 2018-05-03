accessing
isElementFromApplication: e
	^ e sourceAnchor isNotNil and: [('*' , self applicationSource , '*' match: e sourceAnchor fileName)]