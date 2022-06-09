package hello.twoclasses;

import lib.Widget;

public class ChildClass extends Widget {
    public ChildClass() {
        Widget innerWidget1 = new Widget();
        Widget innerWidget2 = new Widget();
        Widget innerWidget3 = new Widget();
        setWidgets(innerWidget1, innerWidget2, innerWidget3);
    }

}
