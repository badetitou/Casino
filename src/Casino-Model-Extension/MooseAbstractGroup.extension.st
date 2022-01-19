Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAction [
	<navigation: 'CSN Actions'>
	^ self allWithSubTypesOf: CSNAction
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNActionAppel [
	<navigation: #'CSN ActionAppel'>
	^ self allWithSubTypesOf: CSNActionAppel 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNAttributes [
	<navigation: 'CSN Attributes'>
	^ self allWithSubTypesOf: CSNAttribute
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNLayout [
	<navigation: 'CSN Sub-Layout'>
	^ self allWithSubTypesOf: CSNLLayout
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPage [
	<navigation: 'CSN Page'>
	^ self allWithSubTypesOf: CSNPage
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNPageMetier [
	<navigation: 'CSN Page Metier'>
	^ self allWithSubTypesOf: CSNBusinessPage 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNService [
	<navigation: 'CSN Service'>
	^ self allWithSubTypesOf: CSNService 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNServiceAPI [
	<navigation: #'CSN ServiceAPI'>
	^ self allWithSubTypesOf: CSNServiceAPI
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNUiContainer [
	
	<navigation: 'CSN Container'>
	^ self allWithSubTypesOf: CSNContainer 
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidget [
	<navigation: 'CSN Sub-Widget'>
	^ self allWithSubTypesOf: CSNWidget
]

{ #category : #'*Casino-Model-Extension' }
MooseAbstractGroup >> allCSNWidgetExceptPage [
	<navigation: 'CSN Sub-Widget ExceptPage'>
	^ self
		cacheAt: 'Sub-Widget ExceptPage'
		ifAbsentPut: [ (self allWithSubTypesOf: CSNWidget)
				reject: [ :el | (el isOfType: CSNPage) or: [ el isOfType: CSNBusinessPage ] ] ]
]
