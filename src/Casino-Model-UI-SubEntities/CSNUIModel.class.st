Class {
	#name : #CSNUIModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-UI-SubEntities-Model'
}

{ #category : #accessing }
CSNUIModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' 'Casino-Model-Layout' #'Casino-Model')
]

{ #category : #meta }
CSNUIModel class >> annotation [
	<FMClass: #CSNUIModel super: #MooseModel>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
]

{ #category : #testing }
CSNUIModel class >> canBeImportedFromFile [
	<generated>
	^true
]
