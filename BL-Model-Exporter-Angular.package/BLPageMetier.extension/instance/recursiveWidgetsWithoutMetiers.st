*BL-Model-Exporter-Angular
recursiveWidgetsWithoutMetiers
	^ (self widgetsNotPageMetier  , (self widgetsNotPageMetier  collect: #recursiveWidgets)) flattened