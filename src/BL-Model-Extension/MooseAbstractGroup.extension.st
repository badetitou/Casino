Extension { #name : #MooseAbstractGroup }

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLAction [
	
	<navigation: 'BL Actions'>
	^ self allWithType: BLAction
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLActionAppel [
	<navigation: 'BLActionAppel'>
	^ self allWithSubTypesOf: BLActionAppel 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLAttributes [
	<navigation: 'BL Attributes'>
	^ self allWithSubTypesOf: BLAttribute
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLBehavior [
	<navigation: 'Sub-Behavior'>
	^ self allWithSubTypesOf: BLBehavior
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLPageMetier [
	<navigation: 'BL Page Metier'>
	^ self allWithType: BLPageMetier 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLPhase [
	<navigation: 'BL Phase'>
	^ self allWithType: BLPhase 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLService [
	<navigation: 'BL Service'>
	^ self allWithType: BLService 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLServiceAction [
	<navigation: 'BL Service Action'>
	^ self allWithType: BLServiceAction
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLUiContainer [
	
	<navigation: 'BL UiContainer'>
	^ self allWithType: BLUIContainer 
]

{ #category : #'*BL-Model-Extension' }
MooseAbstractGroup >> allBLWidget [
	<navigation: 'Sub-Widget'>
	^ self allWithSubTypesOf: BLWidget
]
