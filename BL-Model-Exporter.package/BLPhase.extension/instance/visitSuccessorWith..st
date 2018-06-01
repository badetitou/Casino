*BL-Model-Exporter
visitSuccessorWith: anExporter
	"to override"

	self pageMetiers do: [ :metier | anExporter visit: metier ]