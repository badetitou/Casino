Extension { #name : #CSNBCall }

{ #category : #'*Casino-Behavior-Model-Exporter-CoreWeb' }
CSNBCall >> importString [
	^ 'import { ', self distantService serviceOwner uniqueName ,' } from ''', (self distantService serviceOwner getLocalPath) ,''';'
]
