"
I export Services into Angular

- actions
- effects
- reducers
- services
"
Class {
	#name : #CSNModelServiceExporterAngularBLMaterial,
	#superclass : #CSNModelExporterAngular,
	#traits : 'TCSNExporter',
	#classTraits : 'TCSNExporter classTrait',
	#instVars : [
		'rootFolder'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-BLMaterial'
}

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> actionsFolder [

	^ self rootFolder / 'actions'
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> effectsFolder [

	^ self rootFolder / 'effects'
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateAction: aCSNService [
	self actionsFolder ensureCreateDirectory.
	self actionsFolder / (aCSNService uniqueName , '.actions.ts') writeStreamDo: [ :stream | self currentWriteStream: stream ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateEffect: aCSNService [

	self effectsFolder ensureCreateDirectory.
	self effectsFolder / (aCSNService uniqueName , '.effects.ts') writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Injectable } from "@angular/core";
import { SpinnerActions, ToasterActions,ToasterType } from "@bl/bl-app-layout";
import { GlobalStoreService } from "@bl/shared";
import { Actions, createEffect, ofType } from "@ngrx/effects";
import { of } from "rxjs";
import { catchError, concatMap, map, switchMap } from "rxjs/operators";';
			crlf;
			crlf;
			<< '@Injectable()';
			crlf;
			<< 'export class ';
			<<< (aCSNService uniqueName , 'Effects').
		self inBraces: [ 
			self
				<< 'constructor(private actions$: Actions, private booksService: BooksService,  private globalStoreService: GlobalStoreService) {}';
				crlf;
				crlf.
			(aCSNService actions sorted: #uniqueName ascending) do: [ :action | self generateServiceEffectAPI: action ] separatedBy: [ 
				self
					crlf;
					crlf ] ] ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateReducer: aCSNService [

	self reducersFolder ensureCreateDirectory.
	self reducersFolder / (aCSNService uniqueName , '.reducer.ts') writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Action, createFeatureSelector, createReducer, createSelector, on } from "@ngrx/store";';
			crlf;
			crlf;
			<< 'const _';
			<<< aCSNService uniqueName uncapitalized;
			<<< 'Reducer = createReducer'.
		self inParenthesis: [ 
			self
				indentPlus;
				crlf.
			(self << 'initial' <<< aCSNService uniqueName)
				<<< 'State,';
				crlf.
			(aCSNService actions sorted: #uniqueName ascending) do: [ :action | self generateReducerAPI: action ] separatedBy: [ 
				self
					<<< ',';
					crlf ].
			self <<< ')'.
			self
				indentMinus;
				crlf ].
		self
			crlf;
			crlf.
		self << 'export function ' <<< aCSNService uniqueName uncapitalized <<< 'Reducer (state: any, action:Action) '.
		self inBraces: [ self << 'return _' <<< aCSNService uniqueName uncapitalized <<< 'Reducer (state,action)' ].
		'}' ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateReducerAPI: action [

	self << 'on(' <<< action name <<< ', (state, {data}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			self
				<< 'data,';
				crlf.
			self << 'loading: true' ] ].
	self
		<<< '),';
		crlf.
	self << 'on(' <<< action name <<< 'Success, (state, {data}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			self
				<< 'data,';
				crlf.
			self << 'loading: false' ] ].
	self
		<<< '),';
		crlf.
	self << 'on(' <<< action name <<< 'Fail, (state, {error}) =>'.
	self inBraces: [ 
		self << 'return '.
		self inBraces: [ 
			self
				<< '...state,';
				crlf.
			self
				<< 'error,';
				crlf.
			self << 'loading: false' ] ].
]

{ #category : #api }
CSNModelServiceExporterAngularBLMaterial >> generateService: aCSNService [
	self generateServiceFile: aCSNService.
	self generateReducer: aCSNService.
	self generateEffect: aCSNService.
	self generateAction: aCSNService.
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateServiceAPI: aServiceAPI [
		self
		<< '// TODO: Please check this service';
		crlf.
	self << 'public ' <<< aServiceAPI uniqueName <<< '('.
	aServiceAPI printParameterIn: self.

	self <<< '): Observable<'.
	aServiceAPI dataType ifNotNil: [ aServiceAPI dataType writeBusinessTypeOn: self] .
	self <<< '> {'.
	self indentPlus.
	aServiceAPI isGET
		ifTrue: [ aServiceAPI printCreateParamIn: self ]
		ifFalse: [ aServiceAPI printCreateFormDataIn: self ].
	self crlf.
	self << 'return this.http.'.
	aServiceAPI printRestTypeIn: self.
	self <<< '<'.
	aServiceAPI dataType ifNotNil: [ aServiceAPI dataType writeBusinessTypeOn: self] .
	self <<< '>(''/ws/' <<< aServiceAPI serviceOwner targetPoint asKebabCase <<< '/' <<< aServiceAPI name asKebabCase <<< ''''.
	self indentPlus.
	aServiceAPI isPOST
		ifTrue: [ self
				<<< ',';
				crlf;
				<< 'formData' ].
	self
		<<< ', {';
		crlf.
	self << 'withCredentials: true'.
	(aServiceAPI isGET and: [ aServiceAPI source isNotNil and: [ aServiceAPI source parameters isNotEmpty ] ])
		ifTrue: [ self
				<<< ',';
				crlf;
				<< 'params: params' ].
	self
		crlf;
		indentMinus;
		<< '}).pipe(first()'.
	aServiceAPI dataType ifNotNil: [:dateType | dateType innerType isBusinessType
		ifTrue: [ self
				<<< ',';
				crlf;
				indentPlus;
				<< 'map(res => ';
				inBraces: [ self << 'return '.
					aServiceAPI dataType printServiceDeserializeOn: self ];
				<<< ')';
				indentMinus ]].
	self
		crlf;
		<< ');';
		crlf;
		indentMinus;
		<< '}';
		crlf
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLMaterial >> generateServiceEffectAPI: aServiceAPI [

	self generateServiceEffectDefaultAPI: aServiceAPI.
	self crlf crlf.
	self generateServiceEffectSuccessAPI: aServiceAPI.
	self crlf crlf.
	self generateServiceEffectFailAPI: aServiceAPI.
	self crlf crlf
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLMaterial >> generateServiceEffectDefaultAPI: aServiceAPI [
	"effect"
	self << aServiceAPI uniqueName <<< '$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self
			inParenthesis: [ 
				self
					indentPlus;
					crlf;
					<< 'ofType(';
					<<< aServiceAPI uniqueName;
					<<< '),';
					crlf;
					<< 'switchMap'.
				self
					inParenthesis: [ 
						self indentPlus.
						self
							<<< '({data}) => {';
							indentPlus;
							crlf;
							<< 'this.globalStoreService.emitAction(SpinnerActions.show.type,{hidding:false})';
							crlf;
							<< 'return this.';
							<<< aServiceAPI serviceOwner uniqueName;
							<<< '.';
							<<< aServiceAPI uniqueName;
							<<< '(data)';
							<<< '.pipe'.
						self inParenthesis: [ 
							self
								indentPlus;
								crlf.
							self << 'switchMap(async (data: any)=>'.
							self inBraces: [ 
								self
									<< 'return ';
									<<< (aServiceAPI uniqueName , 'Success');
									<<< '({data});' ].
							self
								<<< '),';
								crlf;
								<< 'catchError((error: string) => of(';
								<<< (aServiceAPI uniqueName , 'Fail');
								<<< '({error})))'.
							self
								indentMinus;
								crlf ].
						self
							crlf;
							indentMinus;
							<< '}'.
						self
							indentMinus;
							crlf ];
					indentMinus;
					crlf ];
			indentMinus;
			crlf ]
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLMaterial >> generateServiceEffectFailAPI: aServiceAPI [
	"effect"
	self << aServiceAPI uniqueName <<< 'Fail$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self
			inParenthesis: [ 
				self
					indentPlus;
					crlf;
					<< 'ofType(';
					<<< aServiceAPI uniqueName;
					<<< 'Fail';
					<<< '),';
					crlf;
					<< 'map'.
				self
					inParenthesis: [ 
						self indentPlus.
						self
							<<< '({error}) => {';
							indentPlus;
							crlf;
							<< 'this.globalStoreService.emitAction(ToasterActions.showToaster.type, {toasterType: ToasterType.error, message: "Erreur : " + error})';
							crlf;
							<< 'this.globalStoreService.emitAction(SpinnerActions.hide.type, {})'.
						self
							crlf;
							indentMinus;
							<< '}'.
						self
							indentMinus;
							crlf ];
					indentMinus;
					crlf ];
			indentMinus;
			crlf ]
]

{ #category : #'generating - effect' }
CSNModelServiceExporterAngularBLMaterial >> generateServiceEffectSuccessAPI: aServiceAPI [

	"effect"

	self << aServiceAPI uniqueName <<< 'Success' <<< '$ = createEffect'.
	self inParenthesis: [ 
		self
			indentPlus;
			<<< '() =>';
			crlf;
			<< 'this.actions$.pipe'.
		self
			inParenthesis: [ 
				self
					indentPlus;
					crlf;
					<< 'ofType(';
					<<< (aServiceAPI uniqueName , 'Success');
					<<< '),';
					crlf;
					<< 'map'.
				self
					inParenthesis: [ 
						self indentPlus.
						self
							<<< '() => {';
							indentPlus;
							crlf.
						self
							<< 'this.globalStoreService.emitAction(ToasterActions.showToaster.type, {toasterType: ToasterType.success, message: "Success"})';
							crlf;
							<< 'this.globalStoreService.emitAction(SpinnerActions.hide.type, {})'.
						self
							crlf;
							indentMinus;
							<< '}'.
						self
							indentMinus;
							crlf ];
					indentMinus;
					crlf ];
			indentMinus;
			crlf ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> generateServiceFile: aCSNService [

	self serviceFolder ensureCreateDirectory.
	self serviceFolder / aCSNService getTSName writeStreamDo: [ :stream | 
		self currentWriteStream: stream.
		self
			<< 'import { Injectable } from ''@angular/core'';

import { Observable } from ''rxjs'';
import { first, map } from ''rxjs/operators'';

import { HttpClient, HttpHeaders, HttpParams } from ''@angular/common/http'';
import { ObjectMapper } from ''@outfoxx/jackson-js'';
import { MapToStringJsonConverterService } from ''app/projects/bl-shell/src/public-api'';
';
			crlf;
			crlf.

		self printServiceDependencies: aCSNService.

		self << '/**
 * Generated By Casino
 *
 * @author Benoît Verhaeghe
 */
@Injectable()
export class ' << aCSNService uniqueName << ' {

    private objectMapper: ObjectMapper;

    constructor(private http: HttpClient,
        private mapToStringConverter: MapToStringJsonConverterService) {
        this.objectMapper = new ObjectMapper({},
            { features: { deserialization: { FAIL_ON_UNKNOWN_PROPERTIES: false } }});
    }

'.
		(aCSNService actions sorted: #uniqueName ascending)
			do: [ :action | 
				self indentPlus.
				self generateServiceAPI: action.
				self indentMinus ]
			separatedBy: [ self crlf ].
		self
			<< '}';
			crlf ]
]

{ #category : #generating }
CSNModelServiceExporterAngularBLMaterial >> printServiceDependencies: aCSNService [
	aCSNService dependencies
		ifNotEmpty: [ :dependencies | 
			self << 'import { '; indentPlus.
			(dependencies asOrderedCollection sorted: #name ascending)
				do: [ :dependency | self <<< dependency name ]
				separatedBy: [ self
						<<< ',';
						crlf;
						indent ].
			self <<< ' } from ''../models'';'; indentMinus.
			self
				crlf;
				crlf ]
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> reducersFolder [

	^ self rootFolder / 'reducers'
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> rootFolder [

	^ rootFolder
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> rootFolder: anObject [

	rootFolder := anObject
]

{ #category : #accessing }
CSNModelServiceExporterAngularBLMaterial >> serviceFolder [

	^ self rootFolder / 'services'
]
