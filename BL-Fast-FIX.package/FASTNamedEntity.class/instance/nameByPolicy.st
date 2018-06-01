accessing
nameByPolicy
	<MSEProperty: #nameByPolicy type: #String>
	<derived>
	<MSEComment: 'Name of a variable transformed to fit programmming language case policy'>
	^ self sourceLanguage casePolicy: self name