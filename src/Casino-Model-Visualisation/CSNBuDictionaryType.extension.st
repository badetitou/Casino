Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-Model-Visualisation' }
CSNBuDictionaryType >> toBussinessType [
	^ {self key toBussinessType. self value toBussinessType}
]
