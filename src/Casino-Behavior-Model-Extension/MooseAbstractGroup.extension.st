Extension { #name : #MooseAbstractGroup }

{ #category : #'*Casino-Behavior-Model-Extension' }
MooseAbstractGroup >> allCSNBPopUp [
	<navigation: 'all PopUp'>
	^ (self allWithType: CSNBPopUp)
]
