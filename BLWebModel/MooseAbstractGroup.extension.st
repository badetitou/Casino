Extension { #name : #MooseAbstractGroup }

{ #category : #'*BLWebModel' }
MooseAbstractGroup >> allBLAction [
	<navigation: 'BL Service'>
	^ self allWithType: BLService
]

{ #category : #'*BLWebModel' }
MooseAbstractGroup >> allBLPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithType: BLPageMetier 
]

{ #category : #'*BLWebModel' }
MooseAbstractGroup >> allBLPhase [
	<navigation: 'BL Phase'>
	^ self allWithType: BLPhase 
]

{ #category : #'*BLWebModel' }
MooseAbstractGroup >> allBLWidget [
	<navigation: 'BL Widget'>
	^ self allWithType: BLWidget
]
