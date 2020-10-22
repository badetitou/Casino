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
	self assert: (uiImporter model allWithType: CSNPage) size equals: 3.
	self
		assert:
			(((uiImporter model allWithType: CSNPage) collect: #codePhase)
				includesAll: {#PHASE_HOME . #PAGE_CONSOLE . #PAGE_LOG}).
	self
		assert:
			(((uiImporter model allWithType: CSNPage) collect: #codeValue)
				includesAll: {#PHASE_HOME_ . #PAGE_CONSOLE_ . #PAGE_LOG_}).
	self
		assert:
			(((uiImporter model allWithType: CSNPage) collect: #realClassName)
				includesAll: {#'STUB C/S' . #'csn::core::PageConsole' . #'csn::core::PageLog'})
]

{ #category : #resources }
CSNWebModelJavaPageTest >> xmlContent [
	^ '<application name="example" version="1.0">
	<module name="BL_HOME_PHASE_MODULE">
		<phase codePhase="PHASE_HOME" codeValue="PHASE_HOME_" raccourci="###" />
	</module>
	<module name="Core">
		<!-- comment -->	
		<phase codePhase="PAGE_CONSOLE" codeValue="PAGE_CONSOLE_" className="csn.core.PageConsole" raccourci="###" />
		<!-- other comment -->	
		<phase codePhase="PAGE_LOG" codeValue="PAGE_LOG_" className="csn.core.PageLog" raccourci="LOG" />
		</module>
</application>'
]
