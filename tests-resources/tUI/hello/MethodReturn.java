package hello;

import lib.Label;
import lib.Widget;

public class MethodReturn {
    void build () {
        Widget w = new Widget().add(newLabel());
    }

    Label newLabel() {
        Label l = new Label();
        return l;
    }
}
