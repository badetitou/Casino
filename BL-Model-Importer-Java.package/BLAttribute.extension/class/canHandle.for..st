*BL-Model-Importer-Java
canHandle: anInvocation for: aWidgetInstance
	^ (aWidgetInstance canHaveAttribute: self) and: [ self canHandle: anInvocation ]