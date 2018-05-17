*BL-Model-Query
recursiveWidget
	^ {self.
	(self widgets collect: #recursiveWidget)}