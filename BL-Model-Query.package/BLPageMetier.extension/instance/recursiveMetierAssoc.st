*BL-Model-Query
recursiveMetierAssoc
	^ {self.
	(self metiers flatCollect: #recursiveMetier)}