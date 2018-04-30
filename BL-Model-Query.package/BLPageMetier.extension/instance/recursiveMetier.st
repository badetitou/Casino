*BL-Model-Query
recursiveMetier
	^ {self.
	(self metiers collect: #recursiveMetier)}