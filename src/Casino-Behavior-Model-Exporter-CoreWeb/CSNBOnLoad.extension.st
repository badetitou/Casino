Extension { #name : #CSNBOnLoad }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnLoad >> getAngularRepresentation [
	^ self behavior
		ifEmpty: [ '' ]
		ifNotEmpty: [ :behaviors | '(load)="' , (behaviors anyOne uniqueNameInPage: (self caller atAnyScope: {CSNPage. CSNBusinessPage }) anyOne), '($event)"' ]
]
