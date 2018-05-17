*BL-Model-Exporter-Angular
exportCode
	^ '    public ' , self name, self mooseID asString 
		,
			'(): Observable<Object> {
        return this.http.get<Object>(''THE URL''); // TODO Add real URL
    }
'