Extension { #name : #MooseModel }

{ #category : #'*Casino-Model-Exporter-Angular' }
MooseModel >> getHTMLName [
	^ 'index.component.html'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
MooseModel >> getModuleName [
	^ self name , '.module.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
MooseModel >> getRouteName [
	^ self name , '.routing.ts'
]

{ #category : #'*Casino-Model-Exporter-Angular' }
MooseModel >> getTSName [
	^ 'index.component.ts'
]
