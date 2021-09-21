Class {
	#name : #CSNWebModelJavaPageTest,
	#superclass : #CSNWebModelJavaTest,
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #setUp }
CSNWebModelJavaPageTest >> setUp [

	| pageConsole pageLog csnNamespace coreNamespace abstractHomeClass homePage inheritance |
	super setUp.
	uiImporter xml: (XMLDOMParser parse: self xmlContent).
	pageConsole := FamixJavaClass new
		               name: #PageConsole;
		               yourself.
	pageLog := FamixJavaClass new
		           name: #PageLog;
		           yourself.
	abstractHomeClass := FamixJavaClass new
		                     name: #HomePhaseController;
		                     yourself.
	homePage := FamixJavaClass new
		            name: #HomePage;
		            yourself.
	inheritance := FamixJavaInheritance new
		               superclass: abstractHomeClass;
		               subclass: homePage;
		               yourself.
	csnNamespace := FamixJavaPackage new
		                name: #csn;
		                addType: homePage;
		                addType: abstractHomeClass;
		                yourself.
	coreNamespace := FamixJavaPackage new
		                 name: #core;
		                 parentPackage: csnNamespace;
		                 addType: pageConsole;
		                 addType: pageLog;
		                 yourself.
	uiImporter sourceModel silentlyAddAll: { 
			pageConsole.
			pageLog.
			csnNamespace.
			coreNamespace.
			homePage.
			abstractHomeClass.
			inheritance }
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
			(((uiImporter model allWithType: CSNPage) collect: #shortcut)
				includesAll: {#'###' . #'###' . #LOG}).
	self
		assert:
			(((uiImporter model allWithType: CSNPage) collect: #realClassName)
				includesAll: {#'csn::HomePage' . #'csn::core::PageConsole' . #'csn::core::PageLog'})
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
