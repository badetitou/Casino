*BL-Model-Exporter-Angular
container
	^ containerWidget ifNotEmpty: [ containerWidget at: 1 ] ifEmpty: [ containerMetier ]