accessing
widget
	^ self model allModelClasses
		select: [ :e | ((e superclassHierarchyGroup collect: #name) includes: 'AbstractBLComposite') and: ('fr::bl::client::core::refui::*' match: e container mooseName) ]