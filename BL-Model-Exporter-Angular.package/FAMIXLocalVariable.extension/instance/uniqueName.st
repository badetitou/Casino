*BL-Model-Exporter-Angular
uniqueName
	^ self name, self mooseID asString "((self mooseName copyFrom: (self namespaceScope mooseName size + 3) to:  self mooseName size)  replaceAllRegex: '\:\:|\(.*\)' with: '_') copyReplaceAll: '.' with: ''"