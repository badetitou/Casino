package hello;

import lib.Label;
import lib.Widget;

public class Hello {
    
    public void sourceMethod(){
        Widget w = new Widget();
        Label l = new Label(); 
        anotherMethod(w, l);
    }

    public void anotherMethod(Widget w, Label l) {
        w.add(l);
    }

}