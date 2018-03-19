hooks
newTerminal
	^ (BLRule subclasses at: (self randomElementOf: (1 to: BLRule subclasses size))) new