Extension { #name : #SequenceableCollection }

{ #category : #'*Casino-Helper' }
SequenceableCollection >> at: index ifPresent: presentBlock [

	"Answer the element at my position index. If I do not contain an element 
	at index, answer the result of evaluating the argument, exceptionBlock."

	"(#(a b c d) at: 3 ifAbsent: #z) >>> #c"

	"(#(a b c d) at: 5 ifAbsent: #z) >>> #z"

	(index between: 1 and: self size) ifTrue: [ 
		^ presentBlock value: (self at: index) ].
	^ nil
]
