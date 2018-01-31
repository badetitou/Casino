accessing
isEntityInBlCore: anEntity
	^ self sourceCore match: ((anEntity atScope: FAMIXClass) at: 1) sourceAnchor fileName