model := (MooseModel root allModels select: [ :model | model name = 'BLCoreIncubatorGwt' ]) at: 1.
ac := AnalyseCommand new.
ac getCompositeFromModel: model