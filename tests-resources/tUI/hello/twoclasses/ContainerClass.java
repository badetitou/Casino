package hello.twoclasses;

import lib.WidgetPage;

public class ContainerClass extends WidgetPage {

    private ChildClass child;

    public ContainerClass () {
        child = new ChildClass();
        setContent(child);
    }

}
