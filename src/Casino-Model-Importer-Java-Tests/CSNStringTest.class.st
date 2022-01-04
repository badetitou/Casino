Class {
	#name : #CSNStringTest,
	#superclass : #TestCase,
	#category : #'Casino-Model-Importer-Java-Tests'
}

{ #category : #tests }
CSNStringTest >> testAllRangesOfSubstringNoSurrouned [
	| string variableNamed |
	string := 'private void showDebugPanel(){
		this.sys = new GwtStatisticsEventSystem();
		this.panelComponent = new DefaultDebugStatisticsDebugPanelComponent(null);
		this.xmlComponent = this.panelComponent.xmlComponent();
		this.logComponent = new DefaultRawLogDebugPanelComponent(this.sys);
		this.em = new GwtExceptionModel();
		DebugPanelWidget debugPanel = new DebugPanelWidget(this, true, new DebugPanelWidget.Component[] {
				this.panelComponent,
				new DefaultExceptionDebugPanelComponent(this.em),
				new DefaultCookieDebugPanelComponent(),
				this.logComponent,
				this.xmlComponent
		});
		BLDialogBox dialogDebug = new BLDialogBox("CORE - Debug Console", debugPanel, true);
		dialogDebug.show();
	}'.
	variableNamed := 'dialogDebug'.
	self assert: (((string allRangesOfSubstringNoSurrouned: variableNamed) collect: #first) includesAll: {607 . 682})
]

{ #category : #tests }
CSNStringTest >> testAllRangesOfSubstringNoSurrounedWithUnderscore [
	
	self assert: ('bl_de' allRangesOfSubstringNoSurrouned: 'bl') equals: #()
]

{ #category : #tests }
CSNStringTest >> testAllRangesOfSubstringNoSurrounedWithoutUnderscore [
	
	self assert: ('bl de' allRangesOfSubstringNoSurrouned: 'bl') equals: { 1 to: 2} asArray
]

{ #category : #tests }
CSNStringTest >> testComplexeThing [
	| string |
	string := '("NIVEAU1LIST -> " + BLLabel.NIVEAU1LIST, BLLabel.NIVEAU1LIST)'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 2) equals: 'BLLabel.NIVEAU1LIST'
]

{ #category : #tests }
CSNStringTest >> testOneBooleanFalse [
	| string |
	string := 'setWidth(false)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'false'.

]

{ #category : #tests }
CSNStringTest >> testOneBooleanTrue [
	| string |
	string := 'setWidth(true)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'true'.

]

{ #category : #tests }
CSNStringTest >> testOneEmptyString [
	| string |
	string := 'setWidth("")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testOneEmptyStringWithScpace [
	| string |
	string := 'setWidth( "" )'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testOneNotEmptyString [
	| string |
	string := 'setWidth("Hello")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
]

{ #category : #tests }
CSNStringTest >> testOneNumberAndOneStringNotEmpty [
	| string |
	string := 'setWidth(1,"Patate")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: 'Patate'.

]

{ #category : #tests }
CSNStringTest >> testOneNumberParam [
	| string |
	string := 'setWidth(1)'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: '1'.
]

{ #category : #tests }
CSNStringTest >> testProtectedString [
	| string |
	string := 'setWidth("Pat\"ate")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Pat\"ate'.

]

{ #category : #tests }
CSNStringTest >> testRemoveComment [
	
	self assert: ('
Hello //   
//   je suis
magnifique // vraiment' removeComment) equals: '
Hello      
            
magnifique            '
]

{ #category : #tests }
CSNStringTest >> testStringWithComma [
	| string |
	string := 'setWidth("Pat,ate")'.
	self assert: string extractParameters size equals: 1.
	self assert: (string extractParameters at: 1) equals: 'Pat,ate'.

]

{ #category : #tests }
CSNStringTest >> testTwoEmptyString [
	| string |
	string := 'setWidth("","")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: ''.
	self assert: (string extractParameters at: 2) equals: ''.

]

{ #category : #tests }
CSNStringTest >> testTwoNotEmptyString [
	| string |
	string := 'setWidth("Hello","World")'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: 'Hello'.
	self assert: (string extractParameters at: 2) equals: 'World'.
]

{ #category : #tests }
CSNStringTest >> testTwoNumbersParam [
	| string |
	string := 'setWidth(1,2)'.
	self assert: string extractParameters size equals: 2.
	self assert: (string extractParameters at: 1) equals: '1'.
	self assert: (string extractParameters at: 2) equals: '2'.
]

{ #category : #tests }
CSNStringTest >> testWithInnerClass [

	| string |
	string := 'addChangeHandler(new ChangeHandler(){
  @Override public void onChange(  ChangeEvent event){
    if (lsEnteteRubrique.getValue() != null) {
      setLigneModifiable(lbCarriere,lsEnteteRubrique,tbLibelle,ftDate,ftVariable,false,false);
      EnteteRubriqueGWT enteteRubriqueGWT=new EnteteRubriqueGWT();
      enteteRubriqueGWT.setId(((EnteteRubriqueDTOGWT)lsEnteteRubrique.getValue()).getId());
      IGwtServiceCoeur.Util.getInstance().prepareElementPaieSimplifieForEnteteRubrique(enteteRubriqueGWT,collectivite,agent,lbCarriere.getSelectedValue(),new SecureAsyncCallback<ElementPaieSimplifieGWT>(){
        @Override public void onSuccess(        final ElementPaieSimplifieGWT elementPaieSimplifieGWT){
          cbActif.setValue(elementPaieSimplifieGWT.getListErreur().isEmpty());
          listCols.set(1,elementPaieSimplifieGWT);
          buildFtVariable(ftVariable,elementPaieSimplifieGWT);
          buildFtDate(ftDate,elementPaieSimplifieGWT,true);
          ((PopupMoisActifs)listCols.get(7)).setToForm(elementPaieSimplifieGWT);
          ((PopupAffectations)listCols.get(8)).setToForm(elementPaieSimplifieGWT);
          setLigneModifiable(lbCarriere,lsEnteteRubrique,tbLibelle,ftDate,ftVariable,cbActif.getValue(),true);
          if (!(elementPaieSimplifieGWT.getListWarn().isEmpty())) {
            for (            String message : elementPaieSimplifieGWT.getListWarn()) {
              BLEventPopup.displayInfo(message);
            }
          }
        }
      }
);
    }
  }
}
)'.
	self assert: string extractParameters size equals: 1.
]
