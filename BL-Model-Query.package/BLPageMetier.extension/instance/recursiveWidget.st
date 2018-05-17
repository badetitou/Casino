*BL-Model-Query
recursiveWidget
	^ {self.
	(self widgets collect: #recursiveWidget).
	(self metiers collect: #recursiveWidget)}