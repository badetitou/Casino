"LOAD FAST"
"
FAST - Core
importer - 7
model - 76
resolution - 57
tools - 23

FAST - Java
importer - 14
model - 25
extension - 1
tools - 8

"
"Reset Work"
MooseModel resetRoot.
MooseModel resetMeta.

"Generate BlApp"
mseFile := StandardFileStream fileNamed: 'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.

"Generate Bl Model"
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

BLGlobalView new openViewForModel: model.

"Add Model to moose panel"
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngularBLSpecific export: model.