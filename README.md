# Casino <!-- omit in toc -->

![Build Pass](https://github.com/badetitou/Casino/workflows/CI/badge.svg)
[![Moose version](https://img.shields.io/badge/Moose-8-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)
[![Moose version](https://img.shields.io/badge/Moose-9-%23aac9ff.svg)](https://github.com/moosetechnology/Moose)

- [About](#about)
- [Included](#included)
- [Installation](#installation)
- [Repository architecture](#repository-architecture)
- [Start](#start)
## About

This project aims to ease the migration of application front-end using meta-models.
To do so, it extracts the UI model of an application and generates the target application from the model.

This repository includes the whole work needed to migrate a GWT application to an Angular one.
Other importers and exporters are [available](https://github.com/badetitou?tab=repositories&q=Casino&type=&language=).

## Included

This repository contains the main packages of Casino.
It includes:

- A meta-model to represent the front-end of an application
- An Importer for this meta-model
- An Exporter for this meta-model
- A Specific Importer for Java
- A Specific Exporter to Angular

It also contains some specific package for a company (but you don't need to know)

## Installation

To install Casino:

1. Download the last [Moose Image](https://github.com/moosetechnology/Moose)
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

## Start

If you want to implement your own importer, you should look at the `CSNWebModel` class.
This is the abstract importer of Casino.
