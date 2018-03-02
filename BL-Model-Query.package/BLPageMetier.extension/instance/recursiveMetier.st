*BL-Model-Query
recursiveMetier
	^ {self.
	self metiers flatCollect: #recursiveMetier}