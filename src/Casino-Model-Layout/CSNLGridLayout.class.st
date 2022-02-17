Class {
	#name : #CSNLGridLayout,
	#superclass : #CSNLLayout,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLGridLayout class >> annotation [

	<FMClass: #GridLayout super: #CSNLLayout>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #accessing }
CSNLGridLayout >> at: anInvocation setAttribute: attribute [
	^ (self attributeAt: #cellAttribute ifAbsentPut: [ Dictionary new ])
		add: attribute -> anInvocation
]

{ #category : #accessing }
CSNLGridLayout >> atLevel: level [
	^ (self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | position isArray and: [ position first = level ] ]
]

{ #category : #accessing }
CSNLGridLayout >> atLevelSorted: level [
	^ ((((self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :position | position isArray and: [ (position at: 1) = level ] ])
		associationsCollect: #yourself)
		sort: [ :a :b | a value second < b value second ]) collect: #key
]

{ #category : #accessing }
CSNLGridLayout >> atPositionX: anX Y: anY [
	^ (self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		associations
		select: [ :assoc | 
			assoc value isArray
				and: [ assoc value first = anX and: [ assoc value second = anY ] ] ]
		thenCollect: #key
]

{ #category : #private }
CSNLGridLayout >> determineXFrom: anInvocation andPrevious: anPreviousInvocation [

	| aXValue |
	"The first check of is array is used in debug if we try to re determine some values"
	aXValue := anInvocation isArray
		           ifTrue: [ anInvocation first ]
		           ifFalse: [ anInvocation parameters first ].
	^ aXValue asInteger
		  ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			  | currentXValue |
			  "widget.setWidget(widget.getRowCount(), ..)"
			  (aXValue includesSubstring: 'getRowCount') ifTrue: [ ^ self maxLevel + 1 ].
			  "determine current var value"
			  currentXValue := (self attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ])
				                   at: ((aXValue removePrefix: '++') removeSuffix: '++')
				                   ifAbsent: [ nil ].
			  "If currentValue is not nil. It means we've already seen the variable. We can try to find the other usage of the variable to detect the potentiel var++ or ++var alone in the code.
			Else, we'll say it's the max level (but we do not have arguments)"
			  currentXValue
				  ifNotNil: [ 
					  (anInvocation source localVariables select: [ :localVariable | localVariable name = ((aXValue removePrefix: '++') removeSuffix: '++') ]) ifNotEmpty: [ 
						  :localVariable | 
						  | positions |
						  positions := anInvocation source sourceAnchor findAllOccurrencesOfVariableNamed: localVariable first name.
						  anInvocation source sourceAnchor sourceText replaceAllRegex: '\n' with: ''.
						  "anInvocation from sourceAnchor
								copyFrom: positions first - 102
								to: positions first + localVariable first name size - 1 + 100."
						  "First we extract only the interesting usages (between the previous set we analysed and the current one"
						  positions := positions select: [ :val | 
							               val < anInvocation sourceAnchor startPos and: [ 
								               val > (anPreviousInvocation
									                ifNil: [ 0 ]
									                ifNotNil: [ anPreviousInvocation sourceAnchor endPos ]) ] ].
						  "Then we compute for each position the action we have to do"
						  positions do: [ :val | "if the usage is something like ++var or var++, we increment the currentXValue"
							  ((anInvocation source sourceAnchor copyFrom: val - 2 to: val + localVariable first name size - 1) = ('++' , localVariable first name) or: [ 
								   (anInvocation source sourceAnchor copyFrom: val to: val + localVariable first name size - 1 + 2) = (localVariable first name , '++') ])
								  ifTrue: [ currentXValue := currentXValue + 1 ]
								  ifFalse: [ self haltIf: [ localVariable first incomingAccesses anySatisfy: [ :access | access sourceAnchor startPos = val ] ] ] ] ] ]
				  ifNil: [ currentXValue := self maxLevel ].
			  "widget.setWidget(++var, ..)"
			  (aXValue beginsWith: '++')
				  ifTrue: [ 
					  currentXValue := currentXValue + 1.
					  (self attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aXValue removePrefix: '++') put: currentXValue ]
				  ifFalse: [ "widget.setWidget(var++, ..)"
					  (aXValue endsWith: '++')
						  ifTrue: [ (self attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: (aXValue removeSuffix: '++') put: currentXValue + 1 ]
						  ifFalse: [ "widget.setWidget(var, ..)" (self attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: aXValue put: currentXValue ] ].
			  ^ currentXValue ]
		  ifNotNil: [ ^ aXValue asInteger ]
]

{ #category : #compute }
CSNLGridLayout >> determineXandYfrom: anInvocation andPrevious: anPreviousInvocation [
	"add tmp variable understanding"

	^ {(self determineXFrom: anInvocation andPrevious: anPreviousInvocation).
	(self determineYFrom: anInvocation andPrevious: anPreviousInvocation)}
]

{ #category : #private }
CSNLGridLayout >> determineYFrom: anInvocation andPrevious: anPreviousInvocation [

	| aYValue |
	"The first check of is array is used in debug if we try to re determine some values"
	aYValue := anInvocation isArray
		           ifTrue: [ anInvocation second ]
		           ifFalse: [ 
			           anInvocation parameters size >= 2
				           ifTrue: [ anInvocation parameters second ]
				           ifFalse: [ 0 ] ].
	^ aYValue asInteger
		  ifNil: [ "in case of setWidget(row,0).. Then setWidget(row++,1)"
			  | currentYValue |
			  (aYValue includesSubstring: 'getCellCount') ifTrue: [ 
				  ^ (self atLevel: aYValue parameters first asInteger) size ].

			  "determine current var value"
			  currentYValue := (self
				                    attributeAt: #addGridVariable
				                    ifAbsentPut: [ Dictionary new ])
				                   at:
				                   ((aYValue removePrefix: '++') removeSuffix:
					                    '++')
				                   ifAbsent: [ nil ].

			  "If currentValue is not nil. It means we've already seen the variable. We can try to find the other usage of the variable to detect the potentiel var++ or ++var alone in the code.
			Else, we'll say it's the max level (but we do not have arguments)"
			  currentYValue
				  ifNotNil: [ 
					  (anInvocation source localVariables select: [ :localVariable | 
						   localVariable name
						   = ((aYValue removePrefix: '++') removeSuffix: '++') ]) 
						  ifNotEmpty: [ :localVariable | 
							  | positions |
							  positions := anInvocation source sourceAnchor 
								               findAllOccurrencesOfVariableNamed:
								               localVariable first name.
							  positions := positions select: [ :val | 
								               val < anInvocation sourceAnchor startPos and: [ 
									               val > (anPreviousInvocation
										                ifNil: [ 0 ]
										                ifNotNil: [ 
										                anPreviousInvocation sourceAnchor endPos ]) ] ].
							  positions do: [ :val | "if the usage is something like ++var or var++, we increment the currentXValue"
								  ((anInvocation from sourceAnchor
									    copyFrom: val - 2
									    to: val + localVariable first name size - 1)
								   = ('++' , localVariable first name) or: [ 
									   (anInvocation from sourceAnchor
										    copyFrom: val
										    to: val + localVariable first name size - 1 + 2)
									   = (localVariable first name , '++') ])
									  ifTrue: [ currentYValue := currentYValue + 1 ]
									  ifFalse: [ 
										  self haltIf: [ 
											  localVariable first incomingAccesses anySatisfy: [ 
												  :access | access sourceAnchor startPos = val ] ] ] ] ] ]
				  ifNil: [ currentYValue := (self atLevel: self maxLevel) size ].


			  "widget.setWidget(++var, ..)"
			  (aYValue beginsWith: '++')
				  ifTrue: [ 
					  currentYValue := currentYValue + 1.
					  (self privateState
						   attributeAt: #addGridVariable
						   ifAbsentPut: [ Dictionary new ])
						  at: (aYValue removePrefix: '++')
						  put: currentYValue ]
				  ifFalse: [ 
					  (aYValue endsWith: '++')
						  ifTrue: [ 
							  (self
								   attributeAt: #addGridVariable
								   ifAbsentPut: [ Dictionary new ])
								  at: (aYValue removeSuffix: '++')
								  put: currentYValue + 1 ]
						  ifFalse: [ 
							  (self
								   attributeAt: #addGridVariable
								   ifAbsentPut: [ Dictionary new ])
								  at: aYValue
								  put: currentYValue ] ].
			  "	yValue
				ifNil: [ yValue := (self privateState attributeAt: #addGridVariable ifAbsentPut: [ Dictionary new ]) at: aYValue ifAbsentPut: [ 0 ].
					yValue = 0
						ifTrue: [ yValue := (self atLevel: self maxLevel) size ] ].
			yValue ifNil: [ yValue := (self atLevel: self maxLevel) size ]."
			  ^ currentYValue ]
		  ifNotNil: [ ^ aYValue asInteger ]
]

{ #category : #accessing }
CSNLGridLayout >> maxLevel [
	^ (((self attributeAt: #cellPosition ifAbsentPut: [ Dictionary new ])
		select: [ :element | element isArray ]
		thenCollect: [ :coord | coord first ])
		select: [ :element | element isInteger ])
		ifEmpty: [ ^ 0 ]
		ifNotEmpty: [ :col | col max ]
]
