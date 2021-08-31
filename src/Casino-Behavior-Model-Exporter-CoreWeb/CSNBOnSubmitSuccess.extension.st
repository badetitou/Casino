Extension { #name : #CSNBOnSubmitSuccess }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBOnSubmitSuccess >> getAngularRepresentation [
	^ self behavior ifEmpty: [ '' ] ifNotEmpty: [ :behaviors | '(ngSubmit)="' , (behaviors anyOne uniqueNameInPage: (self caller atAnyScope: {CSNPage. CSNBusinessPage }) anyOne), '($event)"' ]
]
