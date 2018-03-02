accessing
infoAnonymousWidget
	^ ((self model allModelClasses
		select: [ :c | 
			c isAnonymousClass
				and: [ (c superInheritances collect: #to)
						anySatisfy: [ :spc | self widgetNamespace match: spc mooseName ] ] ])
		collect: [ :anAnonymousWidget | {(anAnonymousWidget -> (self computeInfoAnonymousWidget: anAnonymousWidget ))} ]) flatten asDictionary