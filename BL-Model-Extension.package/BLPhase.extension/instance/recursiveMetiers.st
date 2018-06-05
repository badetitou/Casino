*BL-Model-Extension
recursiveMetiers
	^ (self pageMetiers , (self pageMetiers collect: #recursiveMetiers)) flattened