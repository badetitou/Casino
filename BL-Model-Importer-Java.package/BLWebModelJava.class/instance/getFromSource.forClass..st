as yet unclassified
getFromSource: listofSourcedElement forClass: aClass
	^ (xmlUiLink at: aClass ifAbsent: [ ^ (listofSourcedElement select: [ :a | a source = aClass ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | {(a at: 1)} ] ])
		collect: [ :class | (listofSourcedElement select: [ :a | a source = class ]) ifEmpty: [ ^ nil ] ifNotEmpty: [ :a | a at: 1 ] ]