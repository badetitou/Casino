example
exampleDataSource
	| m1 m2 m3 |
m1 := MooseModel new.
	m2 := MooseModel new.
	m3 := MooseModel new.
	m1 add: (FAMIXClass new name: 'data1').
	m2 add: (FAMIXClass new name: 'data2').
	m3 add: (FAMIXClass new name: 'data3').
	^ {m1.
	m2.
	m3} asOrderedCollection