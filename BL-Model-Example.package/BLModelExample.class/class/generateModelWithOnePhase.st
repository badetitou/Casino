examples
generateModelWithOnePhase
	| model |
	model := MooseModel new.
	model name: #generateModelWithOnePhase.
	model
		add:
			(BLPhase new
				name: #Phase1;
				realClassName: #fr::bl::Phase1;
				codeValue: #codeValue;
				codePhase: #codePhase).
	model
		add:
			(BLPhase new
				name: #Phase2;
				realClassName: #fr::bl::Phase2;
				codeValue: #codeValue;
				codePhase: #codePhase).
	^ model