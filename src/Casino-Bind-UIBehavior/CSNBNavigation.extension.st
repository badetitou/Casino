Extension { #name : #CSNBNavigation }

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBNavigation >> page [
	"Relation named: #page type: #CSNPage opposite: #navigations"

	<generated>
	<FMProperty: #page type: #CSNPage opposite: #navigations>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #page ifAbsent: [ nil ]
]

{ #category : #'*Casino-Bind-UIBehavior-accessing' }
CSNBNavigation >> page: anObject [

	<generated>
	self privateState attributeAt: #page put: (FMMultivalueLink on: self update: #navigations from: self page to: anObject).
]
