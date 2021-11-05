Class {
	#name : #CSNExporterAngularAttribute,
	#superclass : #CSNModelVisitor,
	#traits : 'TCSNExporter + TAngularExporter',
	#classTraits : 'TCSNExporter classTrait + TAngularExporter classTrait',
	#category : #'Casino-Model-Exporter-Angular'
}

{ #category : #visiting }
CSNExporterAngularAttribute >> visitCSNAttribute: aCSNAttribute [
	self <<< (self protectString: aCSNAttribute attributeValue) 
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
