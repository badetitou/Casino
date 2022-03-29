# Casino <!-- omit in toc -->
[![CI](https://github.com/badetitou/Casino/actions/workflows/blank.yml/badge.svg?branch=v2)](https://github.com/badetitou/Casino/actions/workflows/blank.yml)
[![Coverage Status](https://coveralls.io/repos/github/badetitou/Casino/badge.svg?branch=v2)](https://coveralls.io/github/badetitou/Casino?branch=v2)
[![Moose version 9](https://img.shields.io/badge/Moose-9-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

This project aims to ease the migration of application front-end using metamodels.
To do so, it extracts the UI model of an application and generates the target application from the model.

This repository includes the whole work needed to migrate a GWT application to an Angular one.
Other importers and exporters are [available](https://github.com/badetitou?tab=repositories&q=Casino&type=&language=).

- [Package description](#package-description)
- [Installation](#installation)
- [Repository architecture](#repository-architecture)
- [Example of Casino usage](#example-of-casino-usage)
  - [Extraction](#extraction)
    - [For GWT application](#for-gwt-application)
    - [Existing JSON file](#existing-json-file)
    - [Other existing importers](#other-existing-importers)
  - [Generate](#generate)
    - [Angular application](#angular-application)
    - [Other generators](#other-generators)
- [Developers](#developers)
- [Links](#links)
  - [Other documentation (might be outdated):](#other-documentation-might-be-outdated)
  - [Linked research papers](#linked-research-papers)
- [Contacts](#contacts)

> This project is a research project part of an industrial project at [Berger-Levrault](http://berger-levrault.com/) in collaboration with the [RMoD Team - Inria](https://rmod.inria.fr/web)

## Package description

This repository contains the main packages of Casino.
It includes:

- A metamodel to represent the front-end of an application
- An Importer for this metamodel
- An Exporter for this metamodel
- A Specific Importer for Java (GWT)
- A Specific Exporter to Angular

It also contains some specific package for a company (but you don't need to know)

## Installation

To install Casino:

1. Download the last [Moose Image](https://moosetechnology.github.io/moose-wiki/)
2. In the Moose Image execute

```Smalltalk
Metacello new
  githubUser: 'badetitou' project: 'Casino' commitish: 'v1.x.x' path: 'src';
  baseline: 'Casino';
  load
```

This should load the version *v1.x.x* of the project (you can also specify another version or branch).

## Repository architecture

Here I'll try to explain you the repository architecture of Casino.

There are three main parts:

- Casino-Model-*X* is about the visual part of the model
- Casino-Business-*X* is about the data manipulated by the application
- Casino-Behavior-*X* is about the behavior of the UI (*e.g.* what happen when someone clicks on this button)

## Example of Casino usage

### Extraction

#### For GWT application

1. Load a Moose model

```Smalltalk
'path/to/model.json' asFileReference readStreamDo: [ :stream | famixModel := FamixJavaModel new importFromJSONStream: stream ]
```

> You can create a JSON model using [VerveineJ](https://modularmoose.org/moose-wiki/Developers/Parsers/VerveineJ)
> With the command: `& 'D:\Developpement\mse\VerveineJ\verveinej.bat' -o test.json -format json -anchor assoc -autocp .\lib\ .\src`

2. Create a Casino model

```Smalltalk
"create a metamodel with Casino UI, Behavioral, Business, and FAMIX ref"
metamodel := FMMetaModelBuilder metamodelFromPackages: CSNBModel packagesToProcessToCreateMetamodel , CRFModel packagesToProcessToCreateMetamodel, CSNBuModel packagesToProcessToCreateMetamodel.
"Create a model"
gwtModel := CSNUICWModel new name: 'Omaje'; yourself.
"fix the metamodel of the model"
gwtModel metamodel: metamodel.
```

3. Extract the UI with an [extractor]((https://github.com/badetitou?tab=repositories&q=Casino&type=&language=)).



```Smalltalk
xml := (XMLDOMParser parse: 'path/to/myApp.module.xml' asFileReference).

CSNWebModelJava new
  sourceModel: famixModel;
  xml: xml;
  createModelIn: gwtModel.
```

4. Extract the behavior of the UI

```Smalltalk
behavioralModel := CSNBehaviorModelImporterJava new 
  uiModel: gwtModel;
  sourceCodeModel: famixModel;
  resetUIAndGenerateBehavioralModel.
```

5. Extract the business concept (DTO) from services usage

```Smalltalk
businessImporter := CSNBuModelImporter new.
businessImporter buModel: gwtModel.
businessImporter famixModel: famixModel.
gwtModel allCSNServiceAPI do: [ :serviceAPI |  
	businessImporter importForServiceApi: serviceAPI.
].
```

#### Existing JSON file

```SmallTalk
"create a metamodel with Casino UI, Behavioral, Business, and FAMIX ref"
metamodel := FMMetaModelBuilder metamodelFromPackages: CSNBModel packagesToProcessToCreateMetamodel , CRFModel packagesToProcessToCreateMetamodel, CSNBuModel packagesToProcessToCreateMetamodel.

"Create a model"
casinoModel := CSNUICWModel new name: 'MyModel'; yourself.

"fix the metamodel of the model"
casinoModel metamodel: metamodel.

'/path/to/model.json' readStreamDo: [:stream | casinoModel importFromJSONStream: stream ].
```

#### Other existing importers

[In GitHub](https://github.com/search?q=Casino-+-Importer)

### Generate

#### Angular application

6. Export the UI and its behavior

```Smalltalk
"Create an exporter"
exporter := CSNModelExporterAngularBLSpecific new.
exporter model: gwtModel.

"Use the material.angular.io as target library"
exporter exporterAngularConfiguration: CSNExporterAngularMaterialConfiguration new.
exporter attributeExporter: CSNExporterAngularAttribute new.
exporter prepareExport.

"Select export location"
exporter context root: '/path/for/export' asFileReference.
exporter runExport.
"
```

7. Export the data models (DTO)

```Smalltalk
root := (exporter context root / 'models') asFileReference ensureCreateDirectory.
businessExporter := CSNBusinessExporter new modelRoot: root.
businessExporter export: gwtModel.
```

#### Other generators

[In GitHub](https://github.com/search?q=Casino-+-Exporter)

## Developers

If you want to implement your importer, you should look at the `CSNWebModel` class.
This is the abstract importer of Casino.

Here, we will only give hints on the main Casino project, with the GWT importer and Angular Exporter.

- [Add/Customize Angular target widget](./doc/customize-angular-target.md)

## Links

### Other documentation (might be outdated):

- [Personal website page](https://badetitou.github.io/projects/Casino/)

### Linked research papers

In no specific order:

- [GUI Migration using MDE from GWT to Angular 6: An Industrial Case](https://ieeexplore.ieee.org/document/8667989)
- [Challenges for Layout Validation: Lessons Learned](https://hal.inria.fr/hal-02914750/document)
- [Switching of GUI framework: the case from Spec to Spec 2](https://hal.archives-ouvertes.fr/hal-02297858/file/iwst19.pdf)
- [Migrating GWT to Angular 6 using MDE](https://hal.inria.fr/hal-02304301/file/sattose2019.pdf)

## Contacts

Please, for any question [contact me by mail](mailto:badetitou@gmail.com).
