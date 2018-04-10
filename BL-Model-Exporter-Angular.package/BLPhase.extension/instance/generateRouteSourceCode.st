*BL-Model-Exporter-Angular
generateRouteSourceCode
	^ 'import { ModuleWithProviders } from ''@angular/core'';
import { RouterModule, Routes } from ''@angular/router'';
import { IndexComponent } from ''./components/index/index.component'';

const routes: Routes = [
    {
        path: '''', component: IndexComponent
    }
];

export const PHASE_ROUTES: ModuleWithProviders = RouterModule.forChild(routes);
'