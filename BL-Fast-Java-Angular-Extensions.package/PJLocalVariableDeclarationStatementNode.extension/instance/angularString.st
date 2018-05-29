*BL-Fast-Java-Angular-Extensions
angularString
	^ 'let ', (self declarators flatCollect: [ :declarator | declarator angularString, ' ' ]), ';'.