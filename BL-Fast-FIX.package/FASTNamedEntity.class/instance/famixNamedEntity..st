accessing
famixNamedEntity: aNamedEntity
	famixNamedEntity := FMMultivalueLink
		on: self
		update: #fastNamedEntities
		from: self famixNamedEntity
		to: aNamedEntity