*BL-Model-FamixNGPatch
generateRootMethodsIn: aClass
self builder generator
		ifNotNil: [ aClass classSide
				compile:
					('metamodel

	<generated>
	^ (self class environment at: #{1}) metamodel' format: {self builder generator class name})
				classified: 'meta' ]