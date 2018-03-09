initialization
createPageMetierInModel: aPageMetier
	^ BLPageMetier new
		name: aPageMetier mooseName;
		sourceAnchor: aPageMetier sourceAnchor