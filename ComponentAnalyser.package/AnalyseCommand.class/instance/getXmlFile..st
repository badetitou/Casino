as yet unclassified
"fileName :='/home/badetitou/Document/PFE/Source/BLCoreIncubatorGwt/src/fr/bl/application.module.xml'."
getXmlFile: aFilePath
	^ PPXmlParser parse: aFilePath asFileReference contents.