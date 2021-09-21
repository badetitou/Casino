package hello;

import lib.Label;
import lib.Widget;

public class MethodReturnDirect {
    void build () {
        Widget w = new Widget().add(newLabel());
    }

    Label newLabel() {
        return new Label();
    }
}
