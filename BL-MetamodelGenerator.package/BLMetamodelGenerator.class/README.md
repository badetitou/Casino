| generator |
generator := BLMetamodelGenerator new.
generator builder traitsFlattening: true.
generator generate.
BLMetamodelGenerator resetMetamodel.