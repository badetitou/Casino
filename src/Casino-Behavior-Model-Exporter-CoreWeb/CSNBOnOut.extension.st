Extension { #name : #CSNBOnOut }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnOut >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(mouseout)="' , (behaviors anyOne uniqueNameInPage: (self caller atAnyScope: {CSNPage. CSNBusinessPage }) anyOne), '($event)"' ]
]
