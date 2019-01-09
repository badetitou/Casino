"
This package merge the ui model with the behavioral model.
To create a model with both metamodel use

   model := MooseModel new.
    
    model metamodel: (MooseModel metamodelComposedOf: { 
        BLLayoutMetamodelGenerator metamodel.
        FASTJavaMetamodelGenerator metamodel.
    }).

To export: 

 'mixed.mse' asFileReference ensureDelete writeStreamDo: [ :aStream |
        MooseModel export: model withMetamodel: model metamodel to: aStream.
    ].

To import: 

repo := 'mixed.mse' asFileReference readStreamDo: [ :aStream |
    MooseModel importFrom: aStream withMetamodel: (MooseModel metamodelComposedOf: { 
        BLLayoutMetamodelGenerator metamodel.
        FASTJavaMetamodelGenerator metamodel.
    })
].

model := MooseModel new.
model silentlyAddAll: repo elements.
model entityStorage forRuntime.
model name: 'argo'.
model.
"
Class {
	#name : #ManifestCSNUIFASTBinding,
	#superclass : #PackageManifest,
	#category : #'CSN-UIFASTBinding'
}
