Class {
	#name : #CSNWebModelJavaPageTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #running }
CSNWebModelJavaPageTest >> setUp [
	| pageConsole pageLog csnNamespace coreNamespace |
	super setUp.
	uiImporter xml: (PPXmlParser parse: self xmlContent).
	pageConsole := FAMIXClass new
		name: #PageConsole;
		yourself.
	pageLog := FAMIXClass new
		name: #PageLog;
		yourself.
	csnNamespace := FAMIXNamespace new
		name: #csn;
		yourself.
	coreNamespace := FAMIXNamespace new
		name: #core;
		parentScope: csnNamespace;
		addType: pageConsole;
		addType: pageLog;
		yourself.
	uiImporter sourceModel
		silentlyAddAll:
			{pageConsole.
			pageLog.
			csnNamespace.
			coreNamespace}
]

{ #category : #tests }
CSNWebModelJavaPageTest >> testGeneratePhase [
	uiImporter generatePhase.
	self assert: (uiImporter model allWithType: CSNPage) size equals: 3
]

{ #category : #resources }
CSNWebModelJavaPageTest >> xmlContent [
	^ '<application name="example" version="1.0">
	<module name="BL_HOME_PHASE_MODULE">
		<phase codePhase="PHASE_HOME" codeValue="PHASE_HOME" raccourci="###" />
	</module>
	<module name="Core">
		<!-- comment -->	
		<phase codePhase="PAGE_CONSOLE" codeValue="PAGE_CONSOLE" className="csn.core.PageConsole" raccourci="###" />
		<!-- other comment -->	
		<phase codePhase="PAGE_LOG" codeValue="PAGE_LOG" className="csn.core.PageLog" raccourci="LOG" />
		</module>
</application>'
]
