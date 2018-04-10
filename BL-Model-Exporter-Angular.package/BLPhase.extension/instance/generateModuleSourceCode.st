*BL-Model-Exporter-Angular
generateModuleSourceCode
	^ '
export const COMPONENTS: any[] = [
    IndexComponent,
' , self getComponentsPageMetierListName
		,
			'
];

@NgModule({
    declarations: [
        COMPONENTS
    ],
    imports: [
        CommonModule,
        PHASE_ROUTES,

        ComponentsModule
    ],
    entryComponents: [
        IndexComponent
    ]
})
export class ' , self name , 'Module {}'