package hello;

public class Hello {
   private void _testDialogBox() {		
		
		final BLLinkLabel _llTestModalDialog = new BLLinkLabel("Boite de dialogue modale");
		_llTestModalDialog.addClickHandler(new ClickHandler(){
			@Override
			public void onClick(ClickEvent event) {
				IBLDialogBox db = new BLDialogBox(_llTestModalDialog.getText(), true);				
				db.show();
			}
		});
	}

}