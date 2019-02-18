Extension { #name : #CSNCoreCellWidth }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreCellWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'cellwidth' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreCellWidth class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	"bl_groupe_horizontal_289.setCellWidth(bl_groupe_vertical_290, '50%');
	
	1. Get the variable name -> anInvocation parameters at: 1 (in ex: bl_groupe_vertical_290)
	2. Determine the real variable with the property -> anImporter widgetInVariable: ()
	3. If this variable exist as a Widget (we hope so... but sometimes there are bugs for something we don't currently know), create the attribute and add it to the cellOwner of the variable
	"

	(anImporter
		widgetInVariable:
			((anInvocation from localVariables
				select: [ :localVariable | localVariable name = (anInvocation parameters at: 1) ])
				ifNotEmpty: [ :correspondingVariable | correspondingVariable first ]
				ifEmpty: [nil]))
		ifNotNil: [:widget | ^ CSNUIWidth new
				name: 'cellwidth';
				attributeValue: (anInvocation parameters at: 2);
				widget: widget cellOwner;
				yourself ].
	^ nil
]
