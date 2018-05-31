*BL-Model-Exporter-Angular
behaviors
	^ (self collectPhaseCalled
		ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ]
		ifEmpty: [ '' ])
		,
			(self calledBehavior
				flatCollect: [ :actionService | actionService serviceVariableConstructorString , ', ' ])