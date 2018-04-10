*BL-Model-Exporter-Angular
generateModuleSourceCode
	| text |
	text := 'import { NgModule } from ''@angular/core'';
import { CommonModule } from ''@angular/common'';
import { ComponentsModule } from ''../../../components/components.module'';
import { IndexComponent } from ''./components/index/index.component'';
import { PHASE_ROUTES } from ''./' , self name
		,
			'.route'';
'.
	text := text , (self metiers flatCollect: [ :metier | 'import { ' , metier componentName , ' } from ''./components/' , metier getLocalComponentPath ]).
	text := text
		, String crlf , 
			'
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
export class ' , self getModuleClassName , ' {}'.
	^ text