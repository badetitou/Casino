*BL-Model-Query
recursiveMetierNodes
	^ {self.
	(self metiers flatCollect: #recursiveMetier)} flattened