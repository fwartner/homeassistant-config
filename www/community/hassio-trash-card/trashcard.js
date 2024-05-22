var e="https://github.com/idaho/hassio-trash-card";function t(e,t,r,a){var i,n=arguments.length,o=n<3?t:null===a?a=Object.getOwnPropertyDescriptor(t,r):a;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)o=Reflect.decorate(e,t,r,a);else for(var s=e.length-1;s>=0;s--)(i=e[s])&&(o=(n<3?i(o):n>3?i(t,r,o):i(t,r))||o);return n>3&&o&&Object.defineProperty(t,r,o),o}"function"==typeof SuppressedError&&SuppressedError;const r=e=>`${e.getFullYear()}-${`${e.getMonth()+1}`.padStart(2,"0")}-${`${e.getDate()}`.padStart(2,"0")}`,a=window,i=a.ShadowRoot&&(void 0===a.ShadyCSS||a.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,n=Symbol(),o=new WeakMap;let s=class{constructor(e,t,r){if(this._$cssResult$=!0,r!==n)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=e,this.t=t}get styleSheet(){let e=this.o;const t=this.t;if(i&&void 0===e){const r=void 0!==t&&1===t.length;r&&(e=o.get(t)),void 0===e&&((this.o=e=new CSSStyleSheet).replaceSync(this.cssText),r&&o.set(t,e))}return e}toString(){return this.cssText}};const l=(e,...t)=>{const r=1===e.length?e[0]:t.reduce(((t,r,a)=>t+(e=>{if(!0===e._$cssResult$)return e.cssText;if("number"==typeof e)return e;throw Error("Value passed to 'css' function must be a 'css' function result: "+e+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(r)+e[a+1]),e[0]);return new s(r,e,n)},c=i?e=>e:e=>e instanceof CSSStyleSheet?(e=>{let t="";for(const r of e.cssRules)t+=r.cssText;return(e=>new s("string"==typeof e?e:e+"",void 0,n))(t)})(e):e
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */;var d;const u=window,h=u.trustedTypes,m=h?h.emptyScript:"",p=u.reactiveElementPolyfillSupport,g={toAttribute(e,t){switch(t){case Boolean:e=e?m:null;break;case Object:case Array:e=null==e?e:JSON.stringify(e)}return e},fromAttribute(e,t){let r=e;switch(t){case Boolean:r=null!==e;break;case Number:r=null===e?null:Number(e);break;case Object:case Array:try{r=JSON.parse(e)}catch(e){r=null}}return r}},f=(e,t)=>t!==e&&(t==t||e==e),y={attribute:!0,type:String,converter:g,reflect:!1,hasChanged:f},v="finalized";let b=class extends HTMLElement{constructor(){super(),this._$Ei=new Map,this.isUpdatePending=!1,this.hasUpdated=!1,this._$El=null,this._$Eu()}static addInitializer(e){var t;this.finalize(),(null!==(t=this.h)&&void 0!==t?t:this.h=[]).push(e)}static get observedAttributes(){this.finalize();const e=[];return this.elementProperties.forEach(((t,r)=>{const a=this._$Ep(r,t);void 0!==a&&(this._$Ev.set(a,r),e.push(a))})),e}static createProperty(e,t=y){if(t.state&&(t.attribute=!1),this.finalize(),this.elementProperties.set(e,t),!t.noAccessor&&!this.prototype.hasOwnProperty(e)){const r="symbol"==typeof e?Symbol():"__"+e,a=this.getPropertyDescriptor(e,r,t);void 0!==a&&Object.defineProperty(this.prototype,e,a)}}static getPropertyDescriptor(e,t,r){return{get(){return this[t]},set(a){const i=this[e];this[t]=a,this.requestUpdate(e,i,r)},configurable:!0,enumerable:!0}}static getPropertyOptions(e){return this.elementProperties.get(e)||y}static finalize(){if(this.hasOwnProperty(v))return!1;this[v]=!0;const e=Object.getPrototypeOf(this);if(e.finalize(),void 0!==e.h&&(this.h=[...e.h]),this.elementProperties=new Map(e.elementProperties),this._$Ev=new Map,this.hasOwnProperty("properties")){const e=this.properties,t=[...Object.getOwnPropertyNames(e),...Object.getOwnPropertySymbols(e)];for(const r of t)this.createProperty(r,e[r])}return this.elementStyles=this.finalizeStyles(this.styles),!0}static finalizeStyles(e){const t=[];if(Array.isArray(e)){const r=new Set(e.flat(1/0).reverse());for(const e of r)t.unshift(c(e))}else void 0!==e&&t.push(c(e));return t}static _$Ep(e,t){const r=t.attribute;return!1===r?void 0:"string"==typeof r?r:"string"==typeof e?e.toLowerCase():void 0}_$Eu(){var e;this._$E_=new Promise((e=>this.enableUpdating=e)),this._$AL=new Map,this._$Eg(),this.requestUpdate(),null===(e=this.constructor.h)||void 0===e||e.forEach((e=>e(this)))}addController(e){var t,r;(null!==(t=this._$ES)&&void 0!==t?t:this._$ES=[]).push(e),void 0!==this.renderRoot&&this.isConnected&&(null===(r=e.hostConnected)||void 0===r||r.call(e))}removeController(e){var t;null===(t=this._$ES)||void 0===t||t.splice(this._$ES.indexOf(e)>>>0,1)}_$Eg(){this.constructor.elementProperties.forEach(((e,t)=>{this.hasOwnProperty(t)&&(this._$Ei.set(t,this[t]),delete this[t])}))}createRenderRoot(){var e;const t=null!==(e=this.shadowRoot)&&void 0!==e?e:this.attachShadow(this.constructor.shadowRootOptions);return((e,t)=>{i?e.adoptedStyleSheets=t.map((e=>e instanceof CSSStyleSheet?e:e.styleSheet)):t.forEach((t=>{const r=document.createElement("style"),i=a.litNonce;void 0!==i&&r.setAttribute("nonce",i),r.textContent=t.cssText,e.appendChild(r)}))})(t,this.constructor.elementStyles),t}connectedCallback(){var e;void 0===this.renderRoot&&(this.renderRoot=this.createRenderRoot()),this.enableUpdating(!0),null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostConnected)||void 0===t?void 0:t.call(e)}))}enableUpdating(e){}disconnectedCallback(){var e;null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostDisconnected)||void 0===t?void 0:t.call(e)}))}attributeChangedCallback(e,t,r){this._$AK(e,r)}_$EO(e,t,r=y){var a;const i=this.constructor._$Ep(e,r);if(void 0!==i&&!0===r.reflect){const n=(void 0!==(null===(a=r.converter)||void 0===a?void 0:a.toAttribute)?r.converter:g).toAttribute(t,r.type);this._$El=e,null==n?this.removeAttribute(i):this.setAttribute(i,n),this._$El=null}}_$AK(e,t){var r;const a=this.constructor,i=a._$Ev.get(e);if(void 0!==i&&this._$El!==i){const e=a.getPropertyOptions(i),n="function"==typeof e.converter?{fromAttribute:e.converter}:void 0!==(null===(r=e.converter)||void 0===r?void 0:r.fromAttribute)?e.converter:g;this._$El=i,this[i]=n.fromAttribute(t,e.type),this._$El=null}}requestUpdate(e,t,r){let a=!0;void 0!==e&&(((r=r||this.constructor.getPropertyOptions(e)).hasChanged||f)(this[e],t)?(this._$AL.has(e)||this._$AL.set(e,t),!0===r.reflect&&this._$El!==e&&(void 0===this._$EC&&(this._$EC=new Map),this._$EC.set(e,r))):a=!1),!this.isUpdatePending&&a&&(this._$E_=this._$Ej())}async _$Ej(){this.isUpdatePending=!0;try{await this._$E_}catch(e){Promise.reject(e)}const e=this.scheduleUpdate();return null!=e&&await e,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){var e;if(!this.isUpdatePending)return;this.hasUpdated,this._$Ei&&(this._$Ei.forEach(((e,t)=>this[t]=e)),this._$Ei=void 0);let t=!1;const r=this._$AL;try{t=this.shouldUpdate(r),t?(this.willUpdate(r),null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostUpdate)||void 0===t?void 0:t.call(e)})),this.update(r)):this._$Ek()}catch(e){throw t=!1,this._$Ek(),e}t&&this._$AE(r)}willUpdate(e){}_$AE(e){var t;null===(t=this._$ES)||void 0===t||t.forEach((e=>{var t;return null===(t=e.hostUpdated)||void 0===t?void 0:t.call(e)})),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(e)),this.updated(e)}_$Ek(){this._$AL=new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$E_}shouldUpdate(e){return!0}update(e){void 0!==this._$EC&&(this._$EC.forEach(((e,t)=>this._$EO(t,this[t],e))),this._$EC=void 0),this._$Ek()}updated(e){}firstUpdated(e){}};
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var _;b[v]=!0,b.elementProperties=new Map,b.elementStyles=[],b.shadowRootOptions={mode:"open"},null==p||p({ReactiveElement:b}),(null!==(d=u.reactiveElementVersions)&&void 0!==d?d:u.reactiveElementVersions=[]).push("1.6.3");const w=window,$=w.trustedTypes,k=$?$.createPolicy("lit-html",{createHTML:e=>e}):void 0,z="$lit$",A=`lit$${(Math.random()+"").slice(9)}$`,x="?"+A,E=`<${x}>`,D=document,S=()=>D.createComment(""),T=e=>null===e||"object"!=typeof e&&"function"!=typeof e,C=Array.isArray,M="[ \t\n\f\r]",j=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,R=/-->/g,I=/>/g,N=RegExp(`>|${M}(?:([^\\s"'>=/]+)(${M}*=${M}*(?:[^ \t\n\f\r"'\`<>=]|("|')|))|$)`,"g"),P=/'/g,U=/"/g,O=/^(?:script|style|textarea|title)$/i,L=(e=>(t,...r)=>({_$litType$:e,strings:t,values:r}))(1),Y=Symbol.for("lit-noChange"),H=Symbol.for("lit-nothing"),B=new WeakMap,F=D.createTreeWalker(D,129,null,!1);function V(e,t){if(!Array.isArray(e)||!e.hasOwnProperty("raw"))throw Error("invalid template strings array");return void 0!==k?k.createHTML(t):t}const Z=(e,t)=>{const r=e.length-1,a=[];let i,n=2===t?"<svg>":"",o=j;for(let t=0;t<r;t++){const r=e[t];let s,l,c=-1,d=0;for(;d<r.length&&(o.lastIndex=d,l=o.exec(r),null!==l);)d=o.lastIndex,o===j?"!--"===l[1]?o=R:void 0!==l[1]?o=I:void 0!==l[2]?(O.test(l[2])&&(i=RegExp("</"+l[2],"g")),o=N):void 0!==l[3]&&(o=N):o===N?">"===l[0]?(o=null!=i?i:j,c=-1):void 0===l[1]?c=-2:(c=o.lastIndex-l[2].length,s=l[1],o=void 0===l[3]?N:'"'===l[3]?U:P):o===U||o===P?o=N:o===R||o===I?o=j:(o=N,i=void 0);const u=o===N&&e[t+1].startsWith("/>")?" ":"";n+=o===j?r+E:c>=0?(a.push(s),r.slice(0,c)+z+r.slice(c)+A+u):r+A+(-2===c?(a.push(void 0),t):u)}return[V(e,n+(e[r]||"<?>")+(2===t?"</svg>":"")),a]};class W{constructor({strings:e,_$litType$:t},r){let a;this.parts=[];let i=0,n=0;const o=e.length-1,s=this.parts,[l,c]=Z(e,t);if(this.el=W.createElement(l,r),F.currentNode=this.el.content,2===t){const e=this.el.content,t=e.firstChild;t.remove(),e.append(...t.childNodes)}for(;null!==(a=F.nextNode())&&s.length<o;){if(1===a.nodeType){if(a.hasAttributes()){const e=[];for(const t of a.getAttributeNames())if(t.endsWith(z)||t.startsWith(A)){const r=c[n++];if(e.push(t),void 0!==r){const e=a.getAttribute(r.toLowerCase()+z).split(A),t=/([.?@])?(.*)/.exec(r);s.push({type:1,index:i,name:t[2],strings:e,ctor:"."===t[1]?Q:"?"===t[1]?ee:"@"===t[1]?te:G})}else s.push({type:6,index:i})}for(const t of e)a.removeAttribute(t)}if(O.test(a.tagName)){const e=a.textContent.split(A),t=e.length-1;if(t>0){a.textContent=$?$.emptyScript:"";for(let r=0;r<t;r++)a.append(e[r],S()),F.nextNode(),s.push({type:2,index:++i});a.append(e[t],S())}}}else if(8===a.nodeType)if(a.data===x)s.push({type:2,index:i});else{let e=-1;for(;-1!==(e=a.data.indexOf(A,e+1));)s.push({type:7,index:i}),e+=A.length-1}i++}}static createElement(e,t){const r=D.createElement("template");return r.innerHTML=e,r}}function K(e,t,r=e,a){var i,n,o,s;if(t===Y)return t;let l=void 0!==a?null===(i=r._$Co)||void 0===i?void 0:i[a]:r._$Cl;const c=T(t)?void 0:t._$litDirective$;return(null==l?void 0:l.constructor)!==c&&(null===(n=null==l?void 0:l._$AO)||void 0===n||n.call(l,!1),void 0===c?l=void 0:(l=new c(e),l._$AT(e,r,a)),void 0!==a?(null!==(o=(s=r)._$Co)&&void 0!==o?o:s._$Co=[])[a]=l:r._$Cl=l),void 0!==l&&(t=K(e,l._$AS(e,t.values),l,a)),t}class q{constructor(e,t){this._$AV=[],this._$AN=void 0,this._$AD=e,this._$AM=t}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}u(e){var t;const{el:{content:r},parts:a}=this._$AD,i=(null!==(t=null==e?void 0:e.creationScope)&&void 0!==t?t:D).importNode(r,!0);F.currentNode=i;let n=F.nextNode(),o=0,s=0,l=a[0];for(;void 0!==l;){if(o===l.index){let t;2===l.type?t=new J(n,n.nextSibling,this,e):1===l.type?t=new l.ctor(n,l.name,l.strings,this,e):6===l.type&&(t=new re(n,this,e)),this._$AV.push(t),l=a[++s]}o!==(null==l?void 0:l.index)&&(n=F.nextNode(),o++)}return F.currentNode=D,i}v(e){let t=0;for(const r of this._$AV)void 0!==r&&(void 0!==r.strings?(r._$AI(e,r,t),t+=r.strings.length-2):r._$AI(e[t])),t++}}class J{constructor(e,t,r,a){var i;this.type=2,this._$AH=H,this._$AN=void 0,this._$AA=e,this._$AB=t,this._$AM=r,this.options=a,this._$Cp=null===(i=null==a?void 0:a.isConnected)||void 0===i||i}get _$AU(){var e,t;return null!==(t=null===(e=this._$AM)||void 0===e?void 0:e._$AU)&&void 0!==t?t:this._$Cp}get parentNode(){let e=this._$AA.parentNode;const t=this._$AM;return void 0!==t&&11===(null==e?void 0:e.nodeType)&&(e=t.parentNode),e}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(e,t=this){e=K(this,e,t),T(e)?e===H||null==e||""===e?(this._$AH!==H&&this._$AR(),this._$AH=H):e!==this._$AH&&e!==Y&&this._(e):void 0!==e._$litType$?this.g(e):void 0!==e.nodeType?this.$(e):(e=>C(e)||"function"==typeof(null==e?void 0:e[Symbol.iterator]))(e)?this.T(e):this._(e)}k(e){return this._$AA.parentNode.insertBefore(e,this._$AB)}$(e){this._$AH!==e&&(this._$AR(),this._$AH=this.k(e))}_(e){this._$AH!==H&&T(this._$AH)?this._$AA.nextSibling.data=e:this.$(D.createTextNode(e)),this._$AH=e}g(e){var t;const{values:r,_$litType$:a}=e,i="number"==typeof a?this._$AC(e):(void 0===a.el&&(a.el=W.createElement(V(a.h,a.h[0]),this.options)),a);if((null===(t=this._$AH)||void 0===t?void 0:t._$AD)===i)this._$AH.v(r);else{const e=new q(i,this),t=e.u(this.options);e.v(r),this.$(t),this._$AH=e}}_$AC(e){let t=B.get(e.strings);return void 0===t&&B.set(e.strings,t=new W(e)),t}T(e){C(this._$AH)||(this._$AH=[],this._$AR());const t=this._$AH;let r,a=0;for(const i of e)a===t.length?t.push(r=new J(this.k(S()),this.k(S()),this,this.options)):r=t[a],r._$AI(i),a++;a<t.length&&(this._$AR(r&&r._$AB.nextSibling,a),t.length=a)}_$AR(e=this._$AA.nextSibling,t){var r;for(null===(r=this._$AP)||void 0===r||r.call(this,!1,!0,t);e&&e!==this._$AB;){const t=e.nextSibling;e.remove(),e=t}}setConnected(e){var t;void 0===this._$AM&&(this._$Cp=e,null===(t=this._$AP)||void 0===t||t.call(this,e))}}class G{constructor(e,t,r,a,i){this.type=1,this._$AH=H,this._$AN=void 0,this.element=e,this.name=t,this._$AM=a,this.options=i,r.length>2||""!==r[0]||""!==r[1]?(this._$AH=Array(r.length-1).fill(new String),this.strings=r):this._$AH=H}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(e,t=this,r,a){const i=this.strings;let n=!1;if(void 0===i)e=K(this,e,t,0),n=!T(e)||e!==this._$AH&&e!==Y,n&&(this._$AH=e);else{const a=e;let o,s;for(e=i[0],o=0;o<i.length-1;o++)s=K(this,a[r+o],t,o),s===Y&&(s=this._$AH[o]),n||(n=!T(s)||s!==this._$AH[o]),s===H?e=H:e!==H&&(e+=(null!=s?s:"")+i[o+1]),this._$AH[o]=s}n&&!a&&this.j(e)}j(e){e===H?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=e?e:"")}}class Q extends G{constructor(){super(...arguments),this.type=3}j(e){this.element[this.name]=e===H?void 0:e}}const X=$?$.emptyScript:"";class ee extends G{constructor(){super(...arguments),this.type=4}j(e){e&&e!==H?this.element.setAttribute(this.name,X):this.element.removeAttribute(this.name)}}class te extends G{constructor(e,t,r,a,i){super(e,t,r,a,i),this.type=5}_$AI(e,t=this){var r;if((e=null!==(r=K(this,e,t,0))&&void 0!==r?r:H)===Y)return;const a=this._$AH,i=e===H&&a!==H||e.capture!==a.capture||e.once!==a.once||e.passive!==a.passive,n=e!==H&&(a===H||i);i&&this.element.removeEventListener(this.name,this,a),n&&this.element.addEventListener(this.name,this,e),this._$AH=e}handleEvent(e){var t,r;"function"==typeof this._$AH?this._$AH.call(null!==(r=null===(t=this.options)||void 0===t?void 0:t.host)&&void 0!==r?r:this.element,e):this._$AH.handleEvent(e)}}class re{constructor(e,t,r){this.element=e,this.type=6,this._$AN=void 0,this._$AM=t,this.options=r}get _$AU(){return this._$AM._$AU}_$AI(e){K(this,e)}}const ae=w.litHtmlPolyfillSupport;null==ae||ae(W,J),(null!==(_=w.litHtmlVersions)&&void 0!==_?_:w.litHtmlVersions=[]).push("2.8.0");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var ie,ne;class oe extends b{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){var e,t;const r=super.createRenderRoot();return null!==(e=(t=this.renderOptions).renderBefore)&&void 0!==e||(t.renderBefore=r.firstChild),r}update(e){const t=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this._$Do=((e,t,r)=>{var a,i;const n=null!==(a=null==r?void 0:r.renderBefore)&&void 0!==a?a:t;let o=n._$litPart$;if(void 0===o){const e=null!==(i=null==r?void 0:r.renderBefore)&&void 0!==i?i:null;n._$litPart$=o=new J(t.insertBefore(S(),e),e,void 0,null!=r?r:{})}return o._$AI(e),o})(t,this.renderRoot,this.renderOptions)}connectedCallback(){var e;super.connectedCallback(),null===(e=this._$Do)||void 0===e||e.setConnected(!0)}disconnectedCallback(){var e;super.disconnectedCallback(),null===(e=this._$Do)||void 0===e||e.setConnected(!1)}render(){return Y}}oe.finalized=!0,oe._$litElement$=!0,null===(ie=globalThis.litElementHydrateSupport)||void 0===ie||ie.call(globalThis,{LitElement:oe});const se=globalThis.litElementPolyfillSupport;null==se||se({LitElement:oe}),(null!==(ne=globalThis.litElementVersions)&&void 0!==ne?ne:globalThis.litElementVersions=[]).push("3.3.3");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const le=e=>t=>"function"==typeof t?((e,t)=>(customElements.define(e,t),t))(e,t):((e,t)=>{const{kind:r,elements:a}=t;return{kind:r,elements:a,finisher(t){customElements.define(e,t)}}})(e,t)
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,ce=(e,t)=>"method"===t.kind&&t.descriptor&&!("value"in t.descriptor)?{...t,finisher(r){r.createProperty(t.key,e)}}:{kind:"field",key:Symbol(),placement:"own",descriptor:{},originalKey:t.key,initializer(){"function"==typeof t.initializer&&(this[t.key]=t.initializer.call(this))},finisher(r){r.createProperty(t.key,e)}},de=(e,t,r)=>{t.constructor.createProperty(r,e)};function ue(e){return(t,r)=>void 0!==r?de(e,t,r):ce(e,t)}
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */function he(e){return ue({...e,state:!0})}
/**
 * @license
 * Copyright 2021 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */var me;null===(me=window.HTMLSlotElement)||void 0===me||me.prototype.assignedElements;const pe="trash-card",ge=`${pe}-editor`;class fe{constructor(){this.data=[]}reset(){this.data=[]}log(e,t){this.data.push({message:e,data:t})}getLogs(){return this.data}}const ye=(e,t,r)=>r&&e.content.summary?e.content.summary:t.label??e.content.summary??"unknown",ve=(e,t,r)=>({...e,...t,label:ye(e,t,r),type:"custom"===t.type?`custom-${t.idx}`:t.type}),be=(e,t)=>e.reduce(((e,r)=>{const a=((e,{pattern:t,useSummary:r})=>{if(!e||!("summary"in e.content))return[];const{content:{summary:a}}=e,i=t.map(((e,t)=>({...e,idx:t}))).filter((e=>e.pattern&&a.toLowerCase().includes(e.pattern.toLowerCase())));return i.length>0?i.map((t=>ve(e,t,r))):[ve(e,{...t.find((e=>"others"===e.type)),idx:0},r)]})(r,t);return[...e,...a]}),[]).filter((e=>Boolean(e))),_e=(e=new Date)=>{const t=-e.getTimezoneOffset(),r=t%60;return`${t>=0?"+":""}${Number.parseInt(""+t/60,10)<0?`-${(""+-1*Number.parseInt(""+t/60,10)).padStart(2,"0")}`:`${Number.parseInt(""+t/60,10)}`.padStart(2,"0")}:${`${r<0?-1*r:r}`.padStart(2,"0")}`},we=(e,{config:t,now:a,dropAfter:i,filterFutureEventsDay:n})=>{const o=`${n}T00:00:00${_e()}`,s=new Date(o);return e.filter((e=>!(e.date.start>s)&&(e.isWholeDayEvent?e.date.end>a:!(e.date.end<a)))).sort(((e,t)=>e.date.start.getTime()-t.date.start.getTime())).filter((e=>((e,t)=>{if(!t.filter_events)return!0;const r=t.pattern.filter((e=>"others"!==e.type)).map((e=>e.pattern)).filter((e=>void 0!==e));return 0===r.length||r.some((t=>e.content.summary.toLowerCase().includes(t.toLowerCase())))})(e,t)&&(((e,t,a)=>e.isWholeDayEvent&&r(e.date.start)===r(t)&&!a||e.isWholeDayEvent&&r(e.date.start)!==r(t))(e,a,i)||!e.isWholeDayEvent)))},$e=async(e,t,{start:r,end:a})=>{const i=`calendars/${t}?start=${r}&end=${a}`;return await e.callApi("GET",i).then((e=>e.map((e=>({...e,entity:t})))))},ke=async(e,t,{start:r,end:a,dropAfter:i},n,o,s)=>{const l=[];for await(const i of t)l.push(...await $e(e,i,{start:r,end:a}));n.reset(),n.log("timezone",s),n.log("calendar data",l);const c=((e,t)=>{const r=new Date;r.setUTCHours(0),r.setMinutes(0),r.setSeconds(0),r.setMilliseconds(0);const a=r.toISOString(),i=`${a.slice(a.indexOf("T"),-1)}${t}`;return e.map((e=>({date:{start:new Date("date"in e.start?`${e.start.date}${i}`:e.start.dateTime),end:new Date("date"in e.end?`${e.end.date}${i}`:e.end.dateTime)},isWholeDayEvent:Boolean("date"in e.start),content:{...Object.fromEntries(Object.entries(e).filter((([e])=>!["end","start"].includes(e))))}})))})(l,s);c.sort(((e,t)=>e.date.start.getTime()-t.date.start.getTime()));const d=new Date;n.log("normaliseEvents",c),n.log("dropAfter",i),n.log("now",d);const u=we(c,{config:{pattern:o.pattern,filter_events:o.filter_events},dropAfter:i,now:d,filterFutureEventsDay:a});n.log("activeElements",u);const h=be(u,{pattern:o.pattern,useSummary:Boolean(o.use_summary)});return n.log("eventsToItems",h),o.event_grouping?(e=>{const t=new Set([]);return e.filter((e=>{const{type:r}=e;if(t.has(r))return!1;if("others"===r){const{content:r}=e,a=r.recurrence_id??r.summary;return!t.has(a)&&(t.add(a),!0)}return t.add(r),!0}))})(h):h},ze=e=>"settings"in e||"entity"in e,Ae=e=>{const t=[],{settings:r,entity:a,...i}=e,n={...i};return"entity"in e&&(n.entities=Array.isArray(a)?a:[a]),"settings"in e?(Object.entries(r).forEach((([e,r])=>{t.push({...r,type:e})})),{...n,pattern:t}):n},xe=1,Ee=e=>(...t)=>({_$litDirective$:e,values:t});let De=class{constructor(e){}get _$AU(){return this._$AM._$AU}_$AT(e,t,r){this._$Ct=e,this._$AM=t,this._$Ci=r}_$AS(e,t){return this.update(e,t)}update(e,t){return this.render(...t)}};
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */const Se="important",Te=" !"+Se,Ce=Ee(class extends De{constructor(e){var t;if(super(e),e.type!==xe||"style"!==e.name||(null===(t=e.strings)||void 0===t?void 0:t.length)>2)throw Error("The `styleMap` directive must be used in the `style` attribute and must be the only part in the attribute.")}render(e){return Object.keys(e).reduce(((t,r)=>{const a=e[r];return null==a?t:t+`${r=r.includes("-")?r:r.replace(/(?:^(webkit|moz|ms|o)|)(?=[A-Z])/g,"-$&").toLowerCase()}:${a};`}),"")}update(e,[t]){const{style:r}=e.element;if(void 0===this.ht){this.ht=new Set;for(const e in t)this.ht.add(e);return this.render(t)}this.ht.forEach((e=>{null==t[e]&&(this.ht.delete(e),e.includes("-")?r.removeProperty(e):r[e]="")}));for(const e in t){const a=t[e];if(null!=a){this.ht.add(e);const t="string"==typeof a&&a.endsWith(Te);e.includes("-")||t?r.setProperty(e,t?a.slice(0,-11):a,t?Se:""):r[e]=a}}return Y}});var Me,je,Re,Ie,Ne,Pe=Number.isNaN||function(e){return"number"==typeof e&&e!=e};function Ue(e,t){if(e.length!==t.length)return!1;for(var r=0;r<e.length;r++)if(a=e[r],i=t[r],!(a===i||Pe(a)&&Pe(i)))return!1;var a,i;return!0}function Oe(e,t){void 0===t&&(t=Ue);var r=null;function a(){for(var a=[],i=0;i<arguments.length;i++)a[i]=arguments[i];if(r&&r.lastThis===this&&t(a,r.lastArgs))return r.lastResult;var n=e.apply(this,a);return r={lastResult:n,lastArgs:a,lastThis:this},n}return a.clear=function(){r=null},a}!function(e){e.language="language",e.system="system",e.comma_decimal="comma_decimal",e.decimal_comma="decimal_comma",e.space_comma="space_comma",e.none="none"}(Me||(Me={})),function(e){e.language="language",e.system="system",e.am_pm="12",e.twenty_four="24"}(je||(je={})),function(e){e.local="local",e.server="server"}(Re||(Re={})),function(e){e.language="language",e.system="system",e.DMY="DMY",e.MDY="MDY",e.YMD="YMD"}(Ie||(Ie={})),function(e){e.language="language",e.monday="monday",e.tuesday="tuesday",e.wednesday="wednesday",e.thursday="thursday",e.friday="friday",e.saturday="saturday",e.sunday="sunday"}(Ne||(Ne={})),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"long",month:"long",day:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{year:"numeric",month:"long",day:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>{const r=e.date_format===Ie.system?void 0:e.language;return e.date_format===Ie.language||(e.date_format,Ie.system),new Intl.DateTimeFormat(r,{year:"numeric",month:"numeric",day:"numeric",timeZone:"server"===e.time_zone?t:void 0})})),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{day:"numeric",month:"short",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{month:"long",year:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{month:"long",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{year:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"long",timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"short",timeZone:"server"===e.time_zone?t:void 0})));const Le=Oe((e=>{if(e.time_format===je.language||e.time_format===je.system){const t=e.time_format===je.language?e.language:void 0,r=(new Date).toLocaleString(t);return r.includes("AM")||r.includes("PM")}return e.time_format===je.am_pm}));Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{hour:"numeric",minute:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{hour:Le(e)?"numeric":"2-digit",minute:"2-digit",second:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{weekday:"long",hour:Le(e)?"numeric":"2-digit",minute:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en-GB",{hour:"numeric",minute:"2-digit",hour12:!1,timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"long",day:"numeric",hour:Le(e)?"numeric":"2-digit",minute:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"short",day:"numeric",hour:Le(e)?"numeric":"2-digit",minute:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{month:"short",day:"numeric",hour:Le(e)?"numeric":"2-digit",minute:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Le(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"long",day:"numeric",hour:Le(e)?"numeric":"2-digit",minute:"2-digit",second:"2-digit",hour12:Le(e),timeZone:"server"===e.time_zone?t:void 0}))),Oe((e=>new Intl.Collator(e))),Oe((e=>new Intl.Collator(e,{sensitivity:"accent"})));let Ye=class extends TypeError{constructor(e,t){let r;const{message:a,...i}=e,{path:n}=e;super(0===n.length?a:"At path: "+n.join(".")+" -- "+a),this.value=void 0,this.key=void 0,this.type=void 0,this.refinement=void 0,this.path=void 0,this.branch=void 0,this.failures=void 0,Object.assign(this,i),this.name=this.constructor.name,this.failures=()=>{var a;return null!=(a=r)?a:r=[e,...t()]}}};function He(e){return"object"==typeof e&&null!=e}function Be(e){return"string"==typeof e?JSON.stringify(e):""+e}function Fe(e,t,r,a){if(!0===e)return;!1===e?e={}:"string"==typeof e&&(e={message:e});const{path:i,branch:n}=t,{type:o}=r,{refinement:s,message:l="Expected a value of type `"+o+"`"+(s?" with refinement `"+s+"`":"")+", but received: `"+Be(a)+"`"}=e;return{value:a,type:o,refinement:s,key:i[i.length-1],path:i,branch:n,...e,message:l}}function*Ve(e,t,r,a){(function(e){return He(e)&&"function"==typeof e[Symbol.iterator]})(e)||(e=[e]);for(const i of e){const e=Fe(i,t,r,a);e&&(yield e)}}function*Ze(e,t,r){void 0===r&&(r={});const{path:a=[],branch:i=[e],coerce:n=!1,mask:o=!1}=r,s={path:a,branch:i};if(n&&(e=t.coercer(e,s),o&&"type"!==t.type&&He(t.schema)&&He(e)&&!Array.isArray(e)))for(const r in e)void 0===t.schema[r]&&delete e[r];let l=!0;for(const r of t.validator(e,s))l=!1,yield[r,void 0];for(let[r,c,d]of t.entries(e,s)){const t=Ze(c,d,{path:void 0===r?a:[...a,r],branch:void 0===r?i:[...i,c],coerce:n,mask:o});for(const a of t)a[0]?(l=!1,yield[a[0],void 0]):n&&(c=a[1],void 0===r?e=c:e instanceof Map?e.set(r,c):e instanceof Set?e.add(c):He(e)&&(e[r]=c))}if(l)for(const r of t.refiner(e,s))l=!1,yield[r,void 0];l&&(yield[void 0,e])}let We=class{constructor(e){this.TYPE=void 0,this.type=void 0,this.schema=void 0,this.coercer=void 0,this.validator=void 0,this.refiner=void 0,this.entries=void 0;const{type:t,schema:r,validator:a,refiner:i,coercer:n=(e=>e),entries:o=function*(){}}=e;this.type=t,this.schema=r,this.entries=o,this.coercer=n,this.validator=a?(e,t)=>Ve(a(e,t),t,this,e):()=>[],this.refiner=i?(e,t)=>Ve(i(e,t),t,this,e):()=>[]}assert(e){return function(e,t){const r=Ke(e,t);if(r[0])throw r[0]}(e,this)}create(e){return function(e,t){const r=Ke(e,t,{coerce:!0});if(r[0])throw r[0];return r[1]}(e,this)}is(e){return function(e,t){const r=Ke(e,t);return!r[0]}(e,this)}mask(e){return function(e,t){const r=Ke(e,t,{coerce:!0,mask:!0});if(r[0])throw r[0];return r[1]}(e,this)}validate(e,t){return void 0===t&&(t={}),Ke(e,this,t)}};function Ke(e,t,r){void 0===r&&(r={});const a=Ze(e,t,r),i=function(e){const{done:t,value:r}=e.next();return t?void 0:r}(a);if(i[0]){const e=new Ye(i[0],(function*(){for(const e of a)e[0]&&(yield e[0])}));return[e,void 0]}return[void 0,i[1]]}function qe(e,t){return new We({type:e,schema:null,validator:t})}function Je(e){return new We({type:"array",schema:e,*entries(t){if(e&&Array.isArray(t))for(const[r,a]of t.entries())yield[r,a,e]},coercer:e=>Array.isArray(e)?e.slice():e,validator:e=>Array.isArray(e)||"Expected an array value, but received: "+Be(e)})}function Ge(){return qe("boolean",(e=>"boolean"==typeof e))}function Qe(e){const t=Be(e),r=typeof e;return new We({type:"literal",schema:"string"===r||"number"===r||"boolean"===r?e:null,validator:r=>r===e||"Expected the literal `"+t+"`, but received: "+Be(r)})}function Xe(e){const t=e?Object.keys(e):[],r=qe("never",(()=>!1));return new We({type:"object",schema:e||null,*entries(a){if(e&&He(a)){const i=new Set(Object.keys(a));for(const r of t)i.delete(r),yield[r,a[r],e[r]];for(const e of i)yield[e,a[e],r]}},validator:e=>He(e)||"Expected an object, but received: "+Be(e),coercer:e=>He(e)?{...e}:e})}function et(e){return new We({...e,validator:(t,r)=>void 0===t||e.validator(t,r),refiner:(t,r)=>void 0===t||e.refiner(t,r)})}function tt(){return qe("string",(e=>"string"==typeof e||"Expected a string, but received: "+Be(e)))}function rt(e){const t=Object.keys(e);return new We({type:"type",schema:e,*entries(r){if(He(r))for(const a of t)yield[a,r[a],e[a]]},validator:e=>He(e)||"Expected an object, but received: "+Be(e)})}function at(e){const t=e.map((e=>e.type)).join(" | ");return new We({type:"union",schema:null,coercer(t,r){const a=e.find((e=>{const[r]=e.validate(t,{coerce:!0});return!r}))||qe("unknown",(()=>!0));return a.coercer(t,r)},validator(r,a){const i=[];for(const t of e){const[...e]=Ze(r,t,a),[n]=e;if(!n[0])return[];for(const[t]of e)t&&i.push(t)}return["Expected the value to satisfy a union of `"+t+"`, but received: "+Be(r),...i]}})}function it(e){const t=e.language||"en";return e.translationMetadata.translations[t]&&e.translationMetadata.translations[t].isRTL||!1}const nt=Xe({user:tt()}),ot=at([Ge(),Xe({text:et(tt()),excemptions:et(Je(nt))})]),st=Xe({action:Qe("url"),url_path:tt(),confirmation:et(ot)}),lt=Xe({action:Qe("call-service"),service:tt(),service_data:et(Xe()),data:et(Xe()),target:et(Xe({entity_id:et(at([tt(),Je(tt())])),device_id:et(at([tt(),Je(tt())])),area_id:et(at([tt(),Je(tt())]))})),confirmation:et(ot)}),ct=Xe({action:Qe("navigate"),navigation_path:tt(),confirmation:et(ot)}),dt=rt({action:Qe("assist"),pipeline_id:et(tt()),start_listening:et(Ge())}),ut=rt({action:Qe("fire-dom-event")}),ht=Xe({action:function(e){const t={},r=e.map((e=>Be(e))).join();for(const r of e)t[r]=r;return new We({type:"enums",schema:t,validator:t=>e.includes(t)||"Expected one of `"+r+"`, but received: "+Be(t)})}(["none","toggle","more-info","call-service","url","navigate","assist"]),confirmation:et(ot)});var mt;mt=e=>{if(e&&"object"==typeof e&&"action"in e)switch(e.action){case"call-service":return lt;case"fire-dom-event":return ut;case"navigate":return ct;case"url":return st;case"assist":return dt}return ht},new We({type:"dynamic",schema:null,*entries(e,t){const r=mt(e,t);yield*r.entries(e,t)},validator:(e,t)=>mt(e,t).validator(e,t),coercer:(e,t)=>mt(e,t).coercer(e,t),refiner:(e,t)=>mt(e,t).refiner(e,t)}),l`
    #sortable a:nth-of-type(2n) paper-icon-item {
        animation-name: keyframes1;
        animation-iteration-count: infinite;
        transform-origin: 50% 10%;
        animation-delay: -0.75s;
        animation-duration: 0.25s;
    }

    #sortable a:nth-of-type(2n-1) paper-icon-item {
        animation-name: keyframes2;
        animation-iteration-count: infinite;
        animation-direction: alternate;
        transform-origin: 30% 5%;
        animation-delay: -0.5s;
        animation-duration: 0.33s;
    }

    #sortable a {
        height: 48px;
        display: flex;
    }

    #sortable {
        outline: none;
        display: block !important;
    }

    .hidden-panel {
        display: flex !important;
    }

    .sortable-fallback {
        display: none;
    }

    .sortable-ghost {
        opacity: 0.4;
    }

    .sortable-fallback {
        opacity: 0;
    }

    @keyframes keyframes1 {
        0% {
            transform: rotate(-1deg);
            animation-timing-function: ease-in;
        }

        50% {
            transform: rotate(1.5deg);
            animation-timing-function: ease-out;
        }
    }

    @keyframes keyframes2 {
        0% {
            transform: rotate(1deg);
            animation-timing-function: ease-in;
        }

        50% {
            transform: rotate(-1.5deg);
            animation-timing-function: ease-out;
        }
    }

    .show-panel,
    .hide-panel {
        display: none;
        position: absolute;
        top: 0;
        right: 4px;
        --mdc-icon-button-size: 40px;
    }

    :host([rtl]) .show-panel {
        right: initial;
        left: 4px;
    }

    .hide-panel {
        top: 4px;
        right: 8px;
    }

    :host([rtl]) .hide-panel {
        right: initial;
        left: 8px;
    }

    :host([expanded]) .hide-panel {
        display: block;
    }

    :host([expanded]) .show-panel {
        display: inline-flex;
    }

    paper-icon-item.hidden-panel,
    paper-icon-item.hidden-panel span,
    paper-icon-item.hidden-panel ha-icon[slot="item-icon"] {
        color: var(--secondary-text-color);
        cursor: pointer;
    }
`;var pt={form:{color_picker:{values:{default:"Standardfarve"}},day_style:{title:"Vis begivenheds tid som",values:{default:"Dato",counter:"dage til",custom:"Brugerdefineret datoformat"}},day_style_format:{title:"Brugerdefineret datoformat",helper:"Definer dit eget datoformat. (dd = dag med foranstillet 0, d = dag, MM = måned med foranstillet 0, M = måned, yy = kort år, yyyy = langt år) F.eks. dd.MM.yyyy = 03.04.2024, hvor d.M.yy = 3.4.24 ville resultere."},card_style:{title:"Vis som",values:{card:"Standardkort",chip:"Chip kort",icon:"Ikon"}},alignment_style:{title:"Justering",values:{left:"venstre",center:"centreret",right:"ret",space:"med afstand"}},color_mode:{title:"Anvend farve til",values:{background:"Baggrund",icon:"Ikon"}},layout_picker:{values:{default:"Standardlayout",vertical:"Vertikalt layout",horizontal:"Horisontalt layout"}},tabs:{settings:"Indstillinger",appearance:"Udseende",patterns:"Mønstre"},refresh_rate:{title:"Opdateringsinterval",helper:"Tjek ændringer i kalenderen hvert x minut"}},card:{generic:{icon_color:"Ikonfarve",layout:"Layout",fill_container:"Fyld container",next_days:"Dage frem i tiden",filter_events:"Filtrer begivenheder efter mønstre",drop_todayevents_from:"Fra hvilken tid skal heldags begivenhed skjules",full_size:"Kort uden margen",use_summary:"Begivenhedssammendrag i stedet for etiket",hide_time_range:"Skjul tid",event_grouping:"Vis kun næste begivenhed pr. mønster",icon_size:"Ikonstørrelse",with_label:"Vis etiket"},trash:{pattern:{title:"Rediger mønster",edit:"rediger",delete:"slet",create:"Opret nyt mønster",new_custom_label:"Nyt mønster",type:{organic:"Organisk",paper:"Papir",recycle:"Genbrug",waste:"Affald",others:"Andre"},fields:{label:"Etiket",color:"Farve",icon:"Ikon",pattern:"Detektions mønster",picture_url:"Billede-URL",picture_url_description:"Hvis en billed-URL er angivet, vises det tilsvarende billede i stedet for ikonet. Placer et billede i mappen `/config/www` og brug `/local/[filnavn]`."}}}}},gt={not_found:"Entitet ikke fundet",trash:{today:"i dag",tomorrow:"i morgen",day:"<DAY>",today_from_till:"I dag\nfra <START> til <END>",tomorrow_from_till:"I morgen\nmellem <START> og <END>",day_from_till:"<DAY>\nmellem <START> og <END>",daysleft:"om <DAYS> dag",daysleft_more:"om <DAYS> dage",daysleft_from_till:"om <DAYS> dag\nmellem <START> og <END>",daysleft_more_from_till:"om <DAYS> dage\nmellem <START> og <END>"}},ft={editor:pt,card:gt},yt={form:{color_picker:{values:{default:"Standard-Farbe"}},day_style:{title:"Ereigniss Zeitpunkt anzeigen als",values:{default:"Datum",counter:"Tage bis",custom:"Eigenes Datumsformat"}},day_style_format:{title:"Eigenes Datumsformat",helper:"Definiere ein eigenes Datums format. (dd = Tag mit führender 0, d = Tag, MM = Monat mit führender 0, M = Monat, yy = Jahr kurz, yyyy = Jahr lang) Z.b. ergibt dd.MM.yyyy = 03.04.2024, wobei d.M.yy = 3.4.24 ergeben würde."},card_style:{title:"Darstellen als",values:{card:"Standard Karte",chip:"Chip Karte",icon:"Icon"}},alignment_style:{title:"Ausrichtung",values:{left:"Linksbündig",center:"Mittig",right:"Rechtsbündig",space:"Mit Abstand"}},color_mode:{title:"Farbe anwenden auf",values:{background:"Hintergrund",icon:"Symbol"}},layout_picker:{values:{default:"Standard-Layout",vertical:"Vertikales Layout",horizontal:"Horizontales Layout"}},tabs:{settings:"Einstellungen",appearance:"Darstellung",patterns:"Muster"},refresh_rate:{title:"Aktuallisierungsinterval",helper:"Alle x Minuten auf Änderungen im Kalender prüfen."}},card:{generic:{icon_color:"Icon-Farbe",layout:"Layout",fill_container:"Container ausfüllen",next_days:"Tage in der Zukunft",filter_events:"Ereignisse nach Mustern filtern",drop_todayevents_from:"Ab wieviel Uhr Ganztages Ereignis ausblenden",full_size:"Karte ohne Seitenrand",use_summary:"Ereignisse Bezeichnung anstelle des Lables verwenden",hide_time_range:"Uhrzeit ausblenden",event_grouping:"Nur das nächste Ereignis je Muster anzeigen",icon_size:"Icon größe",with_label:"Bezeichnung anzeigen"},trash:{pattern:{title:"Muster bearbeiten",edit:"bearbeiten",delete:"löschen",create:"Neues Muster erstellen",new_custom_label:"Neues Muster",type:{organic:"Bio",paper:"Papier",recycle:"Verpackung",waste:"Restmüll",others:"Sonstiges"},fields:{label:"Bezeichnung",color:"Farbe",icon:"Symbol",pattern:"erkennen an Muster",picture_url:"Bild URL",picture_url_description:"Wenn eine Bild URL angegeben wird, wird das entsprechende Bild anstelle das Icon angezeigt. Lege ein Bild in dem `/config/www` Ordner ab und verwende `/local/[Dateiname]`."}}}}},vt={not_found:"Entität nicht gefunden",trash:{today:"Heute",tomorrow:"Morgen",day:"<DAY>",today_from_till:"Heute\nvon <START> bis <END>",tomorrow_from_till:"Morgen\nzwischen <START> und <END>",day_from_till:"<DAY>\nzwischen <START> und <END>",daysleft:"in <DAYS> Tag",daysleft_more:"in <DAYS> Tagen",daysleft_from_till:"in <DAYS> Tag\nvon <START> bis <END>",daysleft_more_from_till:"in <DAYS> Tagen\nvon <START> bis <END>"}},bt={editor:yt,card:vt},_t={form:{color_picker:{values:{default:"Default color"}},day_style:{title:"Show event time as",values:{default:"Date",counter:"days to",custom:"Custom date format"}},day_style_format:{title:"Custom date format",helper:"Define your own date format. (dd = day with leading 0, d = day, MM = month with leading 0, M = month, yy = year short, yyyy = year long) E.g. dd.MM.yyyy = 03.04.2024, where d.M.yy = 3.4.24 would result."},card_style:{title:"Display as",values:{card:"Standard card",chip:"Chip card",icon:"Icon"}},alignment_style:{title:"Alignment",values:{left:"left",center:"centered",right:"right",space:"spaced"}},color_mode:{title:"Apply color to",values:{background:"Background",icon:"Icon"}},layout_picker:{values:{default:"Default layout",vertical:"Vertical layout",horizontal:"Horizontal layout"}},tabs:{settings:"Settings",appearance:"Appearance",patterns:"Patterns"},refresh_rate:{title:"Update interval",helper:"Check for changes in the calendar every x minutes"}},card:{generic:{icon_color:"Icon color",layout:"Layout",fill_container:"Fill container",next_days:"Days in the future",filter_events:"Filter events by patterns",drop_todayevents_from:"From what time to hide all-day event",full_size:"Card without margin",use_summary:"Event summary instead of label",hide_time_range:"Hide time",event_grouping:"Only display the next event per pattern",icon_size:"Icon size",with_label:"Show label"},trash:{pattern:{title:"Edit pattern",edit:"edit",delete:"delete",create:"Create new pattern",new_custom_label:"New pattern",type:{organic:"Organic",paper:"Paper",recycle:"Recycle",waste:"Waste",others:"Others"},fields:{label:"Label",color:"Color",icon:"Icon",pattern:"Detection pattern",picture_url:"Picture URL",picture_url_description:"If a picture URL is specified, the corresponding picture is displayed instead of the icon. Place an image in the `/config/www` folder and use `/local/[filename]`."}}}}},wt={not_found:"Entity not found",trash:{today:"today",tomorrow:"tomorrow",day:"<DAY>",today_from_till:"Today\nfrom <START> to <END>",tomorrow_from_till:"Tomorrow\nbetween <START> and <END>",day_from_till:"<DAY>\nbetween <START> and <END>",daysleft:"in <DAYS> day",daysleft_more:"in <DAYS> days",daysleft_from_till:"in <DAYS> day\nbetween <START> and <END>",daysleft_more_from_till:"in <DAYS> days\nbetween <START> and <END>"}},$t={editor:_t,card:wt},kt={form:{color_picker:{values:{default:"Couleur par défaut"}},day_style:{title:"Afficher l'heure de l'événement en tant que",values:{default:"Date",counter:"jours jusqu'à",custom:"Propre format de date"}},day_style_format:{title:"Propre format de date",helper:"Définir un format de date personnalisé. (dd = jour avec 0 en tête, d = jour, MM = mois avec 0 en tête, M = mois, yy = année courte, yyyy = année longue) Par exemple, dd.MM.yyyy = 03.04.2024, où d.M.yy = 3.4.24 donnerait"},card_style:{title:"Représenter comme",values:{card:"carte standard",chip:"carte à puce",icon:"Icône"}},alignment_style:{title:"Alignement",values:{left:"gauche",center:"centré",right:"droit",space:"espacé"}},color_mode:{title:"Appliquer une couleur à",values:{background:"Contexte",icon:"Icône"}},layout_picker:{values:{default:"Disposition par défaut",vertical:"Disposition Verticale",horizontal:"Disposition Horizontale"}},tabs:{settings:"Paramètres",appearance:"Apparence",patterns:"Motifs"},refresh_rate:{title:"Intervalle d'actualisation",helper:"Vérifier les changements dans le calendrier toutes les x minutes."}},card:{generic:{icon_color:"Couleur de l'icône",layout:"Disposition",fill_container:"Remplir le conteneur",next_days:"Jours dans le futur",filter_events:"Filtrer les événements par motifs",drop_todayevents_from:"A partir de quelle heure masquer l'événement de toute la journée ?",full_size:"Carte sans marge",use_summary:"Résumé de l'événement au lieu de l'étiquette",hide_time_range:"cacher le temps",event_grouping:"Afficher uniquement l'événement suivant par modèle",icon_size:"taille de l'icône",with_label:"Afficher l'étiquette"},trash:{pattern:{title:"Modifier le modèle",edit:"Modifier",delete:"Supprimer",create:"Créer un nouveau modèle",new_custom_label:"Nouveau modèle",type:{organic:"Organique",paper:"Papier",recycle:"Recyclage",waste:"Déchets",others:"Autres"},fields:{label:"Étiquette",color:"Couleur",icon:"Icône",pattern:"Modèle de détection",picture_url:"URL de l'image",picture_url_description:"Si une URL d'image est indiquée, l'image correspondante sera affichée au lieu de l'icône. Placez une image dans le dossier `/config/www` et utilisez `/local/[nom de fichier]`"}}}}},zt={not_found:"Entité introuvable",trash:{today:"Aujourd'hui",tomorrow:"Demain",day:"<DAY>",today_from_till:"Aujourd'hui\nentre <START> et <END>",tomorrow_from_till:"Demain\nentre <START> et <END>",day_from_till:"<DAY>\nentre <START> et <END>",daysleft:"Dans <DAYS> jour",daysleft_more:"Dans <DAYS> jours",daysleft_from_till:"Dans <DAYS> jour\nentre <START> et <END>",daysleft_more_from_till:"Dans <DAYS> jours\nentre <START> et <END>"}},At={editor:kt,card:zt},xt={form:{color_picker:{values:{default:"Alapértelmezett szín"}},day_style:{title:"Esemény idejének megjelenítése mint",values:{default:"Dátum",counter:"nap múlva",custom:"Saját dátumformátum"}},day_style_format:{title:"Egyéni dátumformátum",helper:"Saját dátumformátum meghatározása. (dd = nap 0 előtaggal, d = nap, MM = hónap 0 előtaggal, M = hónap, yy = év rövid, yyyy = év hosszú) Pl. dd.MM.yyyy = 03.04.2024, ahol d.M.yy = 3.4.24 lenne az eredmény."},card_style:{title:"Megjelenítés",values:{card:"Standard kártya",chip:"Chipkártya",icon:"Ikon"}},alignment_style:{title:"Kiegyenlítés",values:{left:"balra",center:"központosított",right:"jobbra",space:"spaced"}},color_mode:{title:"Alkalmazza a színt",values:{background:"Háttér",icon:"Ikon"}},layout_picker:{values:{default:"Alapértelmezett elrendezés",vertical:"Függőleges elrendezés",horizontal:"Vízszintes elrendezés"}},tabs:{settings:"Beállítások",appearance:"Kinézet",patterns:"Minták"},refresh_rate:{title:"Aktualizálási időintervallum",helper:"A naptár változásainak ellenőrzése x percenként."}},card:{generic:{icon_color:"Ikon szín",layout:"Elrendezés",fill_container:"Konténer kitöltése",next_days:"Jövőbeli napok száma",filter_events:"Események minta szerinti szűrése",drop_todayevents_from:"Mikortól rejtsük el az egésznapos eseményeket",full_size:"Margó nélküli kártya",use_summary:"Esemény összegzés a cimke helyett",hide_time_range:"Rejtsd el az időt",event_grouping:"Csak a következő eseményt jeleníti meg mintánként",icon_size:"Ikon mérete",with_label:"Címke megjelenítése"},trash:{pattern:{title:"Minta szerkesztése",edit:"szerkeszt",delete:"töröl",create:"Új minta létrehozása",new_custom_label:"Új minta",type:{organic:"Komposztálható",paper:"Papír",recycle:"Újrahasznosítható",waste:"Szemét",others:"Egyéb"},fields:{label:"Cimke",color:"Szín",icon:"Ikon",pattern:"Felismerési minta",picture_url:"Kép URL címe",picture_url_description:"Ha egy kép URL címe van megadva, akkor az ikon helyett a megfelelő kép jelenik meg. Helyezzen el egy képet a `/config/www` mappában, és használja a `/local/[fájlnév]`"}}}}},Et={not_found:"Entitás nem található",trash:{today:"ma",tomorrow:"holnap",day:"<DAY>",today_from_till:"Ma\n<START>-tól <END>-ig",tomorrow_from_till:"Holnap\n<START> és <END> között",day_from_till:"<DAY>\n<START> és <END> között",daysleft:"<DAYS> napon belül",daysleft_more:"<DAYS> napon belül",daysleft_from_till:"<DAYS> napon belül\n<START> és <END> között",daysleft_more_from_till:"<DAY> napon belül\n<START> és <END> között"}},Dt={editor:xt,card:Et},St={form:{color_picker:{values:{default:"Colore di default"}},day_style:{title:"Mostra la data degli eventi come",values:{default:"Data",counter:"giorni a",custom:"Formato di data proprio"}},day_style_format:{title:"Formato di data personalizzato",helper:"Definisci il tuo formato di data personalizzato. (dd = giorno con lo 0 iniziale, d = giorno, MM = mese con lo 0 iniziale, M = mese, yy = anno breve, yyyy = anno lungo) Ad esempio dd.MM.yyyy = 03.04.2024, dove d.M.yy = 3.4.24 risulterebbe"},card_style:{title:"Visualizza come",values:{card:"Carta standard",chip:"Carta chip",icon:"Icona"}},alignment_style:{title:"Allineamento",values:{left:"sinistra",center:"centrato",right:"diritto",space:"distanziato"}},color_mode:{title:"Applicare il colore a",values:{background:"Sfondo",icon:"Icona"}},layout_picker:{values:{default:"Layout di default",vertical:"Layout verticale",horizontal:"Layout orizzontala"}},tabs:{settings:"Impostazioni",appearance:"Aspetto",patterns:"Modelli"},refresh_rate:{title:"Intervallo di realizzazione",helper:"Controlla le modifiche al calendario ogni x minuti."}},card:{generic:{icon_color:"Colore icona",layout:"Layout",fill_container:"Riempi il container",next_days:"Giorni nel futuro",filter_events:"Filtra eventi con i pattern",drop_todayevents_from:"Da quale orario nascondere gli eventi di Tutto il giorno",full_size:"Card senza margini",use_summary:"Usa l'oggetto dell'evento al posto dell'etichetta",hide_time_range:"nascondere il tempo",event_grouping:"Visualizza solo l'evento successivo per schema",icon_size:"Dimensione dell'icona",with_label:"Mostra etichetta"},trash:{pattern:{title:"Modifica del modello",edit:"modificare",delete:"cancellare",create:"Crea un nuovo modello",new_custom_label:"Nuovo modello",type:{organic:"Organico",paper:"Carta",recycle:"Plastica",waste:"Indifferenziato",others:"Altro"},fields:{label:"Etichetta",color:"Colore",icon:"Icona",pattern:"Pattern identificazione",picture_url:"URL immagine",picture_url_description:"Se viene specificato un URL dell'immagine, al posto dell'icona viene visualizzata l'immagine corrispondente. Posizionare un'immagine nella cartella `/config/www` e utilizzare `/local/[filename]`."}}}}},Tt={not_found:"Entità non trovata",trash:{today:"Oggi",tomorrow:"Domani",day:"<DAY>",today_from_till:"Oggi\nda <START> a <END>",tomorrow_from_till:"Domani\ntra <START> e <END>",day_from_till:"<DAY>\ntra <START> e <END>",daysleft:"entro <DAYS> giorni",daysleft_more:"entro <DAYS> giorni",daysleft_from_till:"entro <DAYS> giorni\ntra <START> e <END>",daysleft_more_from_till:"entro <DAYS> giorni\ntra <START> e <END>"}},Ct={editor:St,card:Tt},Mt={form:{color_picker:{values:{default:"Standaard kleur"}},day_style:{title:"Toon afvalinzamelingtijd als",values:{default:"Datum",counter:"Aftellend",custom:"Eigen datumnotatie"}},day_style_format:{title:"Aangepast datumformaat",helper:"Definieer je eigen datumnotatie. (dd = dag met voorloop 0, d = dag, MM = maand met voorloop 0, M = maand, yy = jaar kort, yyyy = jaar lang) Bijv. dd.MM.yyyy = 03.04.2024, waar d.M.yy = 3.4.24 zou resulteren."},card_style:{title:"Weergeven als",values:{card:"Standaard kaart",chip:"Chipkaart",icon:"Icoon"}},alignment_style:{title:"Uitlijning",values:{left:"links",center:"gecentreerd",right:"rechts",space:"verdeeld"}},color_mode:{title:"Kleur aanbrengen op",values:{background:"Achtergrond",icon:"Icoon"}},layout_picker:{values:{default:"Standaard lay-out",vertical:"Verticale lay-out",horizontal:"Horizontale lay-out"}},tabs:{settings:"Instellingen",appearance:"Uiterlijk",patterns:"Patronen"},refresh_rate:{title:"Verversingsinterval",helper:"Controleert elke x minuten op wijzigingen in de kalenderactiviteiten."}},card:{generic:{icon_color:"Icoonkleur",layout:"Lay-out",fill_container:"Vul container",next_days:"Aantal dagen vooruit kijken",filter_events:"Filter kalenderactiviteiten op patronen",drop_todayevents_from:"Tijdstip om afvalinzameling voor die dag te verbergen",full_size:"Kaart zonder marge",use_summary:"Gebruik de samenvatting van de kalenderactiviteit i.p.v. de label",hide_time_range:"Verberg tijd",event_grouping:"Toon per patroon alleen de eerstvolgende afvalinzameling",icon_size:"Icoongrootte",with_label:"Toon label"},trash:{pattern:{title:"Patroon bewerken",edit:"bewerken",delete:"verwijderen",create:"Nieuw patroon aanmaken",new_custom_label:"Nieuw patroon",type:{organic:"GFT",paper:"Papier",recycle:"PMD",waste:"Restafval",others:"Overige"},fields:{label:"Label",color:"Kleur",icon:"Icoon",pattern:"Detectiepatroon",picture_url:"Afbeeldings-URL",picture_url_description:"Als er een afbeeldings-URL is opgegeven, wordt de bijbehorende afbeelding weergegeven in plaats van het icoon. Plaats een afbeelding in de `/config/www` map en gebruik `/local/[bestandsnaam]`."}}}}},jt={not_found:"Entiteit niet gevonden",trash:{today:"vandaag",tomorrow:"morgen",day:"<DAY>",today_from_till:"Vandaag\nvan <START> tot <END>",tomorrow_from_till:"Morgen\ntussen <START> en <END>",day_from_till:"<DAY>\ntussen <START> en <END>",daysleft:"over <DAYS> dag",daysleft_more:"over <DAYS> dagen",daysleft_from_till:"over <DAYS> dag\ntussen <START> en <END>",daysleft_more_from_till:"over <DAYS> dagen\ntussen <START> en <END>"}},Rt={editor:Mt,card:jt},It={form:{color_picker:{values:{default:"Domyślny kolor"}},day_style:{title:"Pokaż czas zdarzenia jako",values:{default:"Data",counter:"dni do",custom:"Własny format daty"}},day_style_format:{title:"Niestandardowy format daty",helper:"Zdefiniuj własny format daty. (dd = dzień z początkowym 0, d = dzień, MM = miesiąc z początkowym 0, M = miesiąc, yy = rok krótki, yyyy = rok długi) Np. dd.MM.yyy = 03.04.2024, gdzie d.M.yy = 3.4.24"},card_style:{title:"Wyświetl jako",values:{card:"Karta standardowa",chip:"Karta chipowa",icon:"Symbol"}},alignment_style:{title:"Wyrównanie",values:{left:"lewy",center:"wyśrodkowany",right:"prawo",space:"rozstawiony"}},color_mode:{title:"Zastosuj kolor do",values:{background:"Kontekst",icon:"Symbol"}},layout_picker:{values:{default:"Domyślny układ",vertical:"Pionowy układ",horizontal:"Poziomy układ"}},tabs:{settings:"Ustawienia",appearance:"Wygląd",patterns:"Wzorce"},refresh_rate:{title:"Interwał aktualizacji",helper:"Sprawdzanie zmian w kalendarzu co x minut."}},card:{generic:{icon_color:"Kolor ikony",layout:"Układ",fill_container:"Wypełnij zawartością",next_days:"Ilość dni do przodu",filter_events:"Filtruj zdarzenia według wzorca",drop_todayevents_from:"Od której godziny ukryć wydarzenie całodniowe",full_size:"Karta bez marginesu",use_summary:"Podsumowanie zamiast oznaczenia",hide_time_range:"Ukryj czas",event_grouping:"Wyświetla tylko następne zdarzenie dla wzorca",icon_size:"Rozmiar ikony",with_label:"Pokaż oznaczenie"},trash:{pattern:{title:"Edytuj wzorzec",edit:"edytuj",delete:"usuń",create:"Utwórz nowy wzorzec",new_custom_label:"Nowy wzorzec",type:{organic:"BIO",paper:"Papier",recycle:"Tworzywa",waste:"Zmieszane",others:"Pozostałe"},fields:{label:"Oznaczenie",color:"Kolor",icon:"Ikona",pattern:"Szablon wzorca",picture_url:"Adres URL obrazka",picture_url_description:"Jeśli podano adres URL obrazu, odpowiedni obraz jest wyświetlany zamiast ikony. Umieść obrazek w folderze `/config/www` i użyj `/local/[nazwa_pliku]`."}}}}},Nt={not_found:"Encji nie znaleziono",trash:{today:"dziś",tomorrow:"jutro",day:"<DAY>",today_from_till:"Dziś\nod <START> do <END>",tomorrow_from_till:"Jutro\npomięzdy <START> a <END>",day_from_till:"<DAY>\npomiędzy <START> a <END>",daysleft:"za <DAYS> dzień",daysleft_more:"za <DAYS> dni",daysleft_from_till:"za <DAYS> dni\npomiędzy <START> a <END>",daysleft_more_from_till:"za <DAYS> dni\npomiędzy <START> a <END>"}},Pt={editor:It,card:Nt},Ut={form:{color_picker:{values:{default:"Predvolená farba"}},day_style:{title:"Zobraziť čas udalosti ako",values:{default:"Dátum",counter:"dni do",custom:"Vlastný formát dátumu"}},day_style_format:{title:"Vlastný formát dátumu",helper:"Definujte vlastný formát dátumu. (dd = deň s úvodnou 0, d = deň, MM = mesiac s úvodnou 0, M = mesiac, yy = rok krátky, yyyy = rok dlhý) Napr. dd.MM.yyyy = 03.04.2024, kde by výsledkom bolo d.M.yy = 3.4.24."},card_style:{title:"Zobrazenie ako",values:{card:"Štandardná karta",chip:"čipová karta",icon:"Ikona"}},alignment_style:{title:"Zarovnanie",values:{left:"vľavo",center:"vycentrované",right:"vpravo",space:"rozmiestnené"}},color_mode:{title:"Použiť farbu na",values:{background:"Pozadie",icon:"Ikona"}},layout_picker:{values:{default:"Predvolené rozloženie",vertical:"Vertikálne rozloženie",horizontal:"Horizontálne rozloženie"}},tabs:{settings:"Nastavenia",appearance:"Vzhľad",patterns:"Pattern"},refresh_rate:{title:"Interval realizácie",helper:"Kontrola zmien v kalendári každých x minút."}},card:{generic:{icon_color:"Farba ikony",layout:"Rozloženie",fill_container:"Naplňte nádobu",next_days:"Dni v budúcnosti",filter_events:"Filtrovanie udalostí podľa vzorov",drop_todayevents_from:"od akého času sa má skryť celodenná udalosť",full_size:"Karta bez marže",use_summary:"Zhrnutie udalosti namiesto označenia",hide_time_range:"čas skrývania",event_grouping:"Zobrazenie iba nasledujúcej udalosti na vzor",icon_size:"Veľkosť ikony",with_label:"Zobraziť označenie"},trash:{pattern:{title:"Upraviť vzor",edit:"upraviť",delete:"vyma",create:"Vytvoriť nový vzor",new_custom_label:"Nový vzor",type:{organic:"Organický",paper:"Papiera",recycle:"Recyklačný",waste:"Odpadu",others:"Iné"},fields:{label:"štítok",color:"Farba",icon:"Ikona",pattern:"Vzor detekcie",picture_url:"URL obrázku",picture_url_description:"Ak je zadaná adresa URL obrázka, namiesto ikony sa zobrazí príslušný obrázok. Umiestnite obrázok do priečinka `/config/www` a použite `/local/[meno súboru]`."}}}}},Ot={not_found:"Entita sa nenašla",trash:{today:"dnes",tomorrow:"zajtra",day:"<DAY>",today_from_till:"Dnes\nod <START> do <END>",tomorrow_from_till:"Zajtra\nod <START> do <END>",day_from_till:"<DAY>\nmedzi <START> a <END>",daysleft:"za <DAYS> dní",daysleft_more:"za <DAYS> dní",daysleft_from_till:"za <DAYS> dní\nmedzi <START> a <END>",daysleft_more_from_till:"za <DAYS> dní\nmedzi <START> a <END>"}},Lt={editor:Ut,card:Ot};const Yt={da:Object.freeze({__proto__:null,card:gt,default:ft,editor:pt}),de:Object.freeze({__proto__:null,card:vt,default:bt,editor:yt}),en:Object.freeze({__proto__:null,card:wt,default:$t,editor:_t}),fr:Object.freeze({__proto__:null,card:zt,default:At,editor:kt}),hu:Object.freeze({__proto__:null,card:Et,default:Dt,editor:xt}),it:Object.freeze({__proto__:null,card:Tt,default:Ct,editor:St}),nl:Object.freeze({__proto__:null,card:jt,default:Rt,editor:Mt}),pl:Object.freeze({__proto__:null,card:Nt,default:Pt,editor:It}),sk:Object.freeze({__proto__:null,card:Ot,default:Lt,editor:Ut})},Ht=(e,t)=>{try{return e.split(".").reduce(((e,t)=>e[t]),Yt[t])}catch{return}};function Bt(e){return function(t){const r=e?.locale.language??"en";let a=Ht(t,r);return a||(a=Ht(t,"en")),a??t}}const Ft=(e,t)=>{const r=new Date(e.getTime());r.setHours(0),r.setMinutes(0),r.setSeconds(0);const a=new Date(t.date.start.getTime());return a.setHours(0),a.setMinutes(0),a.setSeconds(0),Math.round(Math.abs((r.getTime()-a.getTime())/864e5))},Vt=(e,t,r,a,i,n,o)=>{if("today"===t||"tomorrow"===t){return`${e(`${`card.trash.${t}${a&&!n?"_from_till":""}${a&&!n&&o?"_short":""}`}`).replace("<START>",a??"").replace("<END>",i??"")}`}return e(`${`card.trash.day${a&&!n?"_from_till":""}${a&&!n&&o?"_short":""}`}`).replace("<DAY>",r).replace("<START>",a??"").replace("<END>",i??"")},Zt=(e,t,a,i,n)=>{if(!n)return"";const o=Bt(n),s=new Date,l=new Date;l.setDate(l.getDate()+1);const c=r(s),d=r(l),u=r(e.date.start),h=e.isWholeDayEvent?void 0:e.date.start.toLocaleTimeString(n.language,{hour:"numeric",minute:"numeric"}),m=e.isWholeDayEvent?void 0:e.date.end.toLocaleTimeString(n.language,{hour:"numeric",minute:"numeric"});if(u===c||u===d)return Vt(o,u===c?"today":"tomorrow",void 0,h,m,t,!1);if("counter"===a){const r=Ft(new Date,e);return`${o(`card.trash.daysleft${r>1?"_more":""}${h&&!t?"_from_till":""}`).replace("<DAYS>",`${r}`).replace("<START>",h??"").replace("<END>",m??"")}`}const p="custom"!==a?e.date.start.toLocaleDateString(n.language,{weekday:"long",year:"numeric",month:"long",day:"numeric"}):((e,t)=>{const r={M:e.getMonth()+1,d:e.getDate(),h:e.getHours(),m:e.getMinutes(),s:e.getSeconds()};return(t=t.replace(/(M+|d+|h+|m+|s+)/gu,(e=>`${e.length>1?"0":""}${r[e.slice(-1)]}`.slice(-2)))).replace(/(y+)/gu,(t=>e.getFullYear().toString().slice(-t.length)))})(e.date.start,i??"dd.mm.YYYY");return Vt(o,"day",p,h,m,t,!1)},Wt=l`
    --default-red: 244, 67, 54;
    --default-pink: 233, 30, 99;
    --default-purple: 106, 107, 201;
    --default-deep-purple: 111, 66, 193;
    --default-indigo: 63, 81, 181;
    --default-blue: 33, 150, 243;
    --default-light-blue: 3, 169, 244;
    --default-cyan: 0, 188, 212;
    --default-teal: 0, 150, 136;
    --default-green: 76, 175, 80;
    --default-light-green: 139, 195, 74;
    --default-lime: 205, 220, 57;
    --default-yellow: 255, 235, 59;
    --default-amber: 255, 193, 7;
    --default-orange: 255, 152, 0;
    --default-deep-orange: 255, 111, 0;
    --default-brown: 121, 85, 72;
    --default-light-grey: 189, 189, 189;
    --default-grey: 158, 158, 158;
    --default-dark-grey: 96, 96, 96;
    --default-blue-grey: 96, 125, 139;
    --default-black: 0, 0, 0;
    --default-white: 255, 255, 255;
    --default-disabled: 189, 189, 189;
`,Kt=l`
    --default-disabled: 111, 111, 111;
`,qt=l`
    --spacing: var(--mush-spacing, 12px);

    /* Title */
    --title-padding: var(--mush-title-padding, 24px 12px 8px);
    --title-spacing: var(--mush-title-spacing, 8px);
    --title-font-size: var(--mush-title-font-size, 24px);
    --title-font-weight: var(--mush-title-font-weight, normal);
    --title-line-height: var(--mush-title-line-height, 32px);
    --title-color: var(--mush-title-color, var(--primary-text-color));
    --title-letter-spacing: var(--mush-title-letter-spacing, -0.288px);
    --subtitle-font-size: var(--mush-subtitle-font-size, 16px);
    --subtitle-font-weight: var(--mush-subtitle-font-weight, normal);
    --subtitle-line-height: var(--mush-subtitle-line-height, 24px);
    --subtitle-color: var(--mush-subtitle-color, var(--secondary-text-color));
    --subtitle-letter-spacing: var(--mush-subtitle-letter-spacing, 0px);

    /* Card */
    --card-primary-font-size: var(--mush-card-primary-font-size, 14px);
    --card-secondary-font-size: var(--mush-card-secondary-font-size, 12px);
    --card-primary-font-weight: var(--mush-card-primary-font-weight, 500);
    --card-secondary-font-weight: var(--mush-card-secondary-font-weight, 400);
    --card-primary-line-height: var(--mush-card-primary-line-height, 20px);
    --card-secondary-line-height: var(--mush-card-secondary-line-height, 16px);
    --card-primary-color: var(--mush-card-primary-color, var(--primary-text-color));
    --card-secondary-color: var(--mush-card-secondary-color, var(--primary-text-color));
    --card-primary-letter-spacing: var(--mush-card-primary-letter-spacing, 0.1px);
    --card-secondary-letter-spacing: var(--mush-card-secondary-letter-spacing, 0.4px);

    /* Chips */
    --chip-spacing: var(--mush-chip-spacing, 8px);
    --chip-padding: var(--mush-chip-padding, 0 0.25em);
    --chip-height: var(--mush-chip-height, 36px);
    --chip-border-radius: var(--mush-chip-border-radius, 19px);
    --chip-border-width: var(--mush-chip-border-width, var(--ha-card-border-width, 1px));
    --chip-border-color: var(
        --mush-chip-border-color,
        var(--ha-card-border-color, var(--divider-color))
    );
    --chip-box-shadow: var(--mush-chip-box-shadow, var(--ha-card-box-shadow, "none"));
    --chip-font-size: var(--mush-chip-font-size, 0.3em);
    --chip-font-weight: var(--mush-chip-font-weight, bold);
    --chip-icon-size: var(--mush-chip-icon-size, 0.5em);
    --chip-avatar-padding: var(--mush-chip-avatar-padding, 0.1em);
    --chip-avatar-border-radius: var(--mush-chip-avatar-border-radius, 50%);
    --chip-background: var(
        --mush-chip-background,
        var(--ha-card-background, var(--card-background-color, white))
    );
    /* Controls */
    --control-border-radius: var(--mush-control-border-radius, 12px);
    --control-height: var(--mush-control-height, 40px);
    --control-button-ratio: var(--mush-control-button-ratio, 1);
    --control-icon-size: var(--mush-control-icon-size, 0.5em);

    /* Slider */
    --slider-threshold: var(--mush-slider-threshold);

    /* Input Number */
    --input-number-debounce: var(--mush-input-number-debounce);

    /* Layout */
    --layout-align: var(--mush-layout-align, center);

    /* Badge */
    --badge-size: var(--mush-badge-size, 16px);
    --badge-icon-size: var(--mush-badge-icon-size, 0.75em);
    --badge-border-radius: var(--mush-badge-border-radius, 50%);

    /* Icon */
    --icon-border-radius: var(--mush-icon-border-radius, 50%);
    --icon-size: var(--mush-icon-size, 40px);
    --icon-symbol-size: var(--mush-icon-symbol-size, 0.6em);
`,Jt=l`
    /* RGB */
    /* Standard colors */
    --rgb-red: var(--mush-rgb-red, var(--default-red));
    --rgb-pink: var(--mush-rgb-pink, var(--default-pink));
    --rgb-purple: var(--mush-rgb-purple, var(--default-purple));
    --rgb-deep-purple: var(--mush-rgb-deep-purple, var(--default-deep-purple));
    --rgb-indigo: var(--mush-rgb-indigo, var(--default-indigo));
    --rgb-blue: var(--mush-rgb-blue, var(--default-blue));
    --rgb-light-blue: var(--mush-rgb-light-blue, var(--default-light-blue));
    --rgb-cyan: var(--mush-rgb-cyan, var(--default-cyan));
    --rgb-teal: var(--mush-rgb-teal, var(--default-teal));
    --rgb-green: var(--mush-rgb-green, var(--default-green));
    --rgb-light-green: var(--mush-rgb-light-green, var(--default-light-green));
    --rgb-lime: var(--mush-rgb-lime, var(--default-lime));
    --rgb-yellow: var(--mush-rgb-yellow, var(--default-yellow));
    --rgb-amber: var(--mush-rgb-amber, var(--default-amber));
    --rgb-orange: var(--mush-rgb-orange, var(--default-orange));
    --rgb-deep-orange: var(--mush-rgb-deep-orange, var(--default-deep-orange));
    --rgb-brown: var(--mush-rgb-brown, var(--default-brown));
    --rgb-light-grey: var(--mush-rgb-light-grey, var(--default-light-grey));
    --rgb-grey: var(--mush-rgb-grey, var(--default-grey));
    --rgb-dark-grey: var(--mush-rgb-dark-grey, var(--default-dark-grey));
    --rgb-blue-grey: var(--mush-rgb-blue-grey, var(--default-blue-grey));
    --rgb-black: var(--mush-rgb-black, var(--default-black));
    --rgb-white: var(--mush-rgb-white, var(--default-white));
    --rgb-disabled: var(--mush-rgb-disabled, var(--default-disabled));

    /* Action colors */
    --rgb-info: var(--mush-rgb-info, var(--rgb-blue));
    --rgb-success: var(--mush-rgb-success, var(--rgb-green));
    --rgb-warning: var(--mush-rgb-warning, var(--rgb-orange));
    --rgb-danger: var(--mush-rgb-danger, var(--rgb-red));

    /* State colors */
    --rgb-state-vacuum: var(--mush-rgb-state-vacuum, var(--rgb-teal));
    --rgb-state-fan: var(--mush-rgb-state-fan, var(--rgb-green));
    --rgb-state-light: var(--mush-rgb-state-light, var(--rgb-orange));
    --rgb-state-entity: var(--mush-rgb-state-entity, var(--rgb-blue));
    --rgb-state-media-player: var(--mush-rgb-state-media-player, var(--rgb-indigo));
    --rgb-state-lock: var(--mush-rgb-state-lock, var(--rgb-blue));
    --rgb-state-number: var(--mush-rgb-state-number, var(--rgb-blue));
    --rgb-state-humidifier: var(--mush-rgb-state-humidifier, var(--rgb-purple));

    /* State alarm colors */
    --rgb-state-alarm-disarmed: var(--mush-rgb-state-alarm-disarmed, var(--rgb-info));
    --rgb-state-alarm-armed: var(--mush-rgb-state-alarm-armed, var(--rgb-success));
    --rgb-state-alarm-triggered: var(--mush-rgb-state-alarm-triggered, var(--rgb-danger));

    /* State person colors */
    --rgb-state-person-home: var(--mush-rgb-state-person-home, var(--rgb-success));
    --rgb-state-person-not-home: var(--mush-rgb-state-person-not-home, var(--rgb-danger));
    --rgb-state-person-zone: var(--mush-rgb-state-person-zone, var(--rgb-info));
    --rgb-state-person-unknown: var(--mush-rgb-state-person-unknown, var(--rgb-grey));

    /* State update colors */
    --rgb-state-update-on: var(--mush-rgb-state-update-on, var(--rgb-orange));
    --rgb-state-update-off: var(--mush-rgb-update-off, var(--rgb-green));
    --rgb-state-update-installing: var(--mush-rgb-update-installing, var(--rgb-blue));

    /* State lock colors */
    --rgb-state-lock-locked: var(--mush-rgb-state-lock-locked, var(--rgb-green));
    --rgb-state-lock-unlocked: var(--mush-rgb-state-lock-unlocked, var(--rgb-red));
    --rgb-state-lock-pending: var(--mush-rgb-state-lock-pending, var(--rgb-orange));

    /* State cover colors */
    --rgb-state-cover-open: var(--mush-rgb-state-cover-open, var(--rgb-blue));
    --rgb-state-cover-closed: var(--mush-rgb-state-cover-closed, var(--rgb-disabled));

    /* State climate colors */
    --rgb-state-climate-auto: var(--mush-rgb-state-climate-auto, var(--rgb-green));
    --rgb-state-climate-cool: var(--mush-rgb-state-climate-cool, var(--rgb-blue));
    --rgb-state-climate-dry: var(--mush-rgb-state-climate-dry, var(--rgb-orange));
    --rgb-state-climate-fan-only: var(--mush-rgb-state-climate-fan-only, var(--rgb-teal));
    --rgb-state-climate-heat: var(--mush-rgb-state-climate-heat, var(--rgb-deep-orange));
    --rgb-state-climate-heat-cool: var(--mush-rgb-state-climate-heat-cool, var(--rgb-green));
    --rgb-state-climate-idle: var(--mush-rgb-state-climate-idle, var(--rgb-disabled));
    --rgb-state-climate-off: var(--mush-rgb-state-climate-off, var(--rgb-disabled));
`,Gt=l`
    :host {
        ${Wt}
    }
    :host([dark-mode]) {
        ${Kt}
    }
    :host {
        ${Jt}
        ${qt}
    }
    ha-card {
        box-sizing: border-box;
        padding: var(--spacing);
        display: flex;
        flex-direction: column;
        justify-content: var(--layout-align);
        height: auto;
    }
    ha-card.fill-container {
        height: 100%;
    }
    .actions {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        justify-content: flex-start;
        overflow-x: auto;
        overflow-y: hidden;
        scrollbar-width: none; /* Firefox */
        -ms-overflow-style: none; /* IE 10+ */
    }
    .actions::-webkit-scrollbar {
        background: transparent; /* Chrome/Safari/Webkit */
        height: 0px;
    }
    .actions *:not(:last-child) {
        margin-right: var(--spacing);
    }
    .actions[rtl] *:not(:last-child) {
        margin-right: initial;
        margin-left: var(--spacing);
    }
    .unavailable {
        --main-color: rgb(var(--rgb-warning));
    }
    .not-found {
        --main-color: rgb(var(--rgb-danger));
    }
    mushroom-state-item[disabled] {
        cursor: initial;
    }
`,Qt=(e,t,r=!1,a=!0)=>{const i=t.color??"disabled",n=(e=>Boolean(e&&Array.isArray(e)))(e)?e:[e??"background"],o={},s=(e=>["primary","accent"].includes(e)?`var(--rgb-${e}-color)`:`var(--rgb-${e})`)(i),l=n.includes("background")&&(!r&&"black"===i||r&&"white"===i),c="black"===i?"rgba(255, 255, 255, .7)":"rgba(0, 0, 0, .7)";return n.includes("icon")&&(o["--trash-card-icon-color"]=`rgba(${s})`),n.includes("background")&&(o["--trash-card-background"]=`rgba(${s}, .7)`),l&&(o["--text-color"]=c,o["--card-primary-color"]=c,o["--card-secondary-color"]=c,o["--primary-text-color"]=c),l&&a&&(o["--trash-card-icon-color"]=c),o},Xt=Ee(class extends De{constructor(e){var t;if(super(e),e.type!==xe||"class"!==e.name||(null===(t=e.strings)||void 0===t?void 0:t.length)>2)throw Error("`classMap()` can only be used in the `class` attribute and must be the only part in the attribute.")}render(e){return" "+Object.keys(e).filter((t=>e[t])).join(" ")+" "}update(e,[t]){var r,a;if(void 0===this.it){this.it=new Set,void 0!==e.strings&&(this.nt=new Set(e.strings.join(" ").split(/\s/).filter((e=>""!==e))));for(const e in t)t[e]&&!(null===(r=this.nt)||void 0===r?void 0:r.has(e))&&this.it.add(e);return this.render(t)}const i=e.element.classList;this.it.forEach((e=>{e in t||(i.remove(e),this.it.delete(e))}));for(const e in t){const r=!!t[e];r===this.it.has(e)||(null===(a=this.nt)||void 0===a?void 0:a.has(e))||(r?(i.add(e),this.it.add(e)):(i.remove(e),this.it.delete(e)))}return Y}});let er=class extends oe{render(){if(!this.item||!this.config)return H;const e=this.item.icon??"mdi:delete-outline";return L`<ha-state-icon
        .hass=${this.hass}
        .icon=${e}
        slot=${this.slot?this.slot:void 0}
      ></ha-state-icon>`}static get styles(){return[l`
        ha-state-icon {
          color: var(--trash-card-icon-color);
        }
      `]}};t([he()],er.prototype,"item",void 0),t([he()],er.prototype,"hass",void 0),t([he()],er.prototype,"config",void 0),er=t([le(`${pe}-element-icon`)],er);let tr=class extends oe{render(){return this.pictureUrl?L`<img
    src="${this.pictureUrl}" slot=${this.slot?this.slot:void 0}/>`:H}static get styles(){return[l`
        img {
          height: var(--mdc-icon-size);
          width:  var(--mdc-icon-size);
          object-fit: contain;
        }
      `]}};t([he()],tr.prototype,"item",void 0),t([he()],tr.prototype,"hass",void 0),t([he()],tr.prototype,"config",void 0),t([he()],tr.prototype,"pictureUrl",void 0),tr=t([le(`${pe}-element-picture`)],tr);class rr extends oe{constructor(){super(...arguments),this.withBackground=!1}getPictureUrl(){return e=this.item.picture,t=this.hass,e?`${t.hassUrl(e)}`:void 0;var e,t;
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */}getWithBackgroundClass(){return{withBackground:Boolean(this.withBackground)}}renderPicture(e){const t={...this.getWithBackgroundClass()};return L`
      <trash-card-element-picture
        class=${Xt(t)}
        .hass=${this.hass}
        .config=${this.config}
        .pictureUrl=${e}
      ></trash-card-element-icon>`}renderIcon(){const e={...this.getWithBackgroundClass()};return L`
      <trash-card-element-icon
        class=${Xt(e)}
        .background=${this.withBackground}
        .hass=${this.hass}
        .config=${this.config}
        .item=${this.item}
      ></trash-card-element-icon>`}static get styles(){return[l`
        .withBackground {
          display: grid;
          border-radius: 50%;
          justify-content: center;
          align-content: center;
          width: calc(var(--mdc-icon-size) *1.5);
          height: calc(var(--mdc-icon-size) *1.5);
          background-color: rgba(var(--rgb-disabled), 0.2);;
        }
      `]}}t([he()],rr.prototype,"item",void 0),t([he()],rr.prototype,"hass",void 0),t([he()],rr.prototype,"config",void 0);let ar=class extends rr{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,t=it(this.hass),{color_mode:r,hide_time_range:a,day_style:i,layout:n,with_label:o,day_style_format:s}=this.config,{label:l}=e,c={...Qt(r,e,this.hass.themes.darkMode)},d=Zt(e,a??!1,i,s,this.hass),u=Ft(new Date,e),h={today:0===u,tomorrow:1===u,another:u>1},m=this.getPictureUrl();return this.withBackground=!0,L`
      <ha-card style=${Ce(c)} class=${Xt(h)}>
        <mushroom-card .appearance=${{layout:n}} ?rtl=${t}>
          <mushroom-state-item .appearance=${{layout:n}} ?rtl=${t}>
            <div slot="icon">
              ${m?this.renderPicture(m):this.renderIcon()}
            </div>
            <mushroom-state-info
              slot="info"
              .primary=${o?l:d}
              .secondary=${o?d:void 0}
              .multiline_secondary=${!0}
            ></mushroom-state-info>
          </mushroom-state-item>
        </mushroom-card>
      </ha-card>
    `}static get styles(){return[Gt,...rr.styles,l`
        ha-card {
          justify-content: space-between;
          height: 100%;
          --mdc-icon-size: var(--trash-card-icon-size, 24px);
          background: var(--trash-card-background, 
              var(--ha-card-background, 
                var(--card-background-color, #fff)
              )
            );
        } 
      `]}};ar=t([le(`${pe}-item-card`)],ar);let ir=class extends oe{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e=this.config.items_per_row??1,t=Ce({"grid-template-columns":`repeat(${e}, calc(calc(100% - calc(${e-1} * var(--grid-card-gap, 2px))) / ${e}))`});return L`
        <div style=${t} class="card-container">
          ${this.items.map(((e,t)=>L`
              <trash-card-item-card
                key=${`card-${t}-${e.content.uid}`}
                .item=${e}
                .config=${this.config}
                .hass=${this.hass}
              >
              </trash-card-item-card>
            `))}
        </div>
      `}static get styles(){return[l`
        .card-container {
          display: grid;
          grid-auto-rows: 1fr;
          grid-gap: var(--grid-card-gap, 2px);
        }
        trash-card-item-card {
          grid-row: auto / span 1;
        }
      `]}};t([he()],ir.prototype,"items",void 0),t([ue({attribute:!1})],ir.prototype,"hass",void 0),t([he()],ir.prototype,"config",void 0),ir=t([le(`${pe}-cards-container`)],ir);let nr=class extends rr{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,t=it(this.hass),{color_mode:r,hide_time_range:a,day_style:i,day_style_format:n,with_label:o}=this.config,s={...Qt(r,e,this.hass.themes.darkMode),...o?{"--chip-height":"calc(36px * 1.15)"}:{}},l=Zt(e,a??!1,i,n,this.hass),c=Ft(new Date,e),d={today:0===c,tomorrow:1===c,another:c>1},u=this.getPictureUrl();return this.withBackground=!0,L`
      <mushroom-chip
        style=${Ce(s)}
        class=${Xt(d)}
        ?rtl=${t}
        .avatarOnly=${!1}
      >
        ${u?this.renderPicture(u):this.renderIcon()}
        <span>
          ${o?L`<span class="chip-label">${e.label}</span>`:H}
          ${l?L`<span class="chip-content">${l}</span>`:H}
        </span>
      </mushroom-chip>`}static get styles(){return[...rr.styles,l`
        mushroom-chip {
          --mdc-icon-size: var(--trash-card-icon-size, 16px);
          --chip-background: var(--trash-card-background, 
              var(--ha-card-background, 
                var(--card-background-color, #fff)
              )
            );
          --chip-padding: 0.25em .5em 0.25em 0.25em;
          --chip-height: calc(36px * 1.15);
        } 
        mushroom-chip  ha-card {
          
        }
        .chip-label {
          font-weight: 600;
        }
        .chip-label + .chip-content {
          display: block;
          font-weight: 300;
          margin-top: 3px;
        }
      `]}};nr=t([le(`${pe}-item-chip`)],nr);let or=class extends oe{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e={"chip-container":!0,"align-justify":"space"===this.config.alignment_style,"align-center":"center"===this.config.alignment_style,"align-end":"right"===this.config.alignment_style};return L`
      <div class=${Xt(e)}>
        ${this.items.map(((e,t)=>L`
          <trash-card-item-chip
            key=${`card-${t}-${e.content.uid}`}
            .item=${e}
            .config=${this.config}
            .hass=${this.hass}
          >
          </trash-card-item-card>
        `))}
    </div>
  `}static get styles(){return[Gt,l`
        .chip-container {
            display: flex;
            flex-direction: row;
            align-items: flex-start;
            justify-content: flex-start;
            flex-wrap: wrap;
            margin-bottom: calc(-1 * var(--chip-spacing));
        }
        .chip-container.align-end {
            justify-content: flex-end;
        }
        .chip-container.align-center {
            justify-content: center;
        }
        .chip-container.align-justify {
            justify-content: space-between;
        }
        .chip-container * {
            margin-bottom: var(--chip-spacing);
        }
        .chip-container *:not(:last-child) {
            margin-right: var(--chip-spacing);
        }
        .chip-container[rtl] *:not(:last-child) {
            margin-right: initial;
            margin-left: var(--chip-spacing);
        }
      `]}};t([he()],or.prototype,"items",void 0),t([ue({attribute:!1})],or.prototype,"hass",void 0),t([he()],or.prototype,"config",void 0),or=t([le(`${pe}-chips-container`)],or);let sr=class extends rr{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,t=it(this.hass),r={...Qt(["icon","background"],e,this.hass.themes.darkMode,!1),"--trash-card-icon-size":`${this.config.icon_size??40}px`},a=Ft(new Date,e),i={today:0===a,tomorrow:1===a,another:a>1,nextEvent:this.item.nextEvent,futureEvent:!this.item.nextEvent},n=this.getPictureUrl();return this.withBackground=!0,L`
      <ha-card style=${Ce(r)} class=${Xt(i)}>
        <mushroom-card .appearance=${{layout:"vertical"}} ?rtl=${t}>
          <mushroom-state-item .appearance=${{layout:"vertical"}} ?rtl=${t}>
            <div slot="icon">
              ${n?this.renderPicture(n):this.renderIcon()}
            </div>
          </mushroom-state-item>
        </mushroom-card>
        <span class="badge" >${a}</span>
      </ha-card>
    `}static get styles(){return[Gt,...rr.styles,l`
        :host {
          --ha-card-border-width: 0px;
          --ha-card-background: transparent;
        }
        ha-card {
          height: 100%;
          grid-row: auto / span 1;
          display: grid;
          grid-template-columns: 1fr;
          grid-template-rows: 1fr auto;
          --mdc-icon-size: var(--trash-card-icon-size, 40px);
        }
        mushroom-card {
          align-self: center;
        }
        .badge {
          display: inline-grid;
          border-radius: 15px;
          background-color: var(--trash-card-background);
          color: var(--primary-text-color);
          overflow: hidden;
          font-size: 80%;
          text-align: center;
          width: fit-content;
          padding: 0 1em;
          justify-self: center;
          border-width: var(--trash-card-badge-border-width, 1px);
          border-color: var(--chip-border-color);
          border-style: solid;
          box-shadow: var(--chip-box-shadow);
          box-sizing: content-box;
        }
      `]}};sr=t([le(`${pe}-icon-card`)],sr);let lr=class extends oe{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e=this.items.length,t=Ce({"grid-template-columns":`repeat(${e}, calc(calc(100% - calc(${5*(e-1)} * var(--grid-card-gap, 2px))) / ${e}))`});return L`
        <div style=${t} class="icons-container">
          ${this.items.map(((e,t)=>L`
              <trash-card-icon-card
                key=${`card-${t}-${e.content.uid}`}
                .item=${{...e,nextEvent:0===t}}
                .config=${this.config}
                .hass=${this.hass}
              >
              </trash-card-icon-card>
            `))}
        </div>
      `}static get styles(){return[l`
        .icons-container {
          display: grid;
          grid-auto-rows: 1fr;
          grid-gap: var(--grid-card-gap, 2px);
        }
        trash-card-icon-card {
          grid-row: auto / span 1;
        }
      `]}};t([he()],lr.prototype,"items",void 0),t([ue({attribute:!1})],lr.prototype,"hass",void 0),t([he()],lr.prototype,"config",void 0),lr=t([le(`${pe}-icons-container`)],lr);let cr=class extends oe{render(){return L`
          <div class="title">
            <h3><slot name="title"></slot></h3>
            <div><slot name="title-icon"></slot></div>
          </div>`}static get styles(){return[l`
      .title {
          display: grid;
          color: rgb(var(--rgb-pink));
          grid-template-columns: auto  50px
        }
      `]}};cr=t([le(`${pe}-title`)],cr);let dr=class extends oe{render(){if(!this.item)return H;const{message:e,data:t}=this.item;return L`
      <ha-expansion-panel outlined>
        <div slot="header" role="heading" aria-level="3" >
          ${e}
        </div>
        <code>${JSON.stringify(t,void 0,2)}</code>
      </ha-form-expandable>`}static get styles(){return[l` 
        .container.expanded {
          padding: 8px;
        }
        code {
          display: block;
          margin-top: 10px;
          margin-bottom: 10px;
          white-space: pre-wrap;
          font-size: 12px;
        }
      `]}};t([he()],dr.prototype,"item",void 0),dr=t([le(`${pe}-logrow`)],dr);let ur=class extends oe{copyDebugLogToClipboard(e){e.stopPropagation(),navigator.clipboard.writeText(JSON.stringify(this.debugger?.getLogs()??{})).then((()=>{alert("Debug data copied to clipboard")}))}render(){return this.debugger?L`<ha-card class="debug-container">
        <trash-card-title>
          <span slot="title">DEBUG LOG</span>
          <ha-icon-button
            .label="copy debug log to clipboard"
            class="copy-to-clipboard-icon"
            slot="title-icon"
            @click=${this.copyDebugLogToClipboard.bind(this)}
          >
            <ha-icon icon="mdi:content-copy"></ha-icon>
          </ha-icon-button>
        </trash-card-title>

        <div class="content">
          ${this.debugger.getLogs().map((e=>L`
            <trash-card-logrow
              .item=${e}
            ></trash-card-logrow>
            `))}
        </div>
    </ha-card>`:H}static get styles(){return[Gt,l`
        .debug-container {
          margin-bottom: 5px;
          border: rgb(var(--rgb-pink)) dotted 1px;
          opacity: 0.7;
        }
      `]}};t([he()],ur.prototype,"debugger",void 0),ur=t([le(`${pe}-debug-container`)],ur),(t=>{const r=window;r.customCards=r.customCards||[],r.customCards.push({...t,preview:!0,documentationURL:`${e}/blob/main/README.md`})})({type:pe,name:"TrashCard",description:"TrashCard - indicates what type of trash will be picked up next based on your calendar entries 🗑️"});const hr={tap_action:{action:"more-info"},hold_action:{action:"more-info"},with_label:!0,debug:!1};let mr=class extends oe{constructor(){super(...arguments),this.startDate=new Date,this.endDate=new Date}static async getConfigElement(){return await Promise.resolve().then((function(){return Kr})),document.createElement(ge)}static async getStubConfig(e){const t=Object.keys(e.states);return{type:`custom:${pe}`,entities:[t[0]]}}get hass(){return this._hass}set hass(e){this._hass=e,this.shadowRoot?.querySelectorAll("div > *").forEach((t=>{t.setHass(e)}))}setConfig(e){this.config={...hr,...ze(e)?Ae(e):e},this.debugger=new fe}setDateRange(){this.startDate=new Date,this.endDate=new Date,this.endDate.setDate(this.endDate.getDate()+(this.config?.next_days??2)+1)}fetchCurrentTrashData(){if(!this.hass||!this.config||!this.debugger)return;this.setDateRange();const e=r(this.startDate),t=r(this.endDate),a=((e,t)=>{const[r,a,i]=t.split(":");return!(e.getHours()<Number(r))&&(e.getHours()>Number(r)||e.getMinutes()>Number(a)||e.getSeconds()>=Number(i))})(new Date,this.config.drop_todayevents_from??"10:00:00"),i=_e();ke(this.hass,this.config.entities,{start:e,end:t,dropAfter:a},this.debugger,this.config,i).then((e=>{this.currentItems=e,this.lastChanged=new Date}))}getRefreshRate(){return 60*(this.config?.refresh_rate??60)*1e3}shouldUpdate(e){return!!e.has("currentItems")||(e.delete("currentItems"),(!this.lastChanged||e.has("config")||Date.now()-this.lastChanged.getTime()>this.getRefreshRate())&&this.fetchCurrentTrashData(),!1)}createBaseContainerElement(e){try{const t=`trash-card-${e??"card"}s-container`;if(customElements.get(t)){const e=document.createElement(t,this.config);return e.setConfig(this.config),e.setItems(this.currentItems),e}const r=document.createElement(t);return customElements.whenDefined(t).then((()=>{customElements.upgrade(r),r.setConfig(this.config),r.setItems(this.currentItems)})).catch((()=>{})),r}catch{return}}render(){if(!this.config||!this.hass)return H;if(!this.currentItems||0===this.currentItems.length)return this.config.debug?L`<trash-card-debug-container .debugger=${this.debugger}></trash-card-debug-card>`:H;const e=this.createBaseContainerElement(this.config.card_style);return e?(e.setHass(this.hass),L`
      ${this.config.debug?L`<trash-card-debug-container .debugger=${this.debugger}></trash-card-debug-card>`:""}
      ${e}`):H}};t([he()],mr.prototype,"_hass",void 0),t([he()],mr.prototype,"config",void 0),t([ue()],mr.prototype,"currentItems",void 0),t([ue()],mr.prototype,"startDate",void 0),t([ue()],mr.prototype,"endDate",void 0),t([ue()],mr.prototype,"debugger",void 0),mr=t([le(pe)],mr),console.info("%c🗑️ TrashCard 2.2.1","background-color: #ef5350; color: #ffffff");class pr extends TypeError{constructor(e,t){let r;const{message:a,explanation:i,...n}=e,{path:o}=e,s=0===o.length?a:`At path: ${o.join(".")} -- ${a}`;super(i??s),null!=i&&(this.cause=s),Object.assign(this,n),this.name=this.constructor.name,this.failures=()=>r??(r=[e,...t()])}}function gr(e){return"object"==typeof e&&null!=e}function fr(e){return"symbol"==typeof e?e.toString():"string"==typeof e?JSON.stringify(e):`${e}`}function yr(e,t,r,a){if(!0===e)return;!1===e?e={}:"string"==typeof e&&(e={message:e});const{path:i,branch:n}=t,{type:o}=r,{refinement:s,message:l=`Expected a value of type \`${o}\`${s?` with refinement \`${s}\``:""}, but received: \`${fr(a)}\``}=e;return{value:a,type:o,refinement:s,key:i[i.length-1],path:i,branch:n,...e,message:l}}function*vr(e,t,r,a){(function(e){return gr(e)&&"function"==typeof e[Symbol.iterator]})(e)||(e=[e]);for(const i of e){const e=yr(i,t,r,a);e&&(yield e)}}function*br(e,t,r={}){const{path:a=[],branch:i=[e],coerce:n=!1,mask:o=!1}=r,s={path:a,branch:i};if(n&&(e=t.coercer(e,s),o&&"type"!==t.type&&gr(t.schema)&&gr(e)&&!Array.isArray(e)))for(const r in e)void 0===t.schema[r]&&delete e[r];let l="valid";for(const a of t.validator(e,s))a.explanation=r.message,l="not_valid",yield[a,void 0];for(let[c,d,u]of t.entries(e,s)){const t=br(d,u,{path:void 0===c?a:[...a,c],branch:void 0===c?i:[...i,d],coerce:n,mask:o,message:r.message});for(const r of t)r[0]?(l=null!=r[0].refinement?"not_refined":"not_valid",yield[r[0],void 0]):n&&(d=r[1],void 0===c?e=d:e instanceof Map?e.set(c,d):e instanceof Set?e.add(d):gr(e)&&(void 0!==d||c in e)&&(e[c]=d))}if("not_valid"!==l)for(const a of t.refiner(e,s))a.explanation=r.message,l="not_refined",yield[a,void 0];"valid"===l&&(yield[void 0,e])}class _r{constructor(e){const{type:t,schema:r,validator:a,refiner:i,coercer:n=(e=>e),entries:o=function*(){}}=e;this.type=t,this.schema=r,this.entries=o,this.coercer=n,this.validator=a?(e,t)=>vr(a(e,t),t,this,e):()=>[],this.refiner=i?(e,t)=>vr(i(e,t),t,this,e):()=>[]}assert(e,t){return wr(e,this,t)}create(e,t){return function(e,t,r){const a=$r(e,t,{coerce:!0,message:r});if(a[0])throw a[0];return a[1]}(e,this,t)}is(e){return function(e,t){const r=$r(e,t);return!r[0]}(e,this)}mask(e,t){return function(e,t,r){const a=$r(e,t,{coerce:!0,mask:!0,message:r});if(a[0])throw a[0];return a[1]}(e,this,t)}validate(e,t={}){return $r(e,this,t)}}function wr(e,t,r){const a=$r(e,t,{message:r});if(a[0])throw a[0]}function $r(e,t,r={}){const a=br(e,t,r),i=function(e){const{done:t,value:r}=e.next();return t?void 0:r}(a);if(i[0]){const e=new pr(i[0],(function*(){for(const e of a)e[0]&&(yield e[0])}));return[e,void 0]}return[void 0,i[1]]}function kr(e,t){return new _r({type:e,schema:null,validator:t})}function zr(e){return new _r({type:"array",schema:e,*entries(t){if(e&&Array.isArray(t))for(const[r,a]of t.entries())yield[r,a,e]},coercer:e=>Array.isArray(e)?e.slice():e,validator:e=>Array.isArray(e)||`Expected an array value, but received: ${fr(e)}`})}function Ar(){return kr("boolean",(e=>"boolean"==typeof e))}function xr(){return kr("integer",(e=>"number"==typeof e&&!isNaN(e)&&Number.isInteger(e)||`Expected an integer, but received: ${fr(e)}`))}function Er(e){const t=fr(e),r=typeof e;return new _r({type:"literal",schema:"string"===r||"number"===r||"boolean"===r?e:null,validator:r=>r===e||`Expected the literal \`${t}\`, but received: ${fr(r)}`})}function Dr(){return kr("number",(e=>"number"==typeof e&&!isNaN(e)||`Expected a number, but received: ${fr(e)}`))}function Sr(e){const t=e?Object.keys(e):[],r=kr("never",(()=>!1));return new _r({type:"object",schema:e||null,*entries(a){if(e&&gr(a)){const i=new Set(Object.keys(a));for(const r of t)i.delete(r),yield[r,a[r],e[r]];for(const e of i)yield[e,a[e],r]}},validator:e=>gr(e)||`Expected an object, but received: ${fr(e)}`,coercer:e=>gr(e)?{...e}:e})}function Tr(e){return new _r({...e,validator:(t,r)=>void 0===t||e.validator(t,r),refiner:(t,r)=>void 0===t||e.refiner(t,r)})}function Cr(){return kr("string",(e=>"string"==typeof e||`Expected a string, but received: ${fr(e)}`))}function Mr(e){const t=e.map((e=>e.type)).join(" | ");return new _r({type:"union",schema:null,coercer(t){for(const r of e){const[e,a]=r.validate(t,{coerce:!0});if(!e)return a}return t},validator(r,a){const i=[];for(const t of e){const[...e]=br(r,t,a),[n]=e;if(!n[0])return[];for(const[t]of e)t&&i.push(t)}return[`Expected the value to satisfy a union of \`${t}\`, but received: ${fr(r)}`,...i]}})}const jr=e=>!!e&&e.themes.darkMode,Rr=Sr({index:Tr(Dr()),view_index:Tr(Dr()),view_layout:kr("any",(()=>!0)),type:Cr()}),Ir=["default","counter","custom"],Nr=["card","chip","icon"],Pr=["left","center","right","space"],Ur=["background","icon"],Or=function(...e){const t="type"===e[0].type,r=e.map((e=>e.schema)),a=Object.assign({},...r);return t?function(e){const t=Object.keys(e);return new _r({type:"type",schema:e,*entries(r){if(gr(r))for(const a of t)yield[a,r[a],e[a]]},validator:e=>gr(e)||`Expected an object, but received: ${fr(e)}`,coercer:e=>gr(e)?{...e}:e})}(a):Sr(a)}(Rr,Sr({entities:Tr(zr(Cr())),name:Tr(Cr()),layout:Tr(Mr([Er("horizontal"),Er("vertical"),Er("default")])),fill_container:Tr(Ar()),filter_events:Tr(Ar()),full_size:Tr(Ar()),use_summary:Tr(Ar()),hide_time_range:Tr(Ar()),next_days:Tr(xr()),items_per_row:Tr(xr()),refresh_rate:Tr(xr()),drop_todayevents_from:Tr(Cr()),event_grouping:Tr(Ar()),day_style:Tr(Mr([Er(Ir[0]),Er(Ir[1]),Er(Ir[2])])),day_style_format:Tr(Cr()),card_style:Tr(Mr([Er(Nr[0]),Er(Nr[1]),Er(Nr[2])])),alignment_style:Tr(Mr([Er(Pr[0]),Er(Pr[1]),Er(Pr[2]),Er(Pr[3])])),color_mode:Tr(Mr([Er(Ur[0]),Er(Ur[1])])),debug:Tr(Ar()),icon_size:Tr(xr()),with_label:Tr(Ar()),pattern:Tr(zr(Sr({color:Tr(Cr()),icon:Tr(Cr()),label:Tr(Cr()),pattern:Tr(Cr()),picture:Tr(Cr()),type:Cr()})))})),Lr=e=>[{name:"icon",label:e("ui.panel.lovelace.editor.card.generic.icon"),selector:{icon:{}},context:{icon_entity:"entity"}},{name:"color",label:e("ui.panel.lovelace.editor.card.tile.color"),selector:{ui_color:{}}}],Yr=(e,t,r)=>{const a=[{type:"grid",name:"",schema:[{name:"filter_events",label:e("editor.card.generic.filter_events"),selector:{boolean:{}}},{name:"drop_todayevents_from",label:e("editor.card.generic.drop_todayevents_from"),default:{hours:11,minutes:0,seconds:0},selector:{time:{}}},{name:"next_days",label:e("editor.card.generic.next_days"),selector:{number:{min:1,max:365,step:1,mode:"box"}}},{name:"refresh_rate",label:e("editor.form.refresh_rate.title"),helper:e("editor.form.refresh_rate.helper"),selector:{number:{min:5,max:1440,step:5,mode:"box"}}}]}],i=[{name:"card_style",label:e("editor.form.card_style.title"),selector:{select:{options:[...Nr].map((t=>({value:t,label:e(`editor.form.card_style.values.${t}`)}))),mode:"dropdown"}}},{type:"grid",name:"",schema:[..."icon"===t.card_style?[{name:"icon_size",label:e("editor.card.generic.icon_size"),selector:{number:{min:10,max:160,step:1,mode:"box"}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"day_style",label:e("editor.form.day_style.title"),selector:{select:{options:[...Ir].map((t=>({value:t,label:e(`editor.form.day_style.values.${t}`)}))),mode:"dropdown"}}}]:[],..."card"!==t.card_style&&"chip"!==t.card_style||"custom"!==t.day_style?[]:[{name:"day_style_format",label:e("editor.form.day_style_format.title"),helper:e("editor.form.day_style_format.helper"),selector:{text:{}}}],..."card"===t.card_style||"chip"===t.card_style?[{name:"hide_time_range",label:e("editor.card.generic.hide_time_range"),selector:{boolean:{}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"with_label",label:e("editor.card.generic.with_label"),selector:{boolean:{}}}]:[],...!t.with_label||"card"!==t.card_style&&"chip"!==t.card_style?[]:[{name:"use_summary",label:e("editor.card.generic.use_summary"),selector:{boolean:{}}}],..."card"===t.card_style||"chip"===t.card_style?[{name:"event_grouping",label:e("editor.card.generic.event_grouping"),selector:{boolean:{default:!0}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"color_mode",label:e("editor.form.color_mode.title"),selector:{select:{options:[...Ur].map((t=>({value:t,label:e(`editor.form.color_mode.values.${t}`)}))),mode:"dropdown"}}}]:[]]},..."card"===t.card_style?[{type:"grid",name:"",schema:[{name:"layout",label:e("editor.card.generic.layout"),selector:{mush_layout:{}}}]},{type:"grid",name:"",schema:[{name:"full_size",label:e("editor.card.generic.full_size"),selector:{boolean:{}}},{name:"items_per_row",label:r("ui.panel.lovelace.editor.card.grid.columns"),selector:{number:{min:1,max:6,step:1,mode:"box"}}}]}]:[],..."chip"===t.card_style?[{type:"grid",name:"",schema:[{name:"alignment_style",label:e("editor.form.alignment_style.title"),selector:{select:{options:[...Pr].map((t=>({value:t,label:e(`editor.form.alignment_style.values.${t}`)}))),mode:"dropdown"}}}]}]:[]];return[{name:"entities",selector:{entity:{domain:"calendar",multiple:!0}}},{type:"expandable",name:"",title:e("editor.form.tabs.settings"),icon:"mdi:cog",schema:a},{type:"expandable",name:"",title:e("editor.form.tabs.appearance"),icon:"mdi:palette",schema:i}]},Hr=(e,t,r,a)=>{a=a??{},r=r||{};const i=new Event(t,{bubbles:void 0===a.bubbles||a.bubbles,cancelable:Boolean(a.cancelable),composed:void 0===a.composed||a.composed});return i.detail=r,e.dispatchEvent(i),i},Br={},Fr=Ee(class extends De{constructor(){super(...arguments),this.st=Br}render(e,t){return t()}update(e,[t,r]){if(Array.isArray(t)){if(Array.isArray(this.st)&&this.st.length===t.length&&t.every(((e,t)=>e===this.st[t])))return Y}else if(this.st===t)return Y;return this.st=Array.isArray(t)?Array.from(t):t,this.render(t,r)}});let Vr=class extends oe{constructor(){super(...arguments),this.attached=!1}connectedCallback(){super.connectedCallback(),this.attached=!0}disconnectedCallback(){super.disconnectedCallback(),this.attached=!1}updated(e){super.updated(e);const t=e.has("attached"),r=e.has("pattern");(r||t)&&r&&this.handleSettingsChanged()}async handleSettingsChanged(){await this.updateComplete}render(){if(!this.hass||!this.pattern)return H;const e=Bt(this.hass);return L`
      <div class="settings">
      ${Fr([this.pattern],(()=>this.pattern.map(((t,r)=>L`
          <div class="setting">
            <div class="icon">
              <ha-icon icon="${t.icon}"></ha-icon>
            </div>

            <div class="special-row">
              <div>
                <span> ${t.label??e(`editor.card.trash.pattern.type.${t.type}`)}</span>
              </div>
            </div>

            <ha-icon-button
              .label=${e("editor.card.trash.pattern.edit")}
              class="edit-icon"
              .index=${r}
              @click=${this.editItem}
              >
              <ha-icon icon="mdi:pencil"></ha-icon>
            </ha-icon-button>
            <ha-icon-button
              .label=${e("editor.card.trash.pattern.delete")}
              class="delete-icon"
              .index=${r}
              .disabled=${"custom"!==t.type}
              @click=${this.deleteItem}
              >
              <ha-icon icon="mdi:close"></ha-icon>
            </ha-icon-button>
          </div>`))))}

        <mwc-button
          @click=${this.createItem}
          class="gui-mode-button"
        >${e("editor.card.trash.pattern.create")}</mwc-button>
    </div>`}editItem(e){const{index:t}=e.currentTarget;Hr(this,"edit-pattern-item",{subElementConfig:{index:t,key:t,elementConfig:this.pattern[t]}})}deleteItem(e){const{index:t}=e.currentTarget;Hr(this,"delete-pattern-item",{index:t})}createItem(e){const{index:t}=e.currentTarget;Hr(this,"create-pattern-item",{index:t})}static get styles(){return[l`
        .settings {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            grid-gap: var(--spacing);
        }

        .setting {
            display: flex;
            align-items: center;
        }

        ha-icon {
            display: flex;
        }

        mushroom-select {
            width: 100%;
        }

        .setting .icon {
            padding-right: 8px;
            cursor: move;
        }

        .setting .icon > * {
            pointer-events: none;
        }

        .special-row {
            height: 60px;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-grow: 1;
        }

        .special-row div {
            display: flex;
            flex-direction: column;
        }

        .remove-icon,
        .edit-icon {
            --mdc-icon-button-size: 36px;
            color: var(--secondary-text-color);
        }

        .secondary {
            font-size: 12px;
            color: var(--secondary-text-color);
        }
        `]}};t([ue({attribute:!1})],Vr.prototype,"hass",void 0),t([he()],Vr.prototype,"pattern",void 0),t([he()],Vr.prototype,"attached",void 0),Vr=t([le("trash-card-pattern-editor")],Vr);const Zr={event_grouping:!0,drop_todayevents_from:"10:00:00",next_days:2,pattern:[{icon:"mdi:flower",color:"lime",type:"organic"},{icon:"mdi:newspaper",color:"blue",type:"paper"},{icon:"mdi:recycle-variant",color:"amber",type:"recycle"},{icon:"mdi:trash-can-outline",color:"grey",type:"waste"},{icon:"mdi:dump-truck",color:"purple",type:"others"}],day_style:"default",day_style_format:"yyyy.MM.dd",card_style:"card",alignment_style:"left",color_mode:"background",items_per_row:1,refresh_rate:60,with_label:!0};let Wr=class extends oe{constructor(){super(...arguments),this.schema=Oe(Yr),this.computeLabel=e=>this.hass?e.label??"":e.label,this.computeHelper=e=>this.hass?e.helper??"":e.name}setConfig(e){ze(e)?Hr(this,"config-changed",{config:{...Zr,...Ae(e)}}):(wr(e,Or),this.config={...Zr,...e})}updated(e){if(super.updated(e),e.has("hass")&&this.hass){const t=jr(e.get("hass")),r=jr(this.hass);t!==r&&this.toggleAttribute("dark-mode",r)}}renderFormPatternsEditor(){if(!this.hass)return H;const e=Bt(this.hass);if(this.subElementEditorConfig){const t="others"===this.subElementEditorConfig.elementConfig?.type?Lr(this.hass.localize):((e,t)=>[{label:e("editor.card.trash.pattern.fields.label"),name:"label",selector:{text:{}}},...Lr(t),{label:e("editor.card.trash.pattern.fields.pattern"),name:"pattern",selector:{text:{}}},{label:e("editor.card.trash.pattern.fields.picture_url"),helper:e("editor.card.trash.pattern.fields.picture_url_description"),name:"picture",selector:{text:{}},context:{icon_entity:"entity"}}])(e,this.hass.localize);return L`
        <div class="header" id="trashcard-pattern-editor">
          <div class="back-title">
              <ha-icon-button
                  .label=${this.hass.localize("ui.common.back")}
                  @click=${this.goBack}
              >
                <ha-icon icon="mdi:arrow-left"></ha-icon>
              </ha-icon-button>
              <span slot="title">${e("editor.card.trash.pattern.title")}</span>
          </div>
        </div>
          <ha-form
              .hass=${this.hass}
              .computeLabel=${this.computeLabel}
              .computeHelper=${this.computeHelper}
              .data=${this.subElementEditorConfig.elementConfig}
              .schema=${t}
              @value-changed=${this.handleSubElementChanged}
          >
          </ha-form>
      `}return L`
      <trash-card-pattern-editor
        .hass=${this.hass}
          .pattern=${this.config.pattern}
          @delete-pattern-item=${this.deletePatternItem}  
          @create-pattern-item=${this.createPatternItem}  
          @edit-pattern-item=${this.editPatternItem}
          @settings-changed=${this.valueChanged}
      ></trash-card-pattern-editor>`}goBack(){this.subElementEditorConfig=void 0}handleSubElementChanged(e){if(e.stopPropagation(),!this.config||!this.hass||!this.subElementEditorConfig)return;const t=this.subElementEditorConfig.key,{value:r}=e.detail,a={...this.config,pattern:[...this.config.pattern??[]]};a.pattern[t]=r,this.subElementEditorConfig={...this.subElementEditorConfig,elementConfig:r},Hr(this,"config-changed",{config:a})}editPatternItem(e){this.subElementEditorConfig=e.detail.subElementConfig}createPatternItem(e){if(e.stopPropagation(),!this.config||!this.hass)return;const t=Bt(this.hass),r={...this.config,pattern:[...this.config.pattern??[]]},a=r.pattern.filter((e=>"custom"===e.type)).length+1;r.pattern.push({label:`${t("editor.card.trash.pattern.new_custom_label")} ${a}`,icon:"mdi:calendar",color:"pink",type:"custom"}),Hr(this,"config-changed",{config:r})}deletePatternItem(e){if(e.stopPropagation(),!this.config||!this.hass)return;const t={...this.config,pattern:[...this.config.pattern??[]]};t.pattern.splice(e.detail.index,1),Hr(this,"config-changed",{config:t})}render(){if(!this.hass||!this.config)return H;const e=Bt(this.hass),t=this.schema(e,this.config,this.hass.localize);return L`
      <ha-form
        .hass=${this.hass}
        .data=${this.config}
        .schema=${t}
        .computeLabel=${this.computeLabel}
        .computeHelper=${this.computeHelper}
        @value-changed=${this.valueChanged}
      ></ha-form>
      <ha-expansion-panel id="pattern-expansion-panel" outlined >
        <div slot="header" role="heading" aria-level="3" >
          <ha-icon icon="mdi:image-filter-center-focus">
          </ha-icon>
          ${e("editor.form.tabs.patterns")}
        </div>
        <div class="content">
          ${this.renderFormPatternsEditor()}
        </div>
      </ha-form-expandable>

    `}valueChanged(e){const t={...e.detail.value};"background"===t.color_mode&&delete t.color_mode,"default"===t.day_style&&delete t.day_style,"custom"!==t.day_style&&delete t.day_style_format,"card"===t.card_style&&delete t.card_style,Hr(this,"config-changed",{config:t})}static get styles(){return[l`
        #trashcard-pattern-editor header {
          display: flex;
          justify-content: space-between;
          align-items: center;
        }

        #trashcard-pattern-editor .back-title {
            display: flex;
            align-items: center;
            font-size: 18px;
        }

        #trashcard-pattern-editor ha-icon {
             display: flex;
             align-items: center;
             justify-content: center;
         }

        #pattern-expansion-panel {
          margin-top: 24px;
          display: flex !important;
          flex-direction: column;
        }

        #pattern-expansion-panel ha-form {
          display: block;
        }

        #pattern-expansion-panel .content {
          padding: 12px;
        }

        #pattern-expansion-panel {
          display: block;
          --expansion-panel-content-padding: 0;
          border-radius: 6px;
          --ha-card-border-radius: 6px;
        }
        #ha-expansion-panel ha-svg-icon,
        #ha-expansion-panel ha-icon {
          color: var(--secondary-text-color);
        }
      `]}};t([ue({attribute:!1})],Wr.prototype,"hass",void 0),t([he()],Wr.prototype,"config",void 0),t([he()],Wr.prototype,"subElementEditorConfig",void 0),t([he()],Wr.prototype,"schema",void 0),Wr=t([le(ge)],Wr);var Kr=Object.freeze({__proto__:null,get TrashCardEditor(){return Wr}});export{mr as TrashCard};
