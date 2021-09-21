package hello;

import lib.Bla;
import lib.Label;
import lib.Widget;

public class MethodReturnNearlyDirect {
    void build() {
        Widget w = new Widget().add(newLabel());
    }

    Label newLabel() {
        Label l = new Label();
        new Bla();
        return l;
    }
}
