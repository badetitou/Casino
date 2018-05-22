as yet unclassified
getInitializations
	^ '        this.items' , self mooseID asString
		,
			' = [
            {label: ''Update'', icon: ''fa-refresh'', command: () => {
            }},
            {label: ''Delete'', icon: ''fa-close'', command: () => {
            }},
            {label: ''Angular.io'', icon: ''fa-link''},
            {label: ''Theming'', icon: ''fa-paint-brush''}
        ];'