"
""LOAD FAST""
""
FAST - Core
importer - 7
model - 76
resolution - 57
tools - 23

FAST - Java
importer - 14
model - 25
extension - 1
tools - 8

""
""Reset Work""
MooseModel resetRoot.
MooseModel resetMeta.

""Generate BlApp""
mseFile := StandardFileStream fileNamed: 'D:\Users\benoit.verhaeghe\Documents\PFE\GeneralXmlui.mse' .
mooseModel := MooseModel importFromMSEStream: mseFile .
mooseModel rootFolder: 'D:\Users\benoit.verhaeghe\Documents\PFE\'.

""Generate Bl Model""
model := MooseModel new name: 'Showroom'; yourself.
BLMooseModelCreatorAngular runOn: model fromSourceModel: mooseModel and:  'D:\Users\benoit.verhaeghe\Documents\PFE\Source\BLCoreIncubatorGwt\src\fr\bl\application.module.xml'.

BLGlobalView new openViewForModel: model.

""Add Model to moose panel""
MooseModel root add: model.

model := BLModelExample generateModelWithTwoPhasesAndThreePageMetierAnd1Widget.
BLModelExporterAngularBLSpecific export: model.
"
Class {
	#name : #CSNModelExporterAngularBLSpecific,
	#superclass : #CSNModelExporterAngular,
	#category : #'Casino-Model-CoreWeb-Exporter'
}

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorImportExporter [
	^ CSNModelImportStringExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorInitializeVariableExporter [
	^ CSNModelInitializeVariableExporter
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> behaviorModelExporter [
	^ CSNBehaviorModelExporterCoreWeb
]

{ #category : #generate }
CSNModelExporterAngularBLSpecific >> generateTSSourceCodeForBusinessPage: aBLPageMetier [
  currentWriteStream
     << '
import {
';
     << self businessPageImportList;
     << '
} from ''@angular/core'';
';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ 'import { DesktopStateService } from ''app/components/service/desktop-state.service'';
import { Phase } from ''app/components/service/model/phase/phase.model'';
import { PhaseService } from ''app/components/service/phase.service'';
' ]);
     << aBLPageMetier widgetsDependencies;
     << (String crlf join: (aBLPageMetier calledBehavior flatCollect: [:behavior |  self behaviorImportExporter export: behavior withContext: self context ]) flattened asOrderedCollection removeDuplicates);
     << '

@Component({
    selector: ''';
     << aBLPageMetier getSelector;
     << ''',
    templateUrl: ''./';
     << aBLPageMetier getHTMLName;
     << '''
})
export class ';
     << aBLPageMetier componentName capitalized;
     << ' implements OnInit, OnDestroy {

';
     << (aBLPageMetier collectPhaseCalled flatCollect: [:phase |  '    public ' , phase name , ': Phase;' , String crlf ]);
     << (((aBLPageMetier calledBehavior flatCollect: [ :action  | action behavior flatCollect: [:behavior | (behavior allToScope: CSNBDOMElementAcccess) collect: #widget  ] ]) asSet) collect: [:widget |  widget idViewChild]) asOrderedCollection;
     << '
';
     << (aBLPageMetier recursiveWidgets removeDuplicates flattened flatCollect: #getVariables);
     << '

    constructor(private renderer: Renderer2, ';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ ' protected _desktopStateService: DesktopStateService, private _phaseService: PhaseService, ' ] ifEmpty: [ '' ]);
     << (', ' join: ((((aBLPageMetier calledBehavior collect: [:behavior | self behaviorInitializeVariableExporter export: behavior withContext: self context ])) flattened) reject: #isEmpty) flattened asOrderedCollection removeDuplicates);
     << ') {
';
     << (aBLPageMetier collectPhaseCalled flatCollect: [:phase |  '        this.' , phase name , ' = this._phaseService.getPhase(''' , phase name , ''');' , String crlf ]);
     << '
    }

    public ngOnInit(): void {
';
     << (aBLPageMetier recursiveWidgets flattened flatCollect: #getInitializations);
     << '
    }

    public ngOnDestroy(): void {

    }
';
     << (aBLPageMetier collectPhaseCalled ifNotEmpty: [ String crlf , '    public openPhase(phase: Phase): void {
        this._desktopStateService.selectPhase(phase);
    }' ]);
     << '

';
     << ('' , (aBLPageMetier calledBehavior flatCollect: [:action |  action behavior flatCollect: [:behaveMethod |  '/*' , String crlf , (self behaviorModelExporter export: behaveMethod) , '*/' , String crlf ] ] as: OrderedCollection) indentBy: 4);
     << '
}
'
]
