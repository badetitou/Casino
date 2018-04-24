*BL-Model-Importer-Java
parameters
	^ ((signature replaceAllRegex: '.*\(' with: '' ) replaceAllRegex: '\)' with: '' ) substrings: ','