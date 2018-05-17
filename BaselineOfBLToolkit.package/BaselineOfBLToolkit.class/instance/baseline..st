baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				repository: 'https://github.com/badetitou/BL-ToolKit';
				package: 'BL-Model';
				package: 'BL-Model-Explorer';
				package: 'BL-Model-Example' with: [ spec requires: #('BL-Model-CoreWeb') ];
				package: 'BL-Model-Exporter' with: [ spec requires: #('BL-Model') ];
				package: 'BL-Model-Exporter-Angular' with: [ spec requires: #('BL-Model-Exporter' 'BL-Model-Toolkit') ];
				package: 'BL-Model-Importer' with: [ spec requires: #('BL-Model') ];
				package: 'BL-Model-Importer-Java' with: [ spec requires: #('BL-Model-Importer' 'BL-Model-Toolkit') ];
				package: 'BL-Model-Query';
				package: 'BL-Model-CoreWeb' with: [ spec requires: #('BL-Model') ];
				package: 'BL-Model-CoreWeb-Exporter' with: [ spec requires: #('BL-Model-CoreWeb') ];
				package: 'BL-Model-CoreWeb-Importer' with: [ spec requires: #('BL-Model-CoreWeb') ];
				package: 'BL-Model-Toolkit' with: [ spec requires: #('BL-Model-CoreWeb') ];
				group: 'default' with: #('core''BL-Model-Exporter-Angular' 'BL-Model-Importer-Java');
				group: 'core' with: #('BL-Model' 'BL-Model-Exporter' 'BL-Model-Importer');
				group: 'bl' with: #('default' 'BL-Model-Example' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter' 'BL-Model-CoreWeb-Importer');
				group: 'all' with: #('bl' 'BL-Model-Query') ] 