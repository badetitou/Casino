accessing
recursiveMetiers
	^ self metiers , (self metiers collect: #recursiveMetiers)