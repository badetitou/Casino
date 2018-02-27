BLMetamodelGenerator new generate.


filePath := 'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.
xml := PPXmlParser parse: filePath asFileReference contents.

mseFile := StandardFileStream fileNamed:  'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .

mooseModel := MooseModel importFromMSEStream: mseFile .

mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE'.

blModelImporter := BLModelImporter new model: mooseModel; applicationXml: xml;
sourceApp: './Source/BLCoreIncubatorGwt/*';
sourceCore: './Source/BLCore-6.1.4/'.

blModelImporter generateBLModel.