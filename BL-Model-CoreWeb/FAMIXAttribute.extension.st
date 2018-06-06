Extension { #name : #FAMIXAttribute }

{ #category : #'*BL-Model-CoreWeb' }
FAMIXAttribute >> uniqueName [
	^ self name, self mooseID asString "((self mooseName copyFrom: (self namespaceScope mooseName size + 3) to:  self mooseName size)  replaceAllRegex: '\:\:|\(.*\)' with: '_') copyReplaceAll: '.' with: ''"
]
