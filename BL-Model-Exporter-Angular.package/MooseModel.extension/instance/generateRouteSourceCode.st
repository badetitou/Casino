*BL-Model-Exporter-Angular
generateRouteSourceCode
	| text |
	text := 'import { ModuleWithProviders } from ''@angular/core'';
import { Routes, RouterModule, PreloadAllModules } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
	{ path: '', pathMatch: ''full'', redirectTo: ''desktop'' },
	{ path: ''desktop'', component: IndexComponent, children: [' , String crlf.
	text := text , (self allBLPhase flatCollect: [ :phase | '		{ path: ''' , phase name , ''', loadChildren: ''./phases/' , phase getLocalModulePath , '''},' , String crlf ]).
	text := text
		,
			']}
];
export const DEMOS_ROUTES: ModuleWithProviders = RouterModule.forRoot(routes, { useHash: false });'.
	^ text