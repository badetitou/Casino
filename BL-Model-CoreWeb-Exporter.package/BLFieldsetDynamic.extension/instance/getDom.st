*BL-Model-CoreWeb-Exporter
getDom
	^ '<p-accordion> <p-accordionTab ' , self attributesTag 
		,
			'>
       ' , (self widgets flatCollect: #getDom)
		,
			'
    </p-accordionTab>
</p-accordion>'