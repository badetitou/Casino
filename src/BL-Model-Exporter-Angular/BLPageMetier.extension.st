Extension { #name : #BLPageMetier }

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> accept: anExporter [
	anExporter visitBLPageMetier: self
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> behaviors [
	^ (self collectPhaseCalled
		ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ]
		ifEmpty: [ '' ])
		,
			(self calledBehavior
				flatCollect: [ :actionService | actionService initializeVariable , ', ' ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> calledBehavior [
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget behaviors ]) flattened asSet
		asOrderedCollection
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> collectPhaseCalled [
	^ (self recursiveWidgets flatCollect: [ :localWidget | localWidget actions collect: #call ]) asSet asOrderedCollection 
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> generateHTMLSourceCode [
	| text |
	text := ''.
	self metiers
		ifNotEmpty: [ text := text , '<bl-tabs>' , String crlf
				,
					(self metiers
						flatCollect: [ :metier | 
							'    <bl-tab title=' , (BLModelExporterAngular convertIfString: metier title) , '>'
								, String crlf , '        ' , metier getTag , String crlf , '    </bl-tab>'
								, String crlf ]) , '</bl-tabs>' , String crlf ].
	text := text , (self sortedWidget flatCollect: [ :widget | widget getDom , String crlf ]).
	^ text
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> generateTSSourceCode [
	^ '
import {
    Component,
    OnDestroy,
    OnInit,
    ViewChild,
    ViewContainerRef
} from ''@angular/core'';
'
		,
			(self collectPhaseCalled
				ifNotEmpty:
					[ 'import { DesktopStateService } from ''../../../../../components/service/desktop-state.service'';
import { Phase } from ''../../../../../components/service/model/phase/phase.model'';
import { PhaseService } from ''../../../../../components/service/phase.service'';
' ]) , self widgetsDependencies, self getBehaviorImportString
		,
			'

@Component({
    selector: ''' , self getSelector
		,
			''',
    templateUrl: ''./' , self getHTMLName
		,
			'''
})
export class ' , self componentName capitalized
		,
			' implements OnInit, OnDestroy {

'
		,
			(self collectPhaseCalled
				flatCollect: [ :phase | '    public ' , phase name , ': Phase;' , String crlf ])
		, (self recursiveWidgets flatCollect: [ :widget | widget idViewChild ])
		,
			'
' , (self recursiveWidgets flattened flatCollect: #getVariables)
		,
			'

    constructor(' , self behaviors
		,
			') {
'
		,
			(self collectPhaseCalled
				flatCollect: [ :phase | 
					'        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');'
						, String crlf ])
		,
			'
    }

    public ngOnInit(): void {
' , (self recursiveWidgets flattened flatCollect: #getInitializations)
		,
			'
    }

    public ngOnDestroy(): void {

    }
'
		,
			(self collectPhaseCalled
				ifNotEmpty: [ String crlf
						,
							'    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ])
		,
			'

'
		,
			((self recursiveWidgets flatCollect: #attributes)
				flatCollect: [ :attribute | attribute attributeMethod ])
		,
			'
}
'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getAcceptedName [
	^ (self name splitOn: ':') last
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getBehaviorImportString [
	^ ''
		,
			(self calledBehavior
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction serviceOwner mooseName , ' } from ''' , self relativePathToHome
						, serviceAction serviceOwner getLocalPath , ''';' , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getDom [
	^ ''
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getFolderName [
	^ self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getHTMLName [
	^ self getAcceptedName  , '.component.html'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getLocalComponentPath [
	" return pageMetierName/pageMetierName.component"

	^ self getLocalPath , '/' , self getAcceptedName , '.component'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getLocalPath [
	" return   pageMetierName/pageMetierName.component"

	^ (self container) getLocalPath , '/components/' , self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getSelector [
	^  (self container ) getSelector , '-' , self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getTSName [
	^ self getAcceptedName  , '.component.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> getTag [
	^ '<', self getSelector , '>', '</', self getSelector , '>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> isPageMetier [
	^ true
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> metiers [
	^ self sortedWidget select: [ :widget | widget isPageMetier  ]
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> recursiveWidgetsWithoutMetiers [
	^ (self widgetsNotPageMetier  , (self widgetsNotPageMetier  collect: #recursiveWidgets)) flattened
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> rootFromExporter: anExporter [ 
	^ ((self container) componentsRootFromExporter: anExporter) /  (self getAcceptedName )
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> widgetsDependencies [
	^ ''
		,
			((self recursiveWidgets collect: #getExternalDependencies) flattened asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLPageMetier >> widgetsNotPageMetier [
	^ self widgets reject: [ :widget | widget isPageMetier ]
]
