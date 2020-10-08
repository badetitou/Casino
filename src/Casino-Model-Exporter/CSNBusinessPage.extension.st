Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Exporter' }
CSNBusinessPage >> container [
	^ self pageContainer
		ifNil: [ self widgetContainer ifNil: [ self cellOwner ] ]
]

{ #category : #'*Casino-Model-Exporter' }
CSNBusinessPage >> containers [
	^ self pageContainers ifNotEmpty: [ self pageContainers ] ifEmpty: [ {super container} ]
]
