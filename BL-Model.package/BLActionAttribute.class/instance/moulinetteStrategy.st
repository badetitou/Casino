accessing
moulinetteStrategy
	^ moulinetteStrategy ifNil: [ moulinetteStrategy := BLMoulinetteNullStrategy new ]