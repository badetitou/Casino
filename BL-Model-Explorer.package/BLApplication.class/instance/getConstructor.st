accessing
getConstructor
	^ self model allModelMethods
				select: #isConstructor
	