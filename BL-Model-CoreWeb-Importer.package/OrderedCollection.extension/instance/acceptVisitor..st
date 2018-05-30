*BL-Model-CoreWeb-Importer
acceptVisitor: aVisitor
	self do: [ :each | aVisitor visitNode: each ]