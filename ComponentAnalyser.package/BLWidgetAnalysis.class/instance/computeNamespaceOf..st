private
computeNamespaceOf: aFamixEl
	| tmpEl |
	tmpEl := aFamixEl.
	[ tmpEl isNamespace ] whileFalse: [ tmpEl := tmpEl belongsTo ].
	^ tmpEl 