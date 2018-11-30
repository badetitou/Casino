Extension { #name : #BLBusinessPage }

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> behaviors [
	^ (self collectPhaseCalled
		ifNotEmpty: [ 'protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ]
		ifEmpty: [ '' ])
		,
			(self calledBehavior
				flatCollect: [ :actionService | actionService initializeVariable , ', ' ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> calledBehavior [
	^ (self recursiveWidgetsWithoutMetiers
		collect: [ :widget | widget behaviors ]) flattened asSet
		asOrderedCollection
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> collectPhaseCalled [
	
	^ (self recursiveWidgets flattened flatCollect: [ :localWidget | localWidget actions collect: #call thenSelect: #isNotNil  ]) asSet asOrderedCollection
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> generateHTMLSourceCodeWith: aVisitor [
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
	text := text , ((self widgets select: [:widget | (widget isKindOf: BLBusinessPage) not ]) flatCollect: [ :widget | (aVisitor visit: widget) , String crlf ]).
	^ text
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> generateTSSourceCode [
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
					[ 'import { DesktopStateService } from ''../', (self relativePathToHome), 'components/service/desktop-state.service'';
import { Phase } from ''../', (self relativePathToHome), 'components/service/model/phase/phase.model'';
import { PhaseService } from ''../', (self relativePathToHome), 'components/service/phase.service'';
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
		, (self recursiveWidgets flattened flatCollect: [ :widget | widget idViewChild ])
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
		",
			((self recursiveWidgets flatCollect: #attributes)
				flatCollect: [ :attribute | attribute attributeMethod ])"
		,
			'
}
'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getAcceptedName [
	^ (self name splitOn: ':') last
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getBehaviorImportString [
	^ ''
		,
			(self calledBehavior
				flatCollect: [ :serviceAction | 
					'import { ' , serviceAction serviceOwner uniqueName , ' } from ''' , self relativePathToHome
						, serviceAction serviceOwner getLocalPath , ''';' , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getFolderName [
	^ self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getHTMLName [
	^ self getAcceptedName  , '.component.html'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getLocalComponentPath [
	" return pageMetierName/pageMetierName.component"

	^ self getLocalPath , '/' , self getAcceptedName , '.component'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getLocalPath [
	" return   pageMetierName/pageMetierName.component"

	^ (self container) getLocalPath , '/components/' , self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getSelector [
	^  (self container ) getSelector , '-' , self getAcceptedName
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getTSName [
	^ self getAcceptedName  , '.component.ts'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> getTag [
	^ '<', self getSelector , '>', '</', self getSelector , '>'
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> isPageMetier [
	^ true
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> recursiveWidgetsWithoutMetiers [
	^ (self widgetsNotPageMetier  , (self widgetsNotPageMetier  collect: #recursiveWidgets)) flattened
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> rootFromExporter: anExporter [ 
	^ ((self container) componentsRootFromExporter: anExporter) /  (self getAcceptedName )
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> widgetsDependencies [
	^ ''
		,
			((self recursiveWidgets flattened collect: #getExternalDependencies) flattened asSet asOrderedCollection
				flatCollect: [ :dependency | dependency importString , String crlf ])
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLBusinessPage >> widgetsNotPageMetier [
	^ self widgets reject: [ :widget | widget isPageMetier ]
]
