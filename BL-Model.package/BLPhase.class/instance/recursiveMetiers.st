accessing
recursiveMetiers
	^ (self pageMetiers , (self pageMetiers collect: #recursiveMetiers)) flattened