as yet unclassified
generateXMLUifrom: aBlApplication
	aBlApplication linkXmlUiPhaseAndPageMetier 
		do: [ :aXmlUiClass | self listOfPageMetier add: (self createXMLUiInModel: aXmlUiClass key) ]