as yet unclassified
handleIdentifier: anIndentifier
	(anIndentifier name = 'BLEventPopup') ifTrue: [ anIndentifier name: 'this._toastrService'. ^ true ] ifFalse: [ ^ false ]