*BL-Model-Importer-Java
newFor: anInvocation
	| handled |
	handled := self subclasses do: [ :subclass | subclass newFor: anInvocation ].
	handled ifNil: [ (self canHandle: anInvocation) ifTrue: [ ^ self new ] ifFalse: [ ^ nil ] ].
	^ handled