private
addTo: aSourcedCollection from: anotherSourcedCollection in: theSelectorOfTheCollection
	aSourcedCollection
		do: [ :source1 | 
			anotherSourcedCollection
				do: [ :source2 | (theSelectorOfTheCollection value: source1 ) add: source2 ] ]