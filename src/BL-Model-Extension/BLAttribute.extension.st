Extension { #name : #BLAttribute }

{ #category : #'*BL-Model-Extension' }
BLAttribute >> attributeMethod [
	"If an attribute makes reference to a method (ex: click). You can override this method to precise the method to generate"
	^ ''
]

{ #category : #'*BL-Model-Extension' }
BLAttribute >> behaviors [
	^ Set new
]
