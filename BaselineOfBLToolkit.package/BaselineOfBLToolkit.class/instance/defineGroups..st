baselines
defineGroups: spec
	spec
		group: 'default' with: #('core' 'BL-Model-Exporter-Angular' 'BL-Model-Importer-Java');
		group: 'model' with: #('BL-MetamodelGenerator');
		group: 'core' with: #('BL-Model' 'BL-Model-Exporter' 'BL-Model-Importer' 'BL-Model-Extension');
		group: 'bl' with: #('default' 'BL-Model-Example' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter' 'BL-Model-CoreWeb-Importer');
		group: 'pp' with: #('PetitParser' 'PetitParser2');
		group: 'all' with: #('bl' 'BL-Model-Query' 'BL-MetamodelGenerator')