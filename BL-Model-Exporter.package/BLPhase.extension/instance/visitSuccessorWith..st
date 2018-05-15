*BL-Model-Exporter
visitSuccessorWith: anExporter
	"to override"
	self metiers do: [ :metier | anExporter visit: metier ]
	