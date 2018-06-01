baselines
definePackages: spec
	spec
		repository: 'https://github.com/badetitou/BL-ToolKit';
		package: 'BL-Model';
		package: 'BL-Model-FamixNGPatch';
		package: 'BL-Model-Extension';
		package: 'BL-MetamodelGenerator' with: [ spec requires: #('BL-Model-FamixNGPatch') ];
		package: 'BL-Model-Explorer';
		package: 'BL-Model-Example' with: [ spec requires: #('BL-Model-CoreWeb') ];
		package: 'BL-Model-Exporter' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Exporter-Angular'
			with: [ spec requires: #('BL-Model-Exporter' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Importer' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-Importer-Java'
			with: [ spec requires: #('PetitParser' 'BL-Model-Importer' 'BL-Model-Toolkit') ];
		package: 'BL-Model-Query';
		package: 'BL-Model-CoreWeb' with: [ spec requires: #('BL-Model') ];
		package: 'BL-Model-CoreWeb-Exporter'
			with: [ spec requires: #('BL-Model-CoreWeb' 'BL-Model-Exporter-Angular') ];
		package: 'BL-Model-CoreWeb-Importer'
			with: [ spec requires: #('BL-Model-CoreWeb' 'BL-Model-Importer-Java') ];
		package: 'BL-Model-Toolkit' with: [ spec requires: #('BL-Model-CoreWeb') ]