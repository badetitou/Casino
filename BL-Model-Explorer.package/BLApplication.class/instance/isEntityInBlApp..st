accessing
isEntityInBlApp: anEntity
	^ self sourceApp match: ((anEntity atScope: FAMIXClass) at: 1) sourceAnchor fileName 