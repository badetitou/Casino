*BL-Model-Query
color
	^ self pageMetiers ifEmpty: [ Color yellow ] ifNotEmpty: [ Color blue ]