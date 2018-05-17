*BL-Model-Exporter-Angular
exportCode
	^ 'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs/Observable'';
import { of } from ''rxjs/observable/of'';

import { HttpClient, HttpHeaders } from ''@angular/common/http'';

@Injectable()
export class ' , self mooseName
		,
			' {

    constructor(private http: HttpClient) {
    }

' , (self actions flatCollect: [ :action | action exportCode , String crlf ])
		,
			'

}'