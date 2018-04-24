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
				package: 'BL-Model-Exporter-Angular' with: [ spec requires: #('BL-Model-Exporter') ];
				package: 'BL-Model-Importer' with: [ spec requires: #('BL-Model-Explorer' 'BL-Model') ];
				package: 'BL-Model-Importer-Java' with: [ spec requires: #('BL-Model-Importer') ];
				package: 'BL-Model-Query';
				package: 'BL-Model-CoreWeb' with: [ spec requires: #('BL-Model') ];
				package: 'BL-Model-CoreWeb-Exporter' with: [ spec requires: #('BL-Model-CoreWeb') ];
				group: 'default' with: #('BL-Model' 'BL-Model-Exporter' 'BL-Model-Exporter-Angular' 'BL-Model-Importer' 'BL-Model-Importer-Java');
				group: 'bl' with: #('default' 'BL-Model-Example' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter');
				group: 'all' with: #('BL-Model' 'BL-Model-Example' 'BL-Model-Exporter' 'BL-Model-Exporter-Angular' 'BL-Model-Importer' 'BL-Model-Importer-Java' 'BL-Model-Query' 'BL-Model-CoreWeb' 'BL-Model-CoreWeb-Exporter')  ]