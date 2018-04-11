private
getPhaseNamed: aClassName
	^ ((self modelPhases select: [ :e | e mooseName = aClassName ])
		ifEmpty: [ Transcript crLog: 'error for ' , aClassName.
			^ nil ]
		ifNotEmpty: [ :a | a at: 1 ]) realClassName