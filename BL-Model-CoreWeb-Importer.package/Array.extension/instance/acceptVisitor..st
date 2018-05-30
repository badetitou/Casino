*BL-Model-CoreWeb-Importer
acceptVisitor: aVisitor
	self do: [ :each | each ifNotNil: [ aVisitor visitNode: each  ]] 