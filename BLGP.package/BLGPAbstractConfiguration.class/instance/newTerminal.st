example
newTerminal
	^ (BLGroupRule subclasses at: (self randomElementOf: (1 to: BLGroupRule subclasses size))) new