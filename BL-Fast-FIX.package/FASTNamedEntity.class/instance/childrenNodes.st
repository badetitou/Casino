accessing
childrenNodes
	| result |
	self flag: 'this is not really a child node...'.
	result := OrderedCollection new.
	famixNamedEntity ifNotNil: [ result add: famixNamedEntity ].
	^ result