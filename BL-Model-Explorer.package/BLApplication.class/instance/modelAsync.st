accessing
modelAsync
	^ modelAsyncCache
		ifNil: [ modelAsyncCache := self model allModelClasses
		select: [ :e | e superclassHierarchy contains: [ :a | ('*AsyncCallback*' match: a name) and: [ self isEntityInBlApp: e ] ] ] ]