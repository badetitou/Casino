Class {
	#name : #CSNExporterAngularAttribute,
	#superclass : #CSNModelVisitor,
	#traits : 'TCSNExporter + TAngularExporter',
	#classTraits : 'TCSNExporter classTrait + TAngularExporter classTrait',
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNAttribute: aCSNAttribute [

 | shouldInterpolate | 
   
    shouldInterpolate := aCSNAttribute attributeAt: #shouldInterpolate ifAbsent: [ true ].
    shouldInterpolate ifFalse: [ self <<< '''' ].
    self <<< (self protectString: aCSNAttribute attributeValue).
    shouldInterpolate ifFalse: [ self <<< '''' ].


	
]

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNUIAbsoluteHeight: aBLUIAbsoluteHeight [
  self
     <<< (self protectString: aBLUIAbsoluteHeight attributeValue);
     <<< 'px'
]

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNUIAbsoluteWidth: aBLUIAbsoluteWidth [
	self
		<<< (self protectString: aBLUIAbsoluteWidth attributeValue);
		<<< 'px'
]

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNUIRelativeHeight: aBLUIRelativeHeight [
  self
     <<< (self protectString: aBLUIRelativeHeight attributeValue);
     <<< '%'
]

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNUIRelativeWidth: aBLUIRelativeWidth [
  self
     <<< (self protectString: aBLUIRelativeWidth attributeValue);
     <<< '%'
]
