Extension { #name : #BLHorizontalChild }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLHorizontalChild >> asString [
	^ 'class="ui-g-12 ui-md-6 ui-lg-', self subpart asString, '"'
]
