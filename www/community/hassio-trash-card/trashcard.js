function e(e,t,r,n){var a,o=arguments.length,i=o<3?t:null===n?n=Object.getOwnPropertyDescriptor(t,r):n;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)i=Reflect.decorate(e,t,r,n);else for(var s=e.length-1;s>=0;s--)(a=e[s])&&(i=(o<3?a(i):o>3?a(t,r,i):a(t,r))||i);return o>3&&i&&Object.defineProperty(t,r,i),i}"function"==typeof SuppressedError&&SuppressedError;
/**
 * @license
 * Copyright 2019 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const t=window,r=t.ShadowRoot&&(void 0===t.ShadyCSS||t.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,n=Symbol(),a=new WeakMap;let o=class{constructor(e,t,r){if(this._$cssResult$=!0,r!==n)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=e,this.t=t}get styleSheet(){let e=this.o;const t=this.t;if(r&&void 0===e){const r=void 0!==t&&1===t.length;r&&(e=a.get(t)),void 0===e&&((this.o=e=new CSSStyleSheet).replaceSync(this.cssText),r&&a.set(t,e))}return e}toString(){return this.cssText}};const i=e=>new o("string"==typeof e?e:e+"",void 0,n),s=(e,...t)=>{const r=1===e.length?e[0]:t.reduce(((t,r,n)=>t+(e=>{if(!0===e._$cssResult$)return e.cssText;if("number"==typeof e)return e;throw Error("Value passed to 'css' function must be a 'css' function result: "+e+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(r)+e[n+1]),e[0]);return new o(r,e,n)},l=r?e=>e:e=>e instanceof CSSStyleSheet?(e=>{let t="";for(const r of e.cssRules)t+=r.cssText;return i(t)})(e):e
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */;var c;const u=window,h=u.trustedTypes,d=h?h.emptyScript:"",m=u.reactiveElementPolyfillSupport,g={toAttribute(e,t){switch(t){case Boolean:e=e?d:null;break;case Object:case Array:e=null==e?e:JSON.stringify(e)}return e},fromAttribute(e,t){let r=e;switch(t){case Boolean:r=null!==e;break;case Number:r=null===e?null:Number(e);break;case Object:case Array:try{r=JSON.parse(e)}catch(e){r=null}}return r}},p=(e,t)=>t!==e&&(t==t||e==e),f={attribute:!0,type:String,converter:g,reflect:!1,hasChanged:p},b="finalized";let v=class extends HTMLElement{constructor(){super(),this._$Ei=new Map,this.isUpdatePending=!1,this.hasUpdated=!1,this._$El=null,this._$Eu()}static addInitializer(e){var t;this.finalize(),(null!==(t=this.h)&&void 0!==t?t:this.h=[]).push(e)}static get observedAttributes(){this.finalize();const e=[];return this.elementProperties.forEach(((t,r)=>{const n=this._$Ep(r,t);void 0!==n&&(this._$Ev.set(n,r),e.push(n))})),e}static createProperty(e,t=f){if(t.state&&(t.attribute=!1),this.finalize(),this.elementProperties.set(e,t),!t.noAccessor&&!this.prototype.hasOwnProperty(e)){const r="symbol"==typeof e?Symbol():"__"+e,n=this.getPropertyDescriptor(e,r,t);void 0!==n&&Object.defineProperty(this.prototype,e,n)}}static getPropertyDescriptor(e,t,r){return{get(){return this[t]},set(n){const a=this[e];this[t]=n,this.requestUpdate(e,a,r)},configurable:!0,enumerable:!0}}static getPropertyOptions(e){return this.elementProperties.get(e)||f}static finalize(){if(this.hasOwnProperty(b))return!1;this[b]=!0;const e=Object.getPrototypeOf(this);if(e.finalize(),void 0!==e.h&&(this.h=[...e.h]),this.elementProperties=new Map(e.elementProperties),this._$Ev=new Map,this.hasOwnProperty("properties")){const e=this.properties,t=[...Object.getOwnPropertyNames(e),...Object.getOwnPropertySymbols(e)];for(const r of t)this.createProperty(r,e[r])}return this.elementStyles=this.finalizeStyles(this.styles),!0}static finalizeStyles(e){const t=[];if(Array.isArray(e)){const r=new Set(e.flat(1/0).reverse());for(const e of r)t.unshift(l(e))}else void 0!==e&&t.push(l(e));return t}static _$Ep(e,t){const r=t.attribute;return!1===r?void 0:"string"==typeof r?r:"string"==typeof e?e.toLowerCase():void 0}_$Eu(){var e;this._$E_=new Promise((e=>this.enableUpdating=e)),this._$AL=new Map,this._$Eg(),this.requestUpdate(),null===(e=this.constructor.h)||void 0===e||e.forEach((e=>e(this)))}addController(e){var t,r;(null!==(t=this._$ES)&&void 0!==t?t:this._$ES=[]).push(e),void 0!==this.renderRoot&&this.isConnected&&(null===(r=e.hostConnected)||void 0===r||r.call(e))}removeController(e){var t;null===(t=this._$ES)||void 0===t||t.splice(this._$ES.indexOf(e)>>>0,1)}_$Eg(){this.constructor.elementProperties.forEach(((e,t)=>{this.hasOwnProperty(t)&&(this._$Ei.set(t,this[t]),delete this[t])}))}createRenderRoot(){var e;const n=null!==(e=this.shadowRoot)&&void 0!==e?e:this.attachShadow(this.constructor.shadowRootOptions);return((e,n)=>{r?e.adoptedStyleSheets=n.map((e=>e instanceof CSSStyleSheet?e:e.styleSheet)):n.forEach((r=>{const n=document.createElement("style"),a=t.litNonce;void 0!==a&&n.setAttribute("nonce",a),n.textContent=r.cssText,e.appendChild(n)}))})(n,this.constructor.elementStyles),n}connectedCallback(){var e;void 0===this.renderRoot&&(this.renderRoot=this.createRenderRoot()),this.enableUpdating(!0),null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostConnected)||void 0===t?void 0:t.call(e)}))}enableUpdating(e){}disconnectedCallback(){var e;null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostDisconnected)||void 0===t?void 0:t.call(e)}))}attributeChangedCallback(e,t,r){this._$AK(e,r)}_$EO(e,t,r=f){var n;const a=this.constructor._$Ep(e,r);if(void 0!==a&&!0===r.reflect){const o=(void 0!==(null===(n=r.converter)||void 0===n?void 0:n.toAttribute)?r.converter:g).toAttribute(t,r.type);this._$El=e,null==o?this.removeAttribute(a):this.setAttribute(a,o),this._$El=null}}_$AK(e,t){var r;const n=this.constructor,a=n._$Ev.get(e);if(void 0!==a&&this._$El!==a){const e=n.getPropertyOptions(a),o="function"==typeof e.converter?{fromAttribute:e.converter}:void 0!==(null===(r=e.converter)||void 0===r?void 0:r.fromAttribute)?e.converter:g;this._$El=a,this[a]=o.fromAttribute(t,e.type),this._$El=null}}requestUpdate(e,t,r){let n=!0;void 0!==e&&(((r=r||this.constructor.getPropertyOptions(e)).hasChanged||p)(this[e],t)?(this._$AL.has(e)||this._$AL.set(e,t),!0===r.reflect&&this._$El!==e&&(void 0===this._$EC&&(this._$EC=new Map),this._$EC.set(e,r))):n=!1),!this.isUpdatePending&&n&&(this._$E_=this._$Ej())}async _$Ej(){this.isUpdatePending=!0;try{await this._$E_}catch(e){Promise.reject(e)}const e=this.scheduleUpdate();return null!=e&&await e,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){var e;if(!this.isUpdatePending)return;this.hasUpdated,this._$Ei&&(this._$Ei.forEach(((e,t)=>this[t]=e)),this._$Ei=void 0);let t=!1;const r=this._$AL;try{t=this.shouldUpdate(r),t?(this.willUpdate(r),null===(e=this._$ES)||void 0===e||e.forEach((e=>{var t;return null===(t=e.hostUpdate)||void 0===t?void 0:t.call(e)})),this.update(r)):this._$Ek()}catch(e){throw t=!1,this._$Ek(),e}t&&this._$AE(r)}willUpdate(e){}_$AE(e){var t;null===(t=this._$ES)||void 0===t||t.forEach((e=>{var t;return null===(t=e.hostUpdated)||void 0===t?void 0:t.call(e)})),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(e)),this.updated(e)}_$Ek(){this._$AL=new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$E_}shouldUpdate(e){return!0}update(e){void 0!==this._$EC&&(this._$EC.forEach(((e,t)=>this._$EO(t,this[t],e))),this._$EC=void 0),this._$Ek()}updated(e){}firstUpdated(e){}};
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var y;v[b]=!0,v.elementProperties=new Map,v.elementStyles=[],v.shadowRootOptions={mode:"open"},null==m||m({ReactiveElement:v}),(null!==(c=u.reactiveElementVersions)&&void 0!==c?c:u.reactiveElementVersions=[]).push("1.6.3");const _=window,w=_.trustedTypes,$=w?w.createPolicy("lit-html",{createHTML:e=>e}):void 0,k="$lit$",x=`lit$${(Math.random()+"").slice(9)}$`,A="?"+x,E=`<${A}>`,S=document,M=()=>S.createComment(""),z=e=>null===e||"object"!=typeof e&&"function"!=typeof e,D=Array.isArray,C="[ \t\n\f\r]",O=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,j=/-->/g,T=/>/g,P=RegExp(`>|${C}(?:([^\\s"'>=/]+)(${C}*=${C}*(?:[^ \t\n\f\r"'\`<>=]|("|')|))|$)`,"g"),N=/'/g,F=/"/g,I=/^(?:script|style|textarea|title)$/i,U=(e=>(t,...r)=>({_$litType$:e,strings:t,values:r}))(1),R=Symbol.for("lit-noChange"),H=Symbol.for("lit-nothing"),L=new WeakMap,B=S.createTreeWalker(S,129,null,!1);function q(e,t){if(!Array.isArray(e)||!e.hasOwnProperty("raw"))throw Error("invalid template strings array");return void 0!==$?$.createHTML(t):t}const V=(e,t)=>{const r=e.length-1,n=[];let a,o=2===t?"<svg>":"",i=O;for(let t=0;t<r;t++){const r=e[t];let s,l,c=-1,u=0;for(;u<r.length&&(i.lastIndex=u,l=i.exec(r),null!==l);)u=i.lastIndex,i===O?"!--"===l[1]?i=j:void 0!==l[1]?i=T:void 0!==l[2]?(I.test(l[2])&&(a=RegExp("</"+l[2],"g")),i=P):void 0!==l[3]&&(i=P):i===P?">"===l[0]?(i=null!=a?a:O,c=-1):void 0===l[1]?c=-2:(c=i.lastIndex-l[2].length,s=l[1],i=void 0===l[3]?P:'"'===l[3]?F:N):i===F||i===N?i=P:i===j||i===T?i=O:(i=P,a=void 0);const h=i===P&&e[t+1].startsWith("/>")?" ":"";o+=i===O?r+E:c>=0?(n.push(s),r.slice(0,c)+k+r.slice(c)+x+h):r+x+(-2===c?(n.push(void 0),t):h)}return[q(e,o+(e[r]||"<?>")+(2===t?"</svg>":"")),n]};class Z{constructor({strings:e,_$litType$:t},r){let n;this.parts=[];let a=0,o=0;const i=e.length-1,s=this.parts,[l,c]=V(e,t);if(this.el=Z.createElement(l,r),B.currentNode=this.el.content,2===t){const e=this.el.content,t=e.firstChild;t.remove(),e.append(...t.childNodes)}for(;null!==(n=B.nextNode())&&s.length<i;){if(1===n.nodeType){if(n.hasAttributes()){const e=[];for(const t of n.getAttributeNames())if(t.endsWith(k)||t.startsWith(x)){const r=c[o++];if(e.push(t),void 0!==r){const e=n.getAttribute(r.toLowerCase()+k).split(x),t=/([.?@])?(.*)/.exec(r);s.push({type:1,index:a,name:t[2],strings:e,ctor:"."===t[1]?K:"?"===t[1]?X:"@"===t[1]?ee:G})}else s.push({type:6,index:a})}for(const t of e)n.removeAttribute(t)}if(I.test(n.tagName)){const e=n.textContent.split(x),t=e.length-1;if(t>0){n.textContent=w?w.emptyScript:"";for(let r=0;r<t;r++)n.append(e[r],M()),B.nextNode(),s.push({type:2,index:++a});n.append(e[t],M())}}}else if(8===n.nodeType)if(n.data===A)s.push({type:2,index:a});else{let e=-1;for(;-1!==(e=n.data.indexOf(x,e+1));)s.push({type:7,index:a}),e+=x.length-1}a++}}static createElement(e,t){const r=S.createElement("template");return r.innerHTML=e,r}}function W(e,t,r=e,n){var a,o,i,s;if(t===R)return t;let l=void 0!==n?null===(a=r._$Co)||void 0===a?void 0:a[n]:r._$Cl;const c=z(t)?void 0:t._$litDirective$;return(null==l?void 0:l.constructor)!==c&&(null===(o=null==l?void 0:l._$AO)||void 0===o||o.call(l,!1),void 0===c?l=void 0:(l=new c(e),l._$AT(e,r,n)),void 0!==n?(null!==(i=(s=r)._$Co)&&void 0!==i?i:s._$Co=[])[n]=l:r._$Cl=l),void 0!==l&&(t=W(e,l._$AS(e,t.values),l,n)),t}class Y{constructor(e,t){this._$AV=[],this._$AN=void 0,this._$AD=e,this._$AM=t}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}u(e){var t;const{el:{content:r},parts:n}=this._$AD,a=(null!==(t=null==e?void 0:e.creationScope)&&void 0!==t?t:S).importNode(r,!0);B.currentNode=a;let o=B.nextNode(),i=0,s=0,l=n[0];for(;void 0!==l;){if(i===l.index){let t;2===l.type?t=new J(o,o.nextSibling,this,e):1===l.type?t=new l.ctor(o,l.name,l.strings,this,e):6===l.type&&(t=new te(o,this,e)),this._$AV.push(t),l=n[++s]}i!==(null==l?void 0:l.index)&&(o=B.nextNode(),i++)}return B.currentNode=S,a}v(e){let t=0;for(const r of this._$AV)void 0!==r&&(void 0!==r.strings?(r._$AI(e,r,t),t+=r.strings.length-2):r._$AI(e[t])),t++}}class J{constructor(e,t,r,n){var a;this.type=2,this._$AH=H,this._$AN=void 0,this._$AA=e,this._$AB=t,this._$AM=r,this.options=n,this._$Cp=null===(a=null==n?void 0:n.isConnected)||void 0===a||a}get _$AU(){var e,t;return null!==(t=null===(e=this._$AM)||void 0===e?void 0:e._$AU)&&void 0!==t?t:this._$Cp}get parentNode(){let e=this._$AA.parentNode;const t=this._$AM;return void 0!==t&&11===(null==e?void 0:e.nodeType)&&(e=t.parentNode),e}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(e,t=this){e=W(this,e,t),z(e)?e===H||null==e||""===e?(this._$AH!==H&&this._$AR(),this._$AH=H):e!==this._$AH&&e!==R&&this._(e):void 0!==e._$litType$?this.g(e):void 0!==e.nodeType?this.$(e):(e=>D(e)||"function"==typeof(null==e?void 0:e[Symbol.iterator]))(e)?this.T(e):this._(e)}k(e){return this._$AA.parentNode.insertBefore(e,this._$AB)}$(e){this._$AH!==e&&(this._$AR(),this._$AH=this.k(e))}_(e){this._$AH!==H&&z(this._$AH)?this._$AA.nextSibling.data=e:this.$(S.createTextNode(e)),this._$AH=e}g(e){var t;const{values:r,_$litType$:n}=e,a="number"==typeof n?this._$AC(e):(void 0===n.el&&(n.el=Z.createElement(q(n.h,n.h[0]),this.options)),n);if((null===(t=this._$AH)||void 0===t?void 0:t._$AD)===a)this._$AH.v(r);else{const e=new Y(a,this),t=e.u(this.options);e.v(r),this.$(t),this._$AH=e}}_$AC(e){let t=L.get(e.strings);return void 0===t&&L.set(e.strings,t=new Z(e)),t}T(e){D(this._$AH)||(this._$AH=[],this._$AR());const t=this._$AH;let r,n=0;for(const a of e)n===t.length?t.push(r=new J(this.k(M()),this.k(M()),this,this.options)):r=t[n],r._$AI(a),n++;n<t.length&&(this._$AR(r&&r._$AB.nextSibling,n),t.length=n)}_$AR(e=this._$AA.nextSibling,t){var r;for(null===(r=this._$AP)||void 0===r||r.call(this,!1,!0,t);e&&e!==this._$AB;){const t=e.nextSibling;e.remove(),e=t}}setConnected(e){var t;void 0===this._$AM&&(this._$Cp=e,null===(t=this._$AP)||void 0===t||t.call(this,e))}}class G{constructor(e,t,r,n,a){this.type=1,this._$AH=H,this._$AN=void 0,this.element=e,this.name=t,this._$AM=n,this.options=a,r.length>2||""!==r[0]||""!==r[1]?(this._$AH=Array(r.length-1).fill(new String),this.strings=r):this._$AH=H}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(e,t=this,r,n){const a=this.strings;let o=!1;if(void 0===a)e=W(this,e,t,0),o=!z(e)||e!==this._$AH&&e!==R,o&&(this._$AH=e);else{const n=e;let i,s;for(e=a[0],i=0;i<a.length-1;i++)s=W(this,n[r+i],t,i),s===R&&(s=this._$AH[i]),o||(o=!z(s)||s!==this._$AH[i]),s===H?e=H:e!==H&&(e+=(null!=s?s:"")+a[i+1]),this._$AH[i]=s}o&&!n&&this.j(e)}j(e){e===H?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=e?e:"")}}class K extends G{constructor(){super(...arguments),this.type=3}j(e){this.element[this.name]=e===H?void 0:e}}const Q=w?w.emptyScript:"";class X extends G{constructor(){super(...arguments),this.type=4}j(e){e&&e!==H?this.element.setAttribute(this.name,Q):this.element.removeAttribute(this.name)}}class ee extends G{constructor(e,t,r,n,a){super(e,t,r,n,a),this.type=5}_$AI(e,t=this){var r;if((e=null!==(r=W(this,e,t,0))&&void 0!==r?r:H)===R)return;const n=this._$AH,a=e===H&&n!==H||e.capture!==n.capture||e.once!==n.once||e.passive!==n.passive,o=e!==H&&(n===H||a);a&&this.element.removeEventListener(this.name,this,n),o&&this.element.addEventListener(this.name,this,e),this._$AH=e}handleEvent(e){var t,r;"function"==typeof this._$AH?this._$AH.call(null!==(r=null===(t=this.options)||void 0===t?void 0:t.host)&&void 0!==r?r:this.element,e):this._$AH.handleEvent(e)}}class te{constructor(e,t,r){this.element=e,this.type=6,this._$AN=void 0,this._$AM=t,this.options=r}get _$AU(){return this._$AM._$AU}_$AI(e){W(this,e)}}const re=_.litHtmlPolyfillSupport;null==re||re(Z,J),(null!==(y=_.litHtmlVersions)&&void 0!==y?y:_.litHtmlVersions=[]).push("2.8.0");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var ne,ae;class oe extends v{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){var e,t;const r=super.createRenderRoot();return null!==(e=(t=this.renderOptions).renderBefore)&&void 0!==e||(t.renderBefore=r.firstChild),r}update(e){const t=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this._$Do=((e,t,r)=>{var n,a;const o=null!==(n=null==r?void 0:r.renderBefore)&&void 0!==n?n:t;let i=o._$litPart$;if(void 0===i){const e=null!==(a=null==r?void 0:r.renderBefore)&&void 0!==a?a:null;o._$litPart$=i=new J(t.insertBefore(M(),e),e,void 0,null!=r?r:{})}return i._$AI(e),i})(t,this.renderRoot,this.renderOptions)}connectedCallback(){var e;super.connectedCallback(),null===(e=this._$Do)||void 0===e||e.setConnected(!0)}disconnectedCallback(){var e;super.disconnectedCallback(),null===(e=this._$Do)||void 0===e||e.setConnected(!1)}render(){return R}}oe.finalized=!0,oe._$litElement$=!0,null===(ne=globalThis.litElementHydrateSupport)||void 0===ne||ne.call(globalThis,{LitElement:oe});const ie=globalThis.litElementPolyfillSupport;null==ie||ie({LitElement:oe}),(null!==(ae=globalThis.litElementVersions)&&void 0!==ae?ae:globalThis.litElementVersions=[]).push("3.3.3");const se={pulse:"@keyframes pulse {\n        0% {\n            opacity: 1;\n        }\n        50% {\n            opacity: 0;\n        }\n        100% {\n            opacity: 1;\n        }\n    }",spin:"@keyframes spin {\n        from {\n            transform: rotate(0deg);\n        }\n        to {\n            transform: rotate(360deg);\n        }\n    }",cleaning:"@keyframes cleaning {\n        0% {\n            transform: rotate(0) translate(0);\n        }\n        5% {\n            transform: rotate(0) translate(0, -3px);\n        }\n        10% {\n            transform: rotate(0) translate(0, 1px);\n        }\n        15% {\n            transform: rotate(0) translate(0);\n        }\n\n        20% {\n            transform: rotate(30deg) translate(0);\n        }\n        25% {\n            transform: rotate(30deg) translate(0, -3px);\n        }\n        30% {\n            transform: rotate(30deg) translate(0, 1px);\n        }\n        35% {\n            transform: rotate(30deg) translate(0);\n        }\n        40% {\n            transform: rotate(0) translate(0);\n        }\n\n        45% {\n            transform: rotate(-30deg) translate(0);\n        }\n        50% {\n            transform: rotate(-30deg) translate(0, -3px);\n        }\n        55% {\n            transform: rotate(-30deg) translate(0, 1px);\n        }\n        60% {\n            transform: rotate(-30deg) translate(0);\n        }\n        70% {\n            transform: rotate(0deg) translate(0);\n        }\n        100% {\n            transform: rotate(0deg);\n        }\n    }",returning:"@keyframes returning {\n        0% {\n            transform: rotate(0);\n        }\n        25% {\n            transform: rotate(20deg);\n        }\n        50% {\n            transform: rotate(0);\n        }\n        75% {\n            transform: rotate(-20deg);\n        }\n        100% {\n            transform: rotate(0);\n        }\n    }"};s`
        ${i(se.pulse)}
    `,s`
        ${i(se.spin)}
    `,s`
        ${i(se.cleaning)}
    `,s`
        ${i(se.returning)}
    `;const le=s`
    ${i(Object.values(se).join("\n"))}
`,ce=s`
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
`
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,ue=1,he=e=>(...t)=>({_$litDirective$:e,values:t});let de=class{constructor(e){}get _$AU(){return this._$AM._$AU}_$AT(e,t,r){this._$Ct=e,this._$AM=t,this._$Ci=r}_$AS(e,t){return this.update(e,t)}update(e,t){return this.render(...t)}};
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */const me=he(class extends de{constructor(e){var t;if(super(e),e.type!==ue||"class"!==e.name||(null===(t=e.strings)||void 0===t?void 0:t.length)>2)throw Error("`classMap()` can only be used in the `class` attribute and must be the only part in the attribute.")}render(e){return" "+Object.keys(e).filter((t=>e[t])).join(" ")+" "}update(e,[t]){var r,n;if(void 0===this.it){this.it=new Set,void 0!==e.strings&&(this.nt=new Set(e.strings.join(" ").split(/\s/).filter((e=>""!==e))));for(const e in t)t[e]&&!(null===(r=this.nt)||void 0===r?void 0:r.has(e))&&this.it.add(e);return this.render(t)}const a=e.element.classList;this.it.forEach((e=>{e in t||(a.remove(e),this.it.delete(e))}));for(const e in t){const r=!!t[e];r===this.it.has(e)||(null===(n=this.nt)||void 0===n?void 0:n.has(e))||(r?(a.add(e),this.it.add(e)):(a.remove(e),this.it.delete(e)))}return R}});function ge(e){return e.vertical?"vertical":"default"}function pe(e){return e.hide_icon?"none":e.use_entity_picture||e.use_media_artwork?"entity-picture":"icon"}function fe(e){return e.hide_name?"none":"name"}function be(e){return e.hide_state?"none":"state"}var ve,ye,_e,we,$e,ke=Number.isNaN||function(e){return"number"==typeof e&&e!=e};function xe(e,t){if(e.length!==t.length)return!1;for(var r=0;r<e.length;r++)if(n=e[r],a=t[r],!(n===a||ke(n)&&ke(a)))return!1;var n,a;return!0}function Ae(e,t){void 0===t&&(t=xe);var r=null;function n(){for(var n=[],a=0;a<arguments.length;a++)n[a]=arguments[a];if(r&&r.lastThis===this&&t(n,r.lastArgs))return r.lastResult;var o=e.apply(this,n);return r={lastResult:o,lastArgs:n,lastThis:this},o}return n.clear=function(){r=null},n}!function(e){e.language="language",e.system="system",e.comma_decimal="comma_decimal",e.decimal_comma="decimal_comma",e.space_comma="space_comma",e.none="none"}(ve||(ve={})),function(e){e.language="language",e.system="system",e.am_pm="12",e.twenty_four="24"}(ye||(ye={})),function(e){e.local="local",e.server="server"}(_e||(_e={})),function(e){e.language="language",e.system="system",e.DMY="DMY",e.MDY="MDY",e.YMD="YMD"}(we||(we={})),function(e){e.language="language",e.monday="monday",e.tuesday="tuesday",e.wednesday="wednesday",e.thursday="thursday",e.friday="friday",e.saturday="saturday",e.sunday="sunday"}($e||($e={})),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"long",month:"long",day:"numeric",timeZone:"server"===e.time_zone?t:void 0})));const Ee=Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{year:"numeric",month:"long",day:"numeric",timeZone:"server"===e.time_zone?t:void 0})));Ae(((e,t)=>{const r=e.date_format===we.system?void 0:e.language;return e.date_format===we.language||(e.date_format,we.system),new Intl.DateTimeFormat(r,{year:"numeric",month:"numeric",day:"numeric",timeZone:"server"===e.time_zone?t:void 0})})),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{day:"numeric",month:"short",timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{month:"long",year:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{month:"long",timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{year:"numeric",timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"long",timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat(e.language,{weekday:"short",timeZone:"server"===e.time_zone?t:void 0})));const Se=Ae((e=>{if(e.time_format===ye.language||e.time_format===ye.system){const t=e.time_format===ye.language?e.language:void 0,r=(new Date).toLocaleString(t);return r.includes("AM")||r.includes("PM")}return e.time_format===ye.am_pm})),Me=Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{hour:"numeric",minute:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0})));Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{hour:Se(e)?"numeric":"2-digit",minute:"2-digit",second:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{weekday:"long",hour:Se(e)?"numeric":"2-digit",minute:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat("en-GB",{hour:"numeric",minute:"2-digit",hour12:!1,timeZone:"server"===e.time_zone?t:void 0})));const ze=(e,t,r)=>De(t,r.time_zone).format(e),De=Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"long",day:"numeric",hour:Se(e)?"numeric":"2-digit",minute:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0})));Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"short",day:"numeric",hour:Se(e)?"numeric":"2-digit",minute:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{month:"short",day:"numeric",hour:Se(e)?"numeric":"2-digit",minute:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0}))),Ae(((e,t)=>new Intl.DateTimeFormat("en"!==e.language||Se(e)?e.language:"en-u-hc-h23",{year:"numeric",month:"long",day:"numeric",hour:Se(e)?"numeric":"2-digit",minute:"2-digit",second:"2-digit",hour12:Se(e),timeZone:"server"===e.time_zone?t:void 0})));const Ce="unavailable",Oe="unknown";const je=(e,t)=>0!=(e.supported_features&t);Ae((e=>new Intl.Collator(e))),Ae((e=>new Intl.Collator(e,{sensitivity:"accent"})));const Te=e=>(e=>je(e,4)&&"number"==typeof e.in_progress)(e)||!!e.in_progress,Pe=(e,t=2)=>{let r=""+e;for(let e=1;e<t;e++)r=parseInt(r)<10**e?`0${r}`:r;return r};const Ne={ms:1,s:1e3,min:6e4,h:36e5,d:864e5},Fe=(e,t)=>function(e){const t=Math.floor(e/1e3/3600),r=Math.floor(e/1e3%3600/60),n=Math.floor(e/1e3%3600%60),a=Math.floor(e%1e3);return t>0?`${t}:${Pe(r)}:${Pe(n)}`:r>0?`${r}:${Pe(n)}`:n>0||a>0?`${n}${a>0?`.${Pe(a,3)}`:""}`:null}(parseFloat(e)*Ne[t])||"0",Ie=(e,t,r)=>{const n=t?(e=>{switch(e.number_format){case ve.comma_decimal:return["en-US","en"];case ve.decimal_comma:return["de","es","it"];case ve.space_comma:return["fr","sv","cs"];case ve.system:return;default:return e.language}})(t):void 0;if(Number.isNaN=Number.isNaN||function e(t){return"number"==typeof t&&e(t)},t?.number_format!==ve.none&&!Number.isNaN(Number(e))&&Intl)try{return new Intl.NumberFormat(n,Re(e,r)).format(Number(e))}catch(t){return console.error(t),new Intl.NumberFormat(void 0,Re(e,r)).format(Number(e))}return"string"==typeof e?e:`${((e,t=2)=>Math.round(e*10**t)/10**t)(e,r?.maximumFractionDigits).toString()}${"currency"===r?.style?` ${r.currency}`:""}`},Ue=(e,t)=>{const r=t?.display_precision;return null!=r?{maximumFractionDigits:r,minimumFractionDigits:r}:Number.isInteger(Number(e.attributes?.step))&&Number.isInteger(Number(e.state))?{maximumFractionDigits:0}:null!=e.attributes.step?{maximumFractionDigits:Math.ceil(Math.log10(1/e.attributes.step))}:void 0},Re=(e,t)=>{const r={maximumFractionDigits:2,...t};if("string"!=typeof e)return r;if(!t||void 0===t.minimumFractionDigits&&void 0===t.maximumFractionDigits){const t=e.indexOf(".")>-1?e.split(".")[1].length:0;r.minimumFractionDigits=t,r.maximumFractionDigits=t}return r},He=(e,t,r,n,a,o,i)=>{if(i===Oe||i===Ce)return e(`state.default.${i}`);if((e=>!!e.unit_of_measurement||!!e.state_class)(o)){if("duration"===o.device_class&&o.unit_of_measurement&&Ne[o.unit_of_measurement])try{return Fe(i,o.unit_of_measurement)}catch(e){}if("monetary"===o.device_class)try{return Ie(i,t,{style:"currency",currency:o.unit_of_measurement,minimumFractionDigits:2,...Ue({state:i,attributes:o},n)})}catch(e){}const e=o.unit_of_measurement?"%"===o.unit_of_measurement?(e=>{switch(e.language){case"cz":case"de":case"fi":case"fr":case"sk":case"sv":return" ";default:return""}})(t)+"%":` ${o.unit_of_measurement}`:"";return`${Ie(i,t,Ue({state:i,attributes:o},n))}${e}`}const s=(e=>e.substr(0,e.indexOf(".")))(a);if("datetime"===s){const e=new Date(i);return ze(e,t,r)}if(["date","input_datetime","time"].includes(s))try{const e=i.split(" ");if(2===e.length)return ze(new Date(e.join("T")),{...t,time_zone:_e.local},r);if(1===e.length){if(i.includes("-"))return((e,t,r)=>Ee(t,r.time_zone).format(e))(new Date(`${i}T00:00`),{...t,time_zone:_e.local},r);if(i.includes(":")){const e=new Date;return((e,t,r)=>Me(t,r.time_zone).format(e))(new Date(`${e.toISOString().split("T")[0]}T${i}`),{...t,time_zone:_e.local},r)}}return i}catch(e){return i}if("counter"===s||"number"===s||"input_number"===s)return Ie(i,t,Ue({state:i,attributes:o},n));if(["button","event","input_button","scene","stt","tts"].includes(s)||"sensor"===s&&"timestamp"===o.device_class)try{return ze(new Date(i),t,r)}catch(e){return i}return"update"===s?"on"===i?Te(o)?je(o,4)&&"number"==typeof o.in_progress?e("ui.card.update.installing_with_progress",{progress:o.in_progress}):e("ui.card.update.installing"):o.latest_version:o.skipped_version===o.latest_version?o.latest_version??e("state.default.unavailable"):e("ui.card.update.up_to_date"):n?.translation_key&&e(`component.${n.platform}.entity.${s}.${n.translation_key}.state.${i}`)||o.device_class&&e(`component.${s}.entity_component.${o.device_class}.state.${i}`)||e(`component.${s}.entity_component._.state.${i}`)||i};let Le=class extends TypeError{constructor(e,t){let r;const{message:n,...a}=e,{path:o}=e;super(0===o.length?n:"At path: "+o.join(".")+" -- "+n),this.value=void 0,this.key=void 0,this.type=void 0,this.refinement=void 0,this.path=void 0,this.branch=void 0,this.failures=void 0,Object.assign(this,a),this.name=this.constructor.name,this.failures=()=>{var n;return null!=(n=r)?n:r=[e,...t()]}}};function Be(e){return"object"==typeof e&&null!=e}function qe(e){return"string"==typeof e?JSON.stringify(e):""+e}function Ve(e,t,r,n){if(!0===e)return;!1===e?e={}:"string"==typeof e&&(e={message:e});const{path:a,branch:o}=t,{type:i}=r,{refinement:s,message:l="Expected a value of type `"+i+"`"+(s?" with refinement `"+s+"`":"")+", but received: `"+qe(n)+"`"}=e;return{value:n,type:i,refinement:s,key:a[a.length-1],path:a,branch:o,...e,message:l}}function*Ze(e,t,r,n){(function(e){return Be(e)&&"function"==typeof e[Symbol.iterator]})(e)||(e=[e]);for(const a of e){const e=Ve(a,t,r,n);e&&(yield e)}}function*We(e,t,r){void 0===r&&(r={});const{path:n=[],branch:a=[e],coerce:o=!1,mask:i=!1}=r,s={path:n,branch:a};if(o&&(e=t.coercer(e,s),i&&"type"!==t.type&&Be(t.schema)&&Be(e)&&!Array.isArray(e)))for(const r in e)void 0===t.schema[r]&&delete e[r];let l=!0;for(const r of t.validator(e,s))l=!1,yield[r,void 0];for(let[r,c,u]of t.entries(e,s)){const t=We(c,u,{path:void 0===r?n:[...n,r],branch:void 0===r?a:[...a,c],coerce:o,mask:i});for(const n of t)n[0]?(l=!1,yield[n[0],void 0]):o&&(c=n[1],void 0===r?e=c:e instanceof Map?e.set(r,c):e instanceof Set?e.add(c):Be(e)&&(e[r]=c))}if(l)for(const r of t.refiner(e,s))l=!1,yield[r,void 0];l&&(yield[void 0,e])}let Ye=class{constructor(e){this.TYPE=void 0,this.type=void 0,this.schema=void 0,this.coercer=void 0,this.validator=void 0,this.refiner=void 0,this.entries=void 0;const{type:t,schema:r,validator:n,refiner:a,coercer:o=(e=>e),entries:i=function*(){}}=e;this.type=t,this.schema=r,this.entries=i,this.coercer=o,this.validator=n?(e,t)=>Ze(n(e,t),t,this,e):()=>[],this.refiner=a?(e,t)=>Ze(a(e,t),t,this,e):()=>[]}assert(e){return function(e,t){const r=Je(e,t);if(r[0])throw r[0]}(e,this)}create(e){return function(e,t){const r=Je(e,t,{coerce:!0});if(r[0])throw r[0];return r[1]}(e,this)}is(e){return function(e,t){const r=Je(e,t);return!r[0]}(e,this)}mask(e){return function(e,t){const r=Je(e,t,{coerce:!0,mask:!0});if(r[0])throw r[0];return r[1]}(e,this)}validate(e,t){return void 0===t&&(t={}),Je(e,this,t)}};function Je(e,t,r){void 0===r&&(r={});const n=We(e,t,r),a=function(e){const{done:t,value:r}=e.next();return t?void 0:r}(n);if(a[0]){const e=new Le(a[0],(function*(){for(const e of n)e[0]&&(yield e[0])}));return[e,void 0]}return[void 0,a[1]]}function Ge(e,t){return new Ye({type:e,schema:null,validator:t})}function Ke(e){return new Ye({type:"array",schema:e,*entries(t){if(e&&Array.isArray(t))for(const[r,n]of t.entries())yield[r,n,e]},coercer:e=>Array.isArray(e)?e.slice():e,validator:e=>Array.isArray(e)||"Expected an array value, but received: "+qe(e)})}function Qe(){return Ge("boolean",(e=>"boolean"==typeof e))}function Xe(e){const t=qe(e),r=typeof e;return new Ye({type:"literal",schema:"string"===r||"number"===r||"boolean"===r?e:null,validator:r=>r===e||"Expected the literal `"+t+"`, but received: "+qe(r)})}function et(){return Ge("number",(e=>"number"==typeof e&&!isNaN(e)||"Expected a number, but received: "+qe(e)))}function tt(e){const t=e?Object.keys(e):[],r=Ge("never",(()=>!1));return new Ye({type:"object",schema:e||null,*entries(n){if(e&&Be(n)){const a=new Set(Object.keys(n));for(const r of t)a.delete(r),yield[r,n[r],e[r]];for(const e of a)yield[e,n[e],r]}},validator:e=>Be(e)||"Expected an object, but received: "+qe(e),coercer:e=>Be(e)?{...e}:e})}function rt(e){return new Ye({...e,validator:(t,r)=>void 0===t||e.validator(t,r),refiner:(t,r)=>void 0===t||e.refiner(t,r)})}function nt(){return Ge("string",(e=>"string"==typeof e||"Expected a string, but received: "+qe(e)))}function at(e){const t=Object.keys(e);return new Ye({type:"type",schema:e,*entries(r){if(Be(r))for(const n of t)yield[n,r[n],e[n]]},validator:e=>Be(e)||"Expected an object, but received: "+qe(e)})}function ot(e){const t=e.map((e=>e.type)).join(" | ");return new Ye({type:"union",schema:null,coercer(t,r){const n=e.find((e=>{const[r]=e.validate(t,{coerce:!0});return!r}))||Ge("unknown",(()=>!0));return n.coercer(t,r)},validator(r,n){const a=[];for(const t of e){const[...e]=We(r,t,n),[o]=e;if(!o[0])return[];for(const[t]of e)t&&a.push(t)}return["Expected the value to satisfy a union of `"+t+"`, but received: "+qe(r),...a]}})}const it=(e,t)=>{const r=(()=>{const e=document.body;if(e.querySelector("action-handler"))return e.querySelector("action-handler");const t=document.createElement("action-handler");return e.appendChild(t),t})();r&&r.bind(e,t)},st=he(class extends de{update(e,[t]){return it(e.element,t),R}render(e){}});function lt(e){return void 0!==e&&"none"!==e.action}const ct=tt({user:nt()}),ut=ot([Qe(),tt({text:rt(nt()),excemptions:rt(Ke(ct))})]),ht=tt({action:Xe("url"),url_path:nt(),confirmation:rt(ut)}),dt=tt({action:Xe("call-service"),service:nt(),service_data:rt(tt()),data:rt(tt()),target:rt(tt({entity_id:rt(ot([nt(),Ke(nt())])),device_id:rt(ot([nt(),Ke(nt())])),area_id:rt(ot([nt(),Ke(nt())]))})),confirmation:rt(ut)}),mt=tt({action:Xe("navigate"),navigation_path:nt(),confirmation:rt(ut)}),gt=at({action:Xe("assist"),pipeline_id:rt(nt()),start_listening:rt(Qe())}),pt=at({action:Xe("fire-dom-event")}),ft=tt({action:function(e){const t={},r=e.map((e=>qe(e))).join();for(const r of e)t[r]=r;return new Ye({type:"enums",schema:t,validator:t=>e.includes(t)||"Expected one of `"+r+"`, but received: "+qe(t)})}(["none","toggle","more-info","call-service","url","navigate","assist"]),confirmation:rt(ut)});var bt;bt=e=>{if(e&&"object"==typeof e&&"action"in e)switch(e.action){case"call-service":return dt;case"fire-dom-event":return pt;case"navigate":return mt;case"url":return ht;case"assist":return gt}return ft},new Ye({type:"dynamic",schema:null,*entries(e,t){const r=bt(e,t);yield*r.entries(e,t)},validator:(e,t)=>bt(e,t).validator(e,t),coercer:(e,t)=>bt(e,t).coercer(e,t),refiner:(e,t)=>bt(e,t).refiner(e,t)}),s`
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
`;const vt=["button","input_button","scene"];function yt(e,t,r,n,a){switch(e){case"name":return t;case"state":const e=n.entity_id.split(".")[0];return"timestamp"!==n.attributes.device_class&&!vt.includes(e)||!function(e){return e.state!==Ce}(n)||function(e){return e.state===Oe}(n)?r:U`
                    <ha-relative-time
                        .hass=${a}
                        .datetime=${n.state}
                        capitalize
                    ></ha-relative-time>
                `;case"last-changed":return U`
                <ha-relative-time
                    .hass=${a}
                    .datetime=${n.last_changed}
                    capitalize
                ></ha-relative-time>
            `;case"last-updated":return U`
                <ha-relative-time
                    .hass=${a}
                    .datetime=${n.last_updated}
                    capitalize
                ></ha-relative-time>
            `;case"none":return}}const _t=()=>{customElements.get("ha-form")||customElements.get("hui-button-card")?.getConfigElement(),customElements.get("ha-entity-picker")||customElements.get("hui-entities-card")?.getConfigElement()};var wt="https://github.com/piitaya/lovelace-mushroom";var $t={form:{color_picker:{values:{default:"Standard-Farbe"}},layout_picker:{values:{default:"Standard-Layout",vertical:"Vertikales Layout",horizontal:"Horizontales Layout"}}},card:{generic:{icon_color:"Icon-Farbe",layout:"Layout",fill_container:"Container ausfüllen"},trash:{organic:{label:"Bio Bezeichnung",color:"Bio Farbe",icon:"Bio Symbol",pattern:"Bio erkennen an pattern"},paper:{label:"Papier Bezeichnung",color:"Papier Farbe",icon:"Papier Symbol",pattern:"Papier erkennen an pattern"},recycle:{label:"Verpackung Bezeichnung",color:"Verpackung Farbe",icon:"Verpackung Symbol",pattern:"Verpackung erkennen an pattern"},waste:{label:"Restmüll Bezeichnung",color:"Restmüll Farbe",icon:"Restmüll Symbol",pattern:"Restmüll erkennen an pattern"},others:{color:"Andere Farbe",icon:"Andere Symbol"}}}},kt={not_found:"Entität nicht gefunden",trash:{today:"Heute",tomorrow:"Morgen"}},xt={editor:$t,card:kt},At=Object.freeze({__proto__:null,card:kt,default:xt,editor:$t}),Et={form:{color_picker:{values:{default:"Default color"}},layout_picker:{values:{default:"Default layout",vertical:"Vertical layout",horizontal:"Horizontal layout"}}},card:{generic:{icon_color:"Icon color",layout:"Layout",fill_container:"Fill container"},trash:{organic:{label:"Organic label",color:"Organic color",icon:"Organic icon",pattern:"Organic detection pattern"},paper:{label:"Paper label",color:"Paper color",icon:"Paper icon",pattern:"Paper detection pattern"},recycle:{label:"Recycle label",color:"Recycle color",icon:"Recycle icon",pattern:"Recycle detection pattern"},waste:{label:"Waste label",color:"Waste color",icon:"Waste icon",pattern:"Waste detection pattern"},others:{color:"Others color",icon:"Others icon"}}}},St={not_found:"Entity not found",trash:{today:"today",tomorrow:"tomorrow"}},Mt={editor:Et,card:St},zt=Object.freeze({__proto__:null,card:St,default:Mt,editor:Et}),Dt={form:{color_picker:{values:{default:"Predvolená farba"}},layout_picker:{values:{default:"Predvolené rozloženie",vertical:"Vertikálne rozloženie",horizontal:"Horizontálne rozloženie"}}},card:{generic:{icon_color:"Farba ikony",layout:"Rozloženie",fill_container:"Naplňte nádobu"},trash:{organic:{label:"Organický štítok",color:"Organická farba",icon:"Organická ikona",pattern:"Vzorec organickej detekcie"},paper:{label:"Papierový štítok",color:"Farba papiera",icon:"Ikona papiera",pattern:"Vzor detekcie papiera"},recycle:{label:"Recyklačný štítok",color:"Recyklovaný farba",icon:"Recycklované ikona",pattern:"Vzor detekcie recyklácie"},waste:{label:"Štítok odpadu",color:"Farba odpadu",icon:"Opdad ikona",pattern:"Vzor detekcie odpadu"},others:{color:"Iné farby",icon:"Iné ikony"}}}},Ct={not_found:"Entita sa nenašla",trash:{today:"dnes",tomorrow:"zajtra"}},Ot={editor:Dt,card:Ct};const jt={de:At,sk:Object.freeze({__proto__:null,card:Ct,default:Ot,editor:Dt}),en:zt},Tt=(e,t)=>{try{return e.split(".").reduce(((e,t)=>e[t]),jt[t])}catch{return}};function Pt(e){return function(t){const r=e?.locale.language??"en";let n=Tt(t,r);return n||(n=Tt(t,"en")),n??t}}
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */const Nt="important",Ft=" !"+Nt,It=he(class extends de{constructor(e){var t;if(super(e),e.type!==ue||"style"!==e.name||(null===(t=e.strings)||void 0===t?void 0:t.length)>2)throw Error("The `styleMap` directive must be used in the `style` attribute and must be the only part in the attribute.")}render(e){return Object.keys(e).reduce(((t,r)=>{const n=e[r];return null==n?t:t+`${r=r.includes("-")?r:r.replace(/(?:^(webkit|moz|ms|o)|)(?=[A-Z])/g,"-$&").toLowerCase()}:${n};`}),"")}update(e,[t]){const{style:r}=e.element;if(void 0===this.ht){this.ht=new Set;for(const e in t)this.ht.add(e);return this.render(t)}this.ht.forEach((e=>{null==t[e]&&(this.ht.delete(e),e.includes("-")?r.removeProperty(e):r[e]="")}));for(const e in t){const n=t[e];if(null!=n){this.ht.add(e);const t="string"==typeof n&&n.endsWith(Ft);e.includes("-")||t?r.setProperty(e,t?n.slice(0,-11):n,t?Nt:""):r[e]=n}}return R}});var Ut={exports:{}},Rt={exports:{}},Ht=function(e){return!(!e||"string"==typeof e)&&(e instanceof Array||Array.isArray(e)||e.length>=0&&(e.splice instanceof Function||Object.getOwnPropertyDescriptor(e,e.length-1)&&"String"!==e.constructor.name))},Lt=Array.prototype.concat,Bt=Array.prototype.slice,qt=Rt.exports=function(e){for(var t=[],r=0,n=e.length;r<n;r++){var a=e[r];Ht(a)?t=Lt.call(t,Bt.call(a)):t.push(a)}return t};qt.wrap=function(e){return function(){return e(qt(arguments))}};var Vt=Rt.exports,Zt={aliceblue:[240,248,255],antiquewhite:[250,235,215],aqua:[0,255,255],aquamarine:[127,255,212],azure:[240,255,255],beige:[245,245,220],bisque:[255,228,196],black:[0,0,0],blanchedalmond:[255,235,205],blue:[0,0,255],blueviolet:[138,43,226],brown:[165,42,42],burlywood:[222,184,135],cadetblue:[95,158,160],chartreuse:[127,255,0],chocolate:[210,105,30],coral:[255,127,80],cornflowerblue:[100,149,237],cornsilk:[255,248,220],crimson:[220,20,60],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgoldenrod:[184,134,11],darkgray:[169,169,169],darkgreen:[0,100,0],darkgrey:[169,169,169],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkseagreen:[143,188,143],darkslateblue:[72,61,139],darkslategray:[47,79,79],darkslategrey:[47,79,79],darkturquoise:[0,206,209],darkviolet:[148,0,211],deeppink:[255,20,147],deepskyblue:[0,191,255],dimgray:[105,105,105],dimgrey:[105,105,105],dodgerblue:[30,144,255],firebrick:[178,34,34],floralwhite:[255,250,240],forestgreen:[34,139,34],fuchsia:[255,0,255],gainsboro:[220,220,220],ghostwhite:[248,248,255],gold:[255,215,0],goldenrod:[218,165,32],gray:[128,128,128],green:[0,128,0],greenyellow:[173,255,47],grey:[128,128,128],honeydew:[240,255,240],hotpink:[255,105,180],indianred:[205,92,92],indigo:[75,0,130],ivory:[255,255,240],khaki:[240,230,140],lavender:[230,230,250],lavenderblush:[255,240,245],lawngreen:[124,252,0],lemonchiffon:[255,250,205],lightblue:[173,216,230],lightcoral:[240,128,128],lightcyan:[224,255,255],lightgoldenrodyellow:[250,250,210],lightgray:[211,211,211],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightsalmon:[255,160,122],lightseagreen:[32,178,170],lightskyblue:[135,206,250],lightslategray:[119,136,153],lightslategrey:[119,136,153],lightsteelblue:[176,196,222],lightyellow:[255,255,224],lime:[0,255,0],limegreen:[50,205,50],linen:[250,240,230],magenta:[255,0,255],maroon:[128,0,0],mediumaquamarine:[102,205,170],mediumblue:[0,0,205],mediumorchid:[186,85,211],mediumpurple:[147,112,219],mediumseagreen:[60,179,113],mediumslateblue:[123,104,238],mediumspringgreen:[0,250,154],mediumturquoise:[72,209,204],mediumvioletred:[199,21,133],midnightblue:[25,25,112],mintcream:[245,255,250],mistyrose:[255,228,225],moccasin:[255,228,181],navajowhite:[255,222,173],navy:[0,0,128],oldlace:[253,245,230],olive:[128,128,0],olivedrab:[107,142,35],orange:[255,165,0],orangered:[255,69,0],orchid:[218,112,214],palegoldenrod:[238,232,170],palegreen:[152,251,152],paleturquoise:[175,238,238],palevioletred:[219,112,147],papayawhip:[255,239,213],peachpuff:[255,218,185],peru:[205,133,63],pink:[255,192,203],plum:[221,160,221],powderblue:[176,224,230],purple:[128,0,128],rebeccapurple:[102,51,153],red:[255,0,0],rosybrown:[188,143,143],royalblue:[65,105,225],saddlebrown:[139,69,19],salmon:[250,128,114],sandybrown:[244,164,96],seagreen:[46,139,87],seashell:[255,245,238],sienna:[160,82,45],silver:[192,192,192],skyblue:[135,206,235],slateblue:[106,90,205],slategray:[112,128,144],slategrey:[112,128,144],snow:[255,250,250],springgreen:[0,255,127],steelblue:[70,130,180],tan:[210,180,140],teal:[0,128,128],thistle:[216,191,216],tomato:[255,99,71],turquoise:[64,224,208],violet:[238,130,238],wheat:[245,222,179],white:[255,255,255],whitesmoke:[245,245,245],yellow:[255,255,0],yellowgreen:[154,205,50]},Wt=Vt,Yt=Object.hasOwnProperty,Jt=Object.create(null);for(var Gt in Zt)Yt.call(Zt,Gt)&&(Jt[Zt[Gt]]=Gt);var Kt=Ut.exports={to:{},get:{}};function Qt(e,t,r){return Math.min(Math.max(t,e),r)}function Xt(e){var t=Math.round(e).toString(16).toUpperCase();return t.length<2?"0"+t:t}Kt.get=function(e){var t,r;switch(e.substring(0,3).toLowerCase()){case"hsl":t=Kt.get.hsl(e),r="hsl";break;case"hwb":t=Kt.get.hwb(e),r="hwb";break;default:t=Kt.get.rgb(e),r="rgb"}return t?{model:r,value:t}:null},Kt.get.rgb=function(e){if(!e)return null;var t,r,n,a=[0,0,0,1];if(t=e.match(/^#([a-f0-9]{6})([a-f0-9]{2})?$/i)){for(n=t[2],t=t[1],r=0;r<3;r++){var o=2*r;a[r]=parseInt(t.slice(o,o+2),16)}n&&(a[3]=parseInt(n,16)/255)}else if(t=e.match(/^#([a-f0-9]{3,4})$/i)){for(n=(t=t[1])[3],r=0;r<3;r++)a[r]=parseInt(t[r]+t[r],16);n&&(a[3]=parseInt(n+n,16)/255)}else if(t=e.match(/^rgba?\(\s*([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)(?=[\s,])\s*(?:,\s*)?([+-]?\d+)\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/)){for(r=0;r<3;r++)a[r]=parseInt(t[r+1],0);t[4]&&(t[5]?a[3]=.01*parseFloat(t[4]):a[3]=parseFloat(t[4]))}else{if(!(t=e.match(/^rgba?\(\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*,?\s*([+-]?[\d\.]+)\%\s*(?:[,|\/]\s*([+-]?[\d\.]+)(%?)\s*)?\)$/)))return(t=e.match(/^(\w+)$/))?"transparent"===t[1]?[0,0,0,0]:Yt.call(Zt,t[1])?((a=Zt[t[1]])[3]=1,a):null:null;for(r=0;r<3;r++)a[r]=Math.round(2.55*parseFloat(t[r+1]));t[4]&&(t[5]?a[3]=.01*parseFloat(t[4]):a[3]=parseFloat(t[4]))}for(r=0;r<3;r++)a[r]=Qt(a[r],0,255);return a[3]=Qt(a[3],0,1),a},Kt.get.hsl=function(e){if(!e)return null;var t=e.match(/^hsla?\(\s*([+-]?(?:\d{0,3}\.)?\d+)(?:deg)?\s*,?\s*([+-]?[\d\.]+)%\s*,?\s*([+-]?[\d\.]+)%\s*(?:[,|\/]\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/);if(t){var r=parseFloat(t[4]);return[(parseFloat(t[1])%360+360)%360,Qt(parseFloat(t[2]),0,100),Qt(parseFloat(t[3]),0,100),Qt(isNaN(r)?1:r,0,1)]}return null},Kt.get.hwb=function(e){if(!e)return null;var t=e.match(/^hwb\(\s*([+-]?\d{0,3}(?:\.\d+)?)(?:deg)?\s*,\s*([+-]?[\d\.]+)%\s*,\s*([+-]?[\d\.]+)%\s*(?:,\s*([+-]?(?=\.\d|\d)(?:0|[1-9]\d*)?(?:\.\d*)?(?:[eE][+-]?\d+)?)\s*)?\)$/);if(t){var r=parseFloat(t[4]);return[(parseFloat(t[1])%360+360)%360,Qt(parseFloat(t[2]),0,100),Qt(parseFloat(t[3]),0,100),Qt(isNaN(r)?1:r,0,1)]}return null},Kt.to.hex=function(){var e=Wt(arguments);return"#"+Xt(e[0])+Xt(e[1])+Xt(e[2])+(e[3]<1?Xt(Math.round(255*e[3])):"")},Kt.to.rgb=function(){var e=Wt(arguments);return e.length<4||1===e[3]?"rgb("+Math.round(e[0])+", "+Math.round(e[1])+", "+Math.round(e[2])+")":"rgba("+Math.round(e[0])+", "+Math.round(e[1])+", "+Math.round(e[2])+", "+e[3]+")"},Kt.to.rgb.percent=function(){var e=Wt(arguments),t=Math.round(e[0]/255*100),r=Math.round(e[1]/255*100),n=Math.round(e[2]/255*100);return e.length<4||1===e[3]?"rgb("+t+"%, "+r+"%, "+n+"%)":"rgba("+t+"%, "+r+"%, "+n+"%, "+e[3]+")"},Kt.to.hsl=function(){var e=Wt(arguments);return e.length<4||1===e[3]?"hsl("+e[0]+", "+e[1]+"%, "+e[2]+"%)":"hsla("+e[0]+", "+e[1]+"%, "+e[2]+"%, "+e[3]+")"},Kt.to.hwb=function(){var e=Wt(arguments),t="";return e.length>=4&&1!==e[3]&&(t=", "+e[3]),"hwb("+e[0]+", "+e[1]+"%, "+e[2]+"%"+t+")"},Kt.to.keyword=function(e){return Jt[e.slice(0,3)]};var er=Ut.exports;const tr={aliceblue:[240,248,255],antiquewhite:[250,235,215],aqua:[0,255,255],aquamarine:[127,255,212],azure:[240,255,255],beige:[245,245,220],bisque:[255,228,196],black:[0,0,0],blanchedalmond:[255,235,205],blue:[0,0,255],blueviolet:[138,43,226],brown:[165,42,42],burlywood:[222,184,135],cadetblue:[95,158,160],chartreuse:[127,255,0],chocolate:[210,105,30],coral:[255,127,80],cornflowerblue:[100,149,237],cornsilk:[255,248,220],crimson:[220,20,60],cyan:[0,255,255],darkblue:[0,0,139],darkcyan:[0,139,139],darkgoldenrod:[184,134,11],darkgray:[169,169,169],darkgreen:[0,100,0],darkgrey:[169,169,169],darkkhaki:[189,183,107],darkmagenta:[139,0,139],darkolivegreen:[85,107,47],darkorange:[255,140,0],darkorchid:[153,50,204],darkred:[139,0,0],darksalmon:[233,150,122],darkseagreen:[143,188,143],darkslateblue:[72,61,139],darkslategray:[47,79,79],darkslategrey:[47,79,79],darkturquoise:[0,206,209],darkviolet:[148,0,211],deeppink:[255,20,147],deepskyblue:[0,191,255],dimgray:[105,105,105],dimgrey:[105,105,105],dodgerblue:[30,144,255],firebrick:[178,34,34],floralwhite:[255,250,240],forestgreen:[34,139,34],fuchsia:[255,0,255],gainsboro:[220,220,220],ghostwhite:[248,248,255],gold:[255,215,0],goldenrod:[218,165,32],gray:[128,128,128],green:[0,128,0],greenyellow:[173,255,47],grey:[128,128,128],honeydew:[240,255,240],hotpink:[255,105,180],indianred:[205,92,92],indigo:[75,0,130],ivory:[255,255,240],khaki:[240,230,140],lavender:[230,230,250],lavenderblush:[255,240,245],lawngreen:[124,252,0],lemonchiffon:[255,250,205],lightblue:[173,216,230],lightcoral:[240,128,128],lightcyan:[224,255,255],lightgoldenrodyellow:[250,250,210],lightgray:[211,211,211],lightgreen:[144,238,144],lightgrey:[211,211,211],lightpink:[255,182,193],lightsalmon:[255,160,122],lightseagreen:[32,178,170],lightskyblue:[135,206,250],lightslategray:[119,136,153],lightslategrey:[119,136,153],lightsteelblue:[176,196,222],lightyellow:[255,255,224],lime:[0,255,0],limegreen:[50,205,50],linen:[250,240,230],magenta:[255,0,255],maroon:[128,0,0],mediumaquamarine:[102,205,170],mediumblue:[0,0,205],mediumorchid:[186,85,211],mediumpurple:[147,112,219],mediumseagreen:[60,179,113],mediumslateblue:[123,104,238],mediumspringgreen:[0,250,154],mediumturquoise:[72,209,204],mediumvioletred:[199,21,133],midnightblue:[25,25,112],mintcream:[245,255,250],mistyrose:[255,228,225],moccasin:[255,228,181],navajowhite:[255,222,173],navy:[0,0,128],oldlace:[253,245,230],olive:[128,128,0],olivedrab:[107,142,35],orange:[255,165,0],orangered:[255,69,0],orchid:[218,112,214],palegoldenrod:[238,232,170],palegreen:[152,251,152],paleturquoise:[175,238,238],palevioletred:[219,112,147],papayawhip:[255,239,213],peachpuff:[255,218,185],peru:[205,133,63],pink:[255,192,203],plum:[221,160,221],powderblue:[176,224,230],purple:[128,0,128],rebeccapurple:[102,51,153],red:[255,0,0],rosybrown:[188,143,143],royalblue:[65,105,225],saddlebrown:[139,69,19],salmon:[250,128,114],sandybrown:[244,164,96],seagreen:[46,139,87],seashell:[255,245,238],sienna:[160,82,45],silver:[192,192,192],skyblue:[135,206,235],slateblue:[106,90,205],slategray:[112,128,144],slategrey:[112,128,144],snow:[255,250,250],springgreen:[0,255,127],steelblue:[70,130,180],tan:[210,180,140],teal:[0,128,128],thistle:[216,191,216],tomato:[255,99,71],turquoise:[64,224,208],violet:[238,130,238],wheat:[245,222,179],white:[255,255,255],whitesmoke:[245,245,245],yellow:[255,255,0],yellowgreen:[154,205,50]},rr={};for(const e of Object.keys(tr))rr[tr[e]]=e;const nr={rgb:{channels:3,labels:"rgb"},hsl:{channels:3,labels:"hsl"},hsv:{channels:3,labels:"hsv"},hwb:{channels:3,labels:"hwb"},cmyk:{channels:4,labels:"cmyk"},xyz:{channels:3,labels:"xyz"},lab:{channels:3,labels:"lab"},lch:{channels:3,labels:"lch"},hex:{channels:1,labels:["hex"]},keyword:{channels:1,labels:["keyword"]},ansi16:{channels:1,labels:["ansi16"]},ansi256:{channels:1,labels:["ansi256"]},hcg:{channels:3,labels:["h","c","g"]},apple:{channels:3,labels:["r16","g16","b16"]},gray:{channels:1,labels:["gray"]}};var ar=nr;for(const e of Object.keys(nr)){if(!("channels"in nr[e]))throw new Error("missing channels property: "+e);if(!("labels"in nr[e]))throw new Error("missing channel labels property: "+e);if(nr[e].labels.length!==nr[e].channels)throw new Error("channel and label counts mismatch: "+e);const{channels:t,labels:r}=nr[e];delete nr[e].channels,delete nr[e].labels,Object.defineProperty(nr[e],"channels",{value:t}),Object.defineProperty(nr[e],"labels",{value:r})}function or(e,t){return(e[0]-t[0])**2+(e[1]-t[1])**2+(e[2]-t[2])**2}nr.rgb.hsl=function(e){const t=e[0]/255,r=e[1]/255,n=e[2]/255,a=Math.min(t,r,n),o=Math.max(t,r,n),i=o-a;let s,l;o===a?s=0:t===o?s=(r-n)/i:r===o?s=2+(n-t)/i:n===o&&(s=4+(t-r)/i),s=Math.min(60*s,360),s<0&&(s+=360);const c=(a+o)/2;return l=o===a?0:c<=.5?i/(o+a):i/(2-o-a),[s,100*l,100*c]},nr.rgb.hsv=function(e){let t,r,n,a,o;const i=e[0]/255,s=e[1]/255,l=e[2]/255,c=Math.max(i,s,l),u=c-Math.min(i,s,l),h=function(e){return(c-e)/6/u+.5};return 0===u?(a=0,o=0):(o=u/c,t=h(i),r=h(s),n=h(l),i===c?a=n-r:s===c?a=1/3+t-n:l===c&&(a=2/3+r-t),a<0?a+=1:a>1&&(a-=1)),[360*a,100*o,100*c]},nr.rgb.hwb=function(e){const t=e[0],r=e[1];let n=e[2];const a=nr.rgb.hsl(e)[0],o=1/255*Math.min(t,Math.min(r,n));return n=1-1/255*Math.max(t,Math.max(r,n)),[a,100*o,100*n]},nr.rgb.cmyk=function(e){const t=e[0]/255,r=e[1]/255,n=e[2]/255,a=Math.min(1-t,1-r,1-n);return[100*((1-t-a)/(1-a)||0),100*((1-r-a)/(1-a)||0),100*((1-n-a)/(1-a)||0),100*a]},nr.rgb.keyword=function(e){const t=rr[e];if(t)return t;let r,n=1/0;for(const t of Object.keys(tr)){const a=or(e,tr[t]);a<n&&(n=a,r=t)}return r},nr.keyword.rgb=function(e){return tr[e]},nr.rgb.xyz=function(e){let t=e[0]/255,r=e[1]/255,n=e[2]/255;t=t>.04045?((t+.055)/1.055)**2.4:t/12.92,r=r>.04045?((r+.055)/1.055)**2.4:r/12.92,n=n>.04045?((n+.055)/1.055)**2.4:n/12.92;return[100*(.4124*t+.3576*r+.1805*n),100*(.2126*t+.7152*r+.0722*n),100*(.0193*t+.1192*r+.9505*n)]},nr.rgb.lab=function(e){const t=nr.rgb.xyz(e);let r=t[0],n=t[1],a=t[2];r/=95.047,n/=100,a/=108.883,r=r>.008856?r**(1/3):7.787*r+16/116,n=n>.008856?n**(1/3):7.787*n+16/116,a=a>.008856?a**(1/3):7.787*a+16/116;return[116*n-16,500*(r-n),200*(n-a)]},nr.hsl.rgb=function(e){const t=e[0]/360,r=e[1]/100,n=e[2]/100;let a,o,i;if(0===r)return i=255*n,[i,i,i];a=n<.5?n*(1+r):n+r-n*r;const s=2*n-a,l=[0,0,0];for(let e=0;e<3;e++)o=t+1/3*-(e-1),o<0&&o++,o>1&&o--,i=6*o<1?s+6*(a-s)*o:2*o<1?a:3*o<2?s+(a-s)*(2/3-o)*6:s,l[e]=255*i;return l},nr.hsl.hsv=function(e){const t=e[0];let r=e[1]/100,n=e[2]/100,a=r;const o=Math.max(n,.01);n*=2,r*=n<=1?n:2-n,a*=o<=1?o:2-o;return[t,100*(0===n?2*a/(o+a):2*r/(n+r)),100*((n+r)/2)]},nr.hsv.rgb=function(e){const t=e[0]/60,r=e[1]/100;let n=e[2]/100;const a=Math.floor(t)%6,o=t-Math.floor(t),i=255*n*(1-r),s=255*n*(1-r*o),l=255*n*(1-r*(1-o));switch(n*=255,a){case 0:return[n,l,i];case 1:return[s,n,i];case 2:return[i,n,l];case 3:return[i,s,n];case 4:return[l,i,n];case 5:return[n,i,s]}},nr.hsv.hsl=function(e){const t=e[0],r=e[1]/100,n=e[2]/100,a=Math.max(n,.01);let o,i;i=(2-r)*n;const s=(2-r)*a;return o=r*a,o/=s<=1?s:2-s,o=o||0,i/=2,[t,100*o,100*i]},nr.hwb.rgb=function(e){const t=e[0]/360;let r=e[1]/100,n=e[2]/100;const a=r+n;let o;a>1&&(r/=a,n/=a);const i=Math.floor(6*t),s=1-n;o=6*t-i,0!=(1&i)&&(o=1-o);const l=r+o*(s-r);let c,u,h;switch(i){default:case 6:case 0:c=s,u=l,h=r;break;case 1:c=l,u=s,h=r;break;case 2:c=r,u=s,h=l;break;case 3:c=r,u=l,h=s;break;case 4:c=l,u=r,h=s;break;case 5:c=s,u=r,h=l}return[255*c,255*u,255*h]},nr.cmyk.rgb=function(e){const t=e[0]/100,r=e[1]/100,n=e[2]/100,a=e[3]/100;return[255*(1-Math.min(1,t*(1-a)+a)),255*(1-Math.min(1,r*(1-a)+a)),255*(1-Math.min(1,n*(1-a)+a))]},nr.xyz.rgb=function(e){const t=e[0]/100,r=e[1]/100,n=e[2]/100;let a,o,i;return a=3.2406*t+-1.5372*r+-.4986*n,o=-.9689*t+1.8758*r+.0415*n,i=.0557*t+-.204*r+1.057*n,a=a>.0031308?1.055*a**(1/2.4)-.055:12.92*a,o=o>.0031308?1.055*o**(1/2.4)-.055:12.92*o,i=i>.0031308?1.055*i**(1/2.4)-.055:12.92*i,a=Math.min(Math.max(0,a),1),o=Math.min(Math.max(0,o),1),i=Math.min(Math.max(0,i),1),[255*a,255*o,255*i]},nr.xyz.lab=function(e){let t=e[0],r=e[1],n=e[2];t/=95.047,r/=100,n/=108.883,t=t>.008856?t**(1/3):7.787*t+16/116,r=r>.008856?r**(1/3):7.787*r+16/116,n=n>.008856?n**(1/3):7.787*n+16/116;return[116*r-16,500*(t-r),200*(r-n)]},nr.lab.xyz=function(e){let t,r,n;r=(e[0]+16)/116,t=e[1]/500+r,n=r-e[2]/200;const a=r**3,o=t**3,i=n**3;return r=a>.008856?a:(r-16/116)/7.787,t=o>.008856?o:(t-16/116)/7.787,n=i>.008856?i:(n-16/116)/7.787,t*=95.047,r*=100,n*=108.883,[t,r,n]},nr.lab.lch=function(e){const t=e[0],r=e[1],n=e[2];let a;a=360*Math.atan2(n,r)/2/Math.PI,a<0&&(a+=360);return[t,Math.sqrt(r*r+n*n),a]},nr.lch.lab=function(e){const t=e[0],r=e[1],n=e[2]/360*2*Math.PI;return[t,r*Math.cos(n),r*Math.sin(n)]},nr.rgb.ansi16=function(e,t=null){const[r,n,a]=e;let o=null===t?nr.rgb.hsv(e)[2]:t;if(o=Math.round(o/50),0===o)return 30;let i=30+(Math.round(a/255)<<2|Math.round(n/255)<<1|Math.round(r/255));return 2===o&&(i+=60),i},nr.hsv.ansi16=function(e){return nr.rgb.ansi16(nr.hsv.rgb(e),e[2])},nr.rgb.ansi256=function(e){const t=e[0],r=e[1],n=e[2];if(t===r&&r===n)return t<8?16:t>248?231:Math.round((t-8)/247*24)+232;return 16+36*Math.round(t/255*5)+6*Math.round(r/255*5)+Math.round(n/255*5)},nr.ansi16.rgb=function(e){let t=e%10;if(0===t||7===t)return e>50&&(t+=3.5),t=t/10.5*255,[t,t,t];const r=.5*(1+~~(e>50));return[(1&t)*r*255,(t>>1&1)*r*255,(t>>2&1)*r*255]},nr.ansi256.rgb=function(e){if(e>=232){const t=10*(e-232)+8;return[t,t,t]}let t;e-=16;return[Math.floor(e/36)/5*255,Math.floor((t=e%36)/6)/5*255,t%6/5*255]},nr.rgb.hex=function(e){const t=(((255&Math.round(e[0]))<<16)+((255&Math.round(e[1]))<<8)+(255&Math.round(e[2]))).toString(16).toUpperCase();return"000000".substring(t.length)+t},nr.hex.rgb=function(e){const t=e.toString(16).match(/[a-f0-9]{6}|[a-f0-9]{3}/i);if(!t)return[0,0,0];let r=t[0];3===t[0].length&&(r=r.split("").map((e=>e+e)).join(""));const n=parseInt(r,16);return[n>>16&255,n>>8&255,255&n]},nr.rgb.hcg=function(e){const t=e[0]/255,r=e[1]/255,n=e[2]/255,a=Math.max(Math.max(t,r),n),o=Math.min(Math.min(t,r),n),i=a-o;let s,l;return s=i<1?o/(1-i):0,l=i<=0?0:a===t?(r-n)/i%6:a===r?2+(n-t)/i:4+(t-r)/i,l/=6,l%=1,[360*l,100*i,100*s]},nr.hsl.hcg=function(e){const t=e[1]/100,r=e[2]/100,n=r<.5?2*t*r:2*t*(1-r);let a=0;return n<1&&(a=(r-.5*n)/(1-n)),[e[0],100*n,100*a]},nr.hsv.hcg=function(e){const t=e[1]/100,r=e[2]/100,n=t*r;let a=0;return n<1&&(a=(r-n)/(1-n)),[e[0],100*n,100*a]},nr.hcg.rgb=function(e){const t=e[0]/360,r=e[1]/100,n=e[2]/100;if(0===r)return[255*n,255*n,255*n];const a=[0,0,0],o=t%1*6,i=o%1,s=1-i;let l=0;switch(Math.floor(o)){case 0:a[0]=1,a[1]=i,a[2]=0;break;case 1:a[0]=s,a[1]=1,a[2]=0;break;case 2:a[0]=0,a[1]=1,a[2]=i;break;case 3:a[0]=0,a[1]=s,a[2]=1;break;case 4:a[0]=i,a[1]=0,a[2]=1;break;default:a[0]=1,a[1]=0,a[2]=s}return l=(1-r)*n,[255*(r*a[0]+l),255*(r*a[1]+l),255*(r*a[2]+l)]},nr.hcg.hsv=function(e){const t=e[1]/100,r=t+e[2]/100*(1-t);let n=0;return r>0&&(n=t/r),[e[0],100*n,100*r]},nr.hcg.hsl=function(e){const t=e[1]/100,r=e[2]/100*(1-t)+.5*t;let n=0;return r>0&&r<.5?n=t/(2*r):r>=.5&&r<1&&(n=t/(2*(1-r))),[e[0],100*n,100*r]},nr.hcg.hwb=function(e){const t=e[1]/100,r=t+e[2]/100*(1-t);return[e[0],100*(r-t),100*(1-r)]},nr.hwb.hcg=function(e){const t=e[1]/100,r=1-e[2]/100,n=r-t;let a=0;return n<1&&(a=(r-n)/(1-n)),[e[0],100*n,100*a]},nr.apple.rgb=function(e){return[e[0]/65535*255,e[1]/65535*255,e[2]/65535*255]},nr.rgb.apple=function(e){return[e[0]/255*65535,e[1]/255*65535,e[2]/255*65535]},nr.gray.rgb=function(e){return[e[0]/100*255,e[0]/100*255,e[0]/100*255]},nr.gray.hsl=function(e){return[0,0,e[0]]},nr.gray.hsv=nr.gray.hsl,nr.gray.hwb=function(e){return[0,100,e[0]]},nr.gray.cmyk=function(e){return[0,0,0,e[0]]},nr.gray.lab=function(e){return[e[0],0,0]},nr.gray.hex=function(e){const t=255&Math.round(e[0]/100*255),r=((t<<16)+(t<<8)+t).toString(16).toUpperCase();return"000000".substring(r.length)+r},nr.rgb.gray=function(e){return[(e[0]+e[1]+e[2])/3/255*100]};const ir=ar;function sr(e){const t=function(){const e={},t=Object.keys(ir);for(let r=t.length,n=0;n<r;n++)e[t[n]]={distance:-1,parent:null};return e}(),r=[e];for(t[e].distance=0;r.length;){const e=r.pop(),n=Object.keys(ir[e]);for(let a=n.length,o=0;o<a;o++){const a=n[o],i=t[a];-1===i.distance&&(i.distance=t[e].distance+1,i.parent=e,r.unshift(a))}}return t}function lr(e,t){return function(r){return t(e(r))}}function cr(e,t){const r=[t[e].parent,e];let n=ir[t[e].parent][e],a=t[e].parent;for(;t[a].parent;)r.unshift(t[a].parent),n=lr(ir[t[a].parent][a],n),a=t[a].parent;return n.conversion=r,n}const ur=ar,hr=function(e){const t=sr(e),r={},n=Object.keys(t);for(let e=n.length,a=0;a<e;a++){const e=n[a];null!==t[e].parent&&(r[e]=cr(e,t))}return r},dr={};Object.keys(ur).forEach((e=>{dr[e]={},Object.defineProperty(dr[e],"channels",{value:ur[e].channels}),Object.defineProperty(dr[e],"labels",{value:ur[e].labels});const t=hr(e);Object.keys(t).forEach((r=>{const n=t[r];dr[e][r]=function(e){const t=function(...t){const r=t[0];if(null==r)return r;r.length>1&&(t=r);const n=e(t);if("object"==typeof n)for(let e=n.length,t=0;t<e;t++)n[t]=Math.round(n[t]);return n};return"conversion"in e&&(t.conversion=e.conversion),t}(n),dr[e][r].raw=function(e){const t=function(...t){const r=t[0];return null==r?r:(r.length>1&&(t=r),e(t))};return"conversion"in e&&(t.conversion=e.conversion),t}(n)}))}));const mr=er,gr=dr,pr=["keyword","gray","hex"],fr={};for(const e of Object.keys(gr))fr[[...gr[e].labels].sort().join("")]=e;const br={};function vr(e,t){if(!(this instanceof vr))return new vr(e,t);if(t&&t in pr&&(t=null),t&&!(t in gr))throw new Error("Unknown model: "+t);let r,n;if(null==e)this.model="rgb",this.color=[0,0,0],this.valpha=1;else if(e instanceof vr)this.model=e.model,this.color=[...e.color],this.valpha=e.valpha;else if("string"==typeof e){const t=mr.get(e);if(null===t)throw new Error("Unable to parse color from string: "+e);this.model=t.model,n=gr[this.model].channels,this.color=t.value.slice(0,n),this.valpha="number"==typeof t.value[n]?t.value[n]:1}else if(e.length>0){this.model=t||"rgb",n=gr[this.model].channels;const r=Array.prototype.slice.call(e,0,n);this.color=$r(r,n),this.valpha="number"==typeof e[n]?e[n]:1}else if("number"==typeof e)this.model="rgb",this.color=[e>>16&255,e>>8&255,255&e],this.valpha=1;else{this.valpha=1;const t=Object.keys(e);"alpha"in e&&(t.splice(t.indexOf("alpha"),1),this.valpha="number"==typeof e.alpha?e.alpha:0);const n=t.sort().join("");if(!(n in fr))throw new Error("Unable to parse color from object: "+JSON.stringify(e));this.model=fr[n];const{labels:a}=gr[this.model],o=[];for(r=0;r<a.length;r++)o.push(e[a[r]]);this.color=$r(o)}if(br[this.model])for(n=gr[this.model].channels,r=0;r<n;r++){const e=br[this.model][r];e&&(this.color[r]=e(this.color[r]))}this.valpha=Math.max(0,Math.min(1,this.valpha)),Object.freeze&&Object.freeze(this)}vr.prototype={toString(){return this.string()},toJSON(){return this[this.model]()},string(e){let t=this.model in mr.to?this:this.rgb();t=t.round("number"==typeof e?e:1);const r=1===t.valpha?t.color:[...t.color,this.valpha];return mr.to[t.model](r)},percentString(e){const t=this.rgb().round("number"==typeof e?e:1),r=1===t.valpha?t.color:[...t.color,this.valpha];return mr.to.rgb.percent(r)},array(){return 1===this.valpha?[...this.color]:[...this.color,this.valpha]},object(){const e={},{channels:t}=gr[this.model],{labels:r}=gr[this.model];for(let n=0;n<t;n++)e[r[n]]=this.color[n];return 1!==this.valpha&&(e.alpha=this.valpha),e},unitArray(){const e=this.rgb().color;return e[0]/=255,e[1]/=255,e[2]/=255,1!==this.valpha&&e.push(this.valpha),e},unitObject(){const e=this.rgb().object();return e.r/=255,e.g/=255,e.b/=255,1!==this.valpha&&(e.alpha=this.valpha),e},round(e){return e=Math.max(e||0,0),new vr([...this.color.map(yr(e)),this.valpha],this.model)},alpha(e){return void 0!==e?new vr([...this.color,Math.max(0,Math.min(1,e))],this.model):this.valpha},red:_r("rgb",0,wr(255)),green:_r("rgb",1,wr(255)),blue:_r("rgb",2,wr(255)),hue:_r(["hsl","hsv","hsl","hwb","hcg"],0,(e=>(e%360+360)%360)),saturationl:_r("hsl",1,wr(100)),lightness:_r("hsl",2,wr(100)),saturationv:_r("hsv",1,wr(100)),value:_r("hsv",2,wr(100)),chroma:_r("hcg",1,wr(100)),gray:_r("hcg",2,wr(100)),white:_r("hwb",1,wr(100)),wblack:_r("hwb",2,wr(100)),cyan:_r("cmyk",0,wr(100)),magenta:_r("cmyk",1,wr(100)),yellow:_r("cmyk",2,wr(100)),black:_r("cmyk",3,wr(100)),x:_r("xyz",0,wr(95.047)),y:_r("xyz",1,wr(100)),z:_r("xyz",2,wr(108.833)),l:_r("lab",0,wr(100)),a:_r("lab",1),b:_r("lab",2),keyword(e){return void 0!==e?new vr(e):gr[this.model].keyword(this.color)},hex(e){return void 0!==e?new vr(e):mr.to.hex(this.rgb().round().color)},hexa(e){if(void 0!==e)return new vr(e);const t=this.rgb().round().color;let r=Math.round(255*this.valpha).toString(16).toUpperCase();return 1===r.length&&(r="0"+r),mr.to.hex(t)+r},rgbNumber(){const e=this.rgb().color;return(255&e[0])<<16|(255&e[1])<<8|255&e[2]},luminosity(){const e=this.rgb().color,t=[];for(const[r,n]of e.entries()){const e=n/255;t[r]=e<=.04045?e/12.92:((e+.055)/1.055)**2.4}return.2126*t[0]+.7152*t[1]+.0722*t[2]},contrast(e){const t=this.luminosity(),r=e.luminosity();return t>r?(t+.05)/(r+.05):(r+.05)/(t+.05)},level(e){const t=this.contrast(e);return t>=7?"AAA":t>=4.5?"AA":""},isDark(){const e=this.rgb().color;return(2126*e[0]+7152*e[1]+722*e[2])/1e4<128},isLight(){return!this.isDark()},negate(){const e=this.rgb();for(let t=0;t<3;t++)e.color[t]=255-e.color[t];return e},lighten(e){const t=this.hsl();return t.color[2]+=t.color[2]*e,t},darken(e){const t=this.hsl();return t.color[2]-=t.color[2]*e,t},saturate(e){const t=this.hsl();return t.color[1]+=t.color[1]*e,t},desaturate(e){const t=this.hsl();return t.color[1]-=t.color[1]*e,t},whiten(e){const t=this.hwb();return t.color[1]+=t.color[1]*e,t},blacken(e){const t=this.hwb();return t.color[2]+=t.color[2]*e,t},grayscale(){const e=this.rgb().color,t=.3*e[0]+.59*e[1]+.11*e[2];return vr.rgb(t,t,t)},fade(e){return this.alpha(this.valpha-this.valpha*e)},opaquer(e){return this.alpha(this.valpha+this.valpha*e)},rotate(e){const t=this.hsl();let r=t.color[0];return r=(r+e)%360,r=r<0?360+r:r,t.color[0]=r,t},mix(e,t){if(!e||!e.rgb)throw new Error('Argument to "mix" was not a Color instance, but rather an instance of '+typeof e);const r=e.rgb(),n=this.rgb(),a=void 0===t?.5:t,o=2*a-1,i=r.alpha()-n.alpha(),s=((o*i==-1?o:(o+i)/(1+o*i))+1)/2,l=1-s;return vr.rgb(s*r.red()+l*n.red(),s*r.green()+l*n.green(),s*r.blue()+l*n.blue(),r.alpha()*a+n.alpha()*(1-a))}};for(const e of Object.keys(gr)){if(pr.includes(e))continue;const{channels:t}=gr[e];vr.prototype[e]=function(...t){return this.model===e?new vr(this):t.length>0?new vr(t,e):new vr([...(r=gr[this.model][e].raw(this.color),Array.isArray(r)?r:[r]),this.valpha],e);var r},vr[e]=function(...r){let n=r[0];return"number"==typeof n&&(n=$r(r,t)),new vr(n,e)}}function yr(e){return function(t){return function(e,t){return Number(e.toFixed(t))}(t,e)}}function _r(e,t,r){e=Array.isArray(e)?e:[e];for(const n of e)(br[n]||(br[n]=[]))[t]=r;return e=e[0],function(n){let a;return void 0!==n?(r&&(n=r(n)),a=this[e](),a.color[t]=n,a):(a=this[e]().color[t],r&&(a=r(a)),a)}}function wr(e){return function(t){return Math.max(0,Math.min(e,t))}}function $r(e,t){for(let r=0;r<t;r++)"number"!=typeof e[r]&&(e[r]=0);return e}var kr=vr;const xr=["primary","accent","red","pink","purple","deep-purple","indigo","blue","light-blue","cyan","teal","green","light-green","lime","yellow","amber","orange","deep-orange","brown","grey","blue-grey","black","white","disabled"];function Ar(e){if("primary"===e||"accent"===e)return`var(--rgb-${e}-color)`;if(xr.includes(e))return`var(--rgb-${e})`;if(e.startsWith("#"))try{return kr.rgb(e).rgb().array().join(", ")}catch(e){return""}return e}const Er=s`
    --default-red: 244, 67, 54;
    --default-pink: 233, 30, 99;
    --default-purple: 156, 39, 176;
    --default-deep-purple: 103, 58, 183;
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
    --default-deep-orange: 255, 87, 34;
    --default-brown: 121, 85, 72;
    --default-grey: 158, 158, 158;
    --default-blue-grey: 96, 125, 139;
    --default-black: 0, 0, 0;
    --default-white: 255, 255, 255;
    --default-disabled: 189, 189, 189;
`,Sr=s`
    --default-disabled: 111, 111, 111;
`
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,Mr=e=>t=>"function"==typeof t?((e,t)=>(customElements.define(e,t),t))(e,t):((e,t)=>{const{kind:r,elements:n}=t;return{kind:r,elements:n,finisher(t){customElements.define(e,t)}}})(e,t)
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,zr=(e,t)=>"method"===t.kind&&t.descriptor&&!("value"in t.descriptor)?{...t,finisher(r){r.createProperty(t.key,e)}}:{kind:"field",key:Symbol(),placement:"own",descriptor:{},originalKey:t.key,initializer(){"function"==typeof t.initializer&&(this[t.key]=t.initializer.call(this))},finisher(r){r.createProperty(t.key,e)}},Dr=(e,t,r)=>{t.constructor.createProperty(r,e)};function Cr(e){return(t,r)=>void 0!==r?Dr(e,t,r):zr(e,t)}
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */function Or(e){return Cr({...e,state:!0})}
/**
 * @license
 * Copyright 2021 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */var jr;null===(jr=window.HTMLSlotElement)||void 0===jr||jr.prototype.assignedElements;const Tr=s`
    --spacing: var(--mush-spacing, 12px);

    /* Title */
    --title-padding: var(--mush-title-padding, 24px 12px 16px);
    --title-spacing: var(--mush-title-spacing, 12px);
    --title-font-size: var(--mush-title-font-size, 24px);
    --title-font-weight: var(--mush-title-font-weight, normal);
    --title-line-height: var(--mush-title-line-height, 1.2);
    --subtitle-font-size: var(--mush-subtitle-font-size, 16px);
    --subtitle-font-weight: var(--mush-subtitle-font-weight, normal);
    --subtitle-line-height: var(--mush-subtitle-line-height, 1.2);

    /* Card */
    --card-primary-font-size: var(--mush-card-primary-font-size, 14px);
    --card-secondary-font-size: var(--mush-card-secondary-font-size, 12px);
    --card-primary-font-weight: var(--mush-card-primary-font-weight, bold);
    --card-secondary-font-weight: var(--mush-card-secondary-font-weight, bolder);
    --card-primary-line-height: var(--mush-card-primary-line-height, 1.5);
    --card-secondary-line-height: var(--mush-card-secondary-line-height, 1.5);

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
    --control-height: var(--mush-control-height, 42px);
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
    --icon-size: var(--mush-icon-size, 42px);
    --icon-symbol-size: var(--mush-icon-symbol-size, 0.5em);
`,Pr=s`
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
    --rgb-grey: var(--mush-rgb-grey, var(--default-grey));
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
`,Nr="trash-card",Fr=`${Nr}-editor`;!function(e){const t=window;t.customCards=t.customCards||[];const r=e.type.replace("-card","").replace("mushroom-","");t.customCards.push({...e,preview:!0,documentationURL:`${wt}/blob/main/docs/cards/${r}.md`})}({type:Nr,name:"TrashCard",description:"TrashCard - indicates what type of trash will be picked up next based on your calendar entries 🗑️"});let Ir=class extends oe{static async getConfigElement(){return await Promise.resolve().then((function(){return sn})),document.createElement(Fr)}static async getStubConfig(e){const t=Object.keys(e.states);return{type:`custom:${Nr}`,entity:t[0]}}connectedCallback(){super.connectedCallback(),_t()}getCardSize(){return 1}setConfig(e){this.config={tap_action:{action:"more-info"},hold_action:{action:"more-info"},...e}}getTrashItem(e){const{settings:t}=this.config;if(!e||!("summary"in e))return{type:"none"};const{summary:r}=e;return r.includes(t?.organic?.pattern)?{...t?.organic,data:e,type:"organic"}:r.includes(t?.paper?.pattern)?{...t?.paper,data:e,type:"paper"}:r.includes(t?.recycle?.pattern)?{...t?.recycle,data:e,type:"recycle"}:r.includes(t?.waste?.pattern)?{...t?.waste,data:e,type:"waste"}:{...t?.others,data:e,type:"others"}}fetchCurrentTrashData(){if(!this.hass)return;const e=new Date,t=new Date;t.setDate(t.getDate()+2);const r=this.getDayFromDate(e),n=this.getDayFromDate(t),a=`calendars/${this.config?.entity}?start=${r}&end=${n}`;this.hass.callApi("GET",a).then((t=>{if(0===t.length)return{date:new Date,item:void 0};const n=t.find((e=>e.start.date===r)),a=t.filter((e=>e.start.date!==r)).sort(((e,t)=>`${e.start.date}`.localeCompare(`${t.start.date}`)))[0],o=e.getHours()<=10?n??a:a;return{date:o?new Date(o.start.date):new Date,item:this.getTrashItem(o)}})).then((e=>{this.trashData=e,this.lastChanged=new Date}))}shouldUpdate(e){return!!e.has("trashData")||(e.delete("trashData"),(!this.lastChanged||e.has("config")||Date.now()-this.lastChanged.getTime()>5e3)&&this.fetchCurrentTrashData(),!1)}getDayFromDate(e){return`${e.getFullYear()}-${`${e.getMonth()+1}`.padStart(2,"0")}-${`${e.getDate()}`.padStart(2,"0")}`}getDateString(){if(!this.trashData?.date||!this.hass)return"";const e=Pt(this.hass),t=new Date,r=new Date;r.setDate(r.getDate()+1);const n=this.getDayFromDate(t),a=this.getDayFromDate(r),o=this.getDayFromDate(this.trashData.date);return n===o?e("card.trash.today"):a===o?e("card.trash.tomorrow"):this.trashData.date.toLocaleDateString(this.hass.language,{weekday:"long",year:"numeric",month:"long",day:"numeric"})}render(){if(!this.config||!this.hass||!this.config.entity)return H;const e=this.config.entity,t=this.hass.states[e];if(!t)return H;if(!this.trashData?.item||"none"===this.trashData.item.type)return U``;const r={layout:(n=this.config).layout??ge(n),fill_container:n.fill_container??!1,primary_info:n.primary_info??fe(n),secondary_info:n.secondary_info??be(n),icon_type:n.icon_type??pe(n)};var n;const a=function(e){const t=e.language||"en";return e.translationMetadata.translations[t]&&e.translationMetadata.translations[t].isRTL||!1}(this.hass),o=this.trashData.item.color??"disabled",i={};if("disabled"!==o){const e=Ar(o);i["background-color"]=`rgba(${e}, 0.5)`}const s=this.getDateString();return U`
            <ha-card
                class=${me({"fill-container":r.fill_container,fullsize:!0===this.config.full_size})}
                style=${It(i)}
            >
                <mushroom-card .appearance=${r} ?rtl=${a}>
                    <mushroom-state-item
                        ?rtl=${a}
                        .appearance=${r}
                        .actionHandler=${st({hasHold:lt(this.config.hold_action),hasDoubleClick:lt(this.config.double_tap_action)})}
                    >
                        ${this.renderIcon(t)}
                        <mushroom-state-info
                            slot="info"
                            .primary=${"others"!==this.trashData.item.type?this.trashData.item.label??this.trashData.item.data?.summary??"":this.trashData.item.data?.summary}
                            .secondary=${s}
                        ></mushroom-state-info>
                    </mushroom-state-item>
                </mushroom-card>
            </ha-card>
        `}renderIcon(e){const t=this.trashData?.item?.icon??"mdi:delete-outline",r=this.trashData?.item?.color??"disabled",n={};if(r){const e=Ar(r);n["--icon-color"]=`rgb(${e})`,n["--shape-color"]=`rgba(${e}, 0.2)`}return U`
            <mushroom-shape-icon
                slot="icon"
                .disabled=${"disabled"===r}
                style=${It(n)}
            >
                <ha-state-icon .state=${e} .icon=${t}></ha-state-icon>
            </mushroom-shape-icon>
        `}renderStateInfo(e,t,r,n){if(!this.hass)return null;const a=((e,t,r,n,a,o)=>{const i=a[t.entity_id];return He(e,r,n,i,t.entity_id,t.attributes,void 0!==o?o:t.state)})(this.hass.localize,e,this.hass.locale,this.hass.config,this.hass.entities),o=n??a,i=yt(t.primary_info,r,o,e,this.hass),s=yt(t.secondary_info,r,o,e,this.hass);return U`
            <mushroom-state-info
                slot="info"
                .primary=${i}
                .secondary=${s}
            ></mushroom-state-info>
        `}static get styles(){return[le,s`
                :host {
                    ${Er}
                }
                :host([dark-mode]) {
                    ${Sr}
                }
                :host {
                    ${Pr}
                    ${Tr}
                }
            `,ce,s`
                ha-card.fullsize {
                    margin-left: -17px;
                    margin-right: -17px;
                    margin-top: -4px;
                }
                mushroom-state-item {
                    cursor: pointer;
                }
                mushroom-shape-icon {
                    --icon-color: rgb(var(--rgb-state-entity));
                    --shape-color: rgba(var(--rgb-state-entity), 0.2);
                }
            `]}};e([Cr({attribute:!1})],Ir.prototype,"hass",void 0),e([Or()],Ir.prototype,"config",void 0),e([Cr()],Ir.prototype,"trashData",void 0),Ir=e([Mr(Nr)],Ir),console.info("%c🗑️ TrashCard 1.0.1","background-color: #ef5350; color: #ffffff");class Ur extends TypeError{constructor(e,t){let r;const{message:n,explanation:a,...o}=e,{path:i}=e,s=0===i.length?n:`At path: ${i.join(".")} -- ${n}`;super(a??s),null!=a&&(this.cause=s),Object.assign(this,o),this.name=this.constructor.name,this.failures=()=>r??(r=[e,...t()])}}function Rr(e){return"object"==typeof e&&null!=e}function Hr(e){return"symbol"==typeof e?e.toString():"string"==typeof e?JSON.stringify(e):`${e}`}function Lr(e,t,r,n){if(!0===e)return;!1===e?e={}:"string"==typeof e&&(e={message:e});const{path:a,branch:o}=t,{type:i}=r,{refinement:s,message:l=`Expected a value of type \`${i}\`${s?` with refinement \`${s}\``:""}, but received: \`${Hr(n)}\``}=e;return{value:n,type:i,refinement:s,key:a[a.length-1],path:a,branch:o,...e,message:l}}function*Br(e,t,r,n){(function(e){return Rr(e)&&"function"==typeof e[Symbol.iterator]})(e)||(e=[e]);for(const a of e){const e=Lr(a,t,r,n);e&&(yield e)}}function*qr(e,t,r={}){const{path:n=[],branch:a=[e],coerce:o=!1,mask:i=!1}=r,s={path:n,branch:a};if(o&&(e=t.coercer(e,s),i&&"type"!==t.type&&Rr(t.schema)&&Rr(e)&&!Array.isArray(e)))for(const r in e)void 0===t.schema[r]&&delete e[r];let l="valid";for(const n of t.validator(e,s))n.explanation=r.message,l="not_valid",yield[n,void 0];for(let[c,u,h]of t.entries(e,s)){const t=qr(u,h,{path:void 0===c?n:[...n,c],branch:void 0===c?a:[...a,u],coerce:o,mask:i,message:r.message});for(const r of t)r[0]?(l=null!=r[0].refinement?"not_refined":"not_valid",yield[r[0],void 0]):o&&(u=r[1],void 0===c?e=u:e instanceof Map?e.set(c,u):e instanceof Set?e.add(u):Rr(e)&&(void 0!==u||c in e)&&(e[c]=u))}if("not_valid"!==l)for(const n of t.refiner(e,s))n.explanation=r.message,l="not_refined",yield[n,void 0];"valid"===l&&(yield[void 0,e])}class Vr{constructor(e){const{type:t,schema:r,validator:n,refiner:a,coercer:o=(e=>e),entries:i=function*(){}}=e;this.type=t,this.schema=r,this.entries=i,this.coercer=o,this.validator=n?(e,t)=>Br(n(e,t),t,this,e):()=>[],this.refiner=a?(e,t)=>Br(a(e,t),t,this,e):()=>[]}assert(e,t){return Zr(e,this,t)}create(e,t){return function(e,t,r){const n=Wr(e,t,{coerce:!0,message:r});if(n[0])throw n[0];return n[1]}(e,this,t)}is(e){return function(e,t){const r=Wr(e,t);return!r[0]}(e,this)}mask(e,t){return function(e,t,r){const n=Wr(e,t,{coerce:!0,mask:!0,message:r});if(n[0])throw n[0];return n[1]}(e,this,t)}validate(e,t={}){return Wr(e,this,t)}}function Zr(e,t,r){const n=Wr(e,t,{message:r});if(n[0])throw n[0]}function Wr(e,t,r={}){const n=qr(e,t,r),a=function(e){const{done:t,value:r}=e.next();return t?void 0:r}(n);if(a[0]){const e=new Ur(a[0],(function*(){for(const e of n)e[0]&&(yield e[0])}));return[e,void 0]}return[void 0,a[1]]}function Yr(e,t){return new Vr({type:e,schema:null,validator:t})}function Jr(){return Yr("boolean",(e=>"boolean"==typeof e))}function Gr(e){const t=e?Object.keys(e):[],r=Yr("never",(()=>!1));return new Vr({type:"object",schema:e||null,*entries(n){if(e&&Rr(n)){const a=new Set(Object.keys(n));for(const r of t)a.delete(r),yield[r,n[r],e[r]];for(const e of a)yield[e,n[e],r]}},validator:e=>Rr(e)||`Expected an object, but received: ${Hr(e)}`,coercer:e=>Rr(e)?{...e}:e})}function Kr(e){return new Vr({...e,validator:(t,r)=>void 0===t||e.validator(t,r),refiner:(t,r)=>void 0===t||e.refiner(t,r)})}function Qr(){return Yr("string",(e=>"string"==typeof e||`Expected a string, but received: ${Hr(e)}`))}const Xr=["icon_color","layout","fill_container","primary_info","secondary_info","icon_type","content_info","use_entity_picture","collapsible_controls","icon_animation"],en=ot([Xe("horizontal"),Xe("vertical"),Xe("default")]),tn=function(...e){const t="type"===e[0].type,r=e.map((e=>e.schema)),n=Object.assign({},...r);return t?function(e){const t=Object.keys(e);return new Vr({type:"type",schema:e,*entries(r){if(Rr(r))for(const n of t)yield[n,r[n],e[n]]},validator:e=>Rr(e)||`Expected an object, but received: ${Hr(e)}`,coercer:e=>Rr(e)?{...e}:e})}(n):Gr(n)}(tt({index:rt(et()),view_index:rt(et()),view_layout:Ge("any",(()=>!0)),type:nt()}),Gr({entity:Kr(Qr()),name:Kr(Qr()),layout:Kr(en),fill_container:Kr(Jr()),full_size:Kr(Jr()),settings:Kr(Gr({organic:Kr(Gr({color:Kr(Qr()),icon:Kr(Qr()),label:Kr(Qr()),pattern:Kr(Qr())})),paper:Kr(Gr({color:Kr(Qr()),icon:Kr(Qr()),label:Kr(Qr()),pattern:Kr(Qr())})),recycle:Kr(Gr({color:Kr(Qr()),icon:Kr(Qr()),label:Kr(Qr()),pattern:Kr(Qr())})),waste:Kr(Gr({color:Kr(Qr()),icon:Kr(Qr()),label:Kr(Qr()),pattern:Kr(Qr())})),others:Kr(Gr({color:Kr(Qr()),icon:Kr(Qr())}))}))})),rn=new Set(["organic.label","organic.icon","organic.color","organic.pattern","paper.label","paper.icon","paper.color","paper.pattern","recycle.label","recycle.icon","recycle.color","recycle.pattern","waste.label","waste.icon","waste.color","waste.pattern","others.label","others.icon","others.color","others.pattern"]),nn=[{name:"entity",selector:{entity:{domain:"calendar"}}},{type:"grid",name:"settings",schema:[{type:"grid",name:"organic",label:"Biomüll",schema:[{label:"organic.label",name:"label",selector:{text:{}}},{label:"organic.icon",name:"icon",selector:{icon:{}},context:{icon_entity:"entity"}},{label:"organic.color",name:"color",selector:{mush_color:{}}},{label:"organic.pattern",name:"pattern",selector:{text:{}}}]},{type:"grid",name:"paper",schema:[{label:"paper.label",name:"label",selector:{text:{}}},{label:"paper.icon",name:"icon",selector:{icon:{}},context:{icon_entity:"entity"}},{label:"paper.color",name:"color",selector:{mush_color:{}}},{label:"paper.pattern",name:"pattern",selector:{text:{}}}]},{type:"grid",name:"recycle",schema:[{label:"recycle.label",name:"label",selector:{text:{}}},{label:"recycle.icon",name:"icon",selector:{icon:{}},context:{icon_entity:"entity"}},{label:"recycle.color",name:"color",selector:{mush_color:{}}},{label:"recycle.pattern",name:"pattern",selector:{text:{}}}]},{type:"grid",name:"waste",schema:[{label:"waste.label",name:"label",selector:{text:{}}},{label:"waste.icon",name:"icon",selector:{icon:{}},context:{icon_entity:"entity"}},{label:"waste.color",name:"color",selector:{mush_color:{}}},{label:"waste.pattern",name:"pattern",selector:{text:{}}}]},{type:"grid",name:"others",schema:[{label:"others.icon",name:"icon",selector:{icon:{}},context:{icon_entity:"entity"}},{label:"others.color",name:"color",selector:{mush_color:{}}}]}]},{type:"grid",name:"",schema:[{name:"layout",selector:{mush_layout:{}}},{name:"fill_container",selector:{boolean:{}}}]}],an=e=>!!e&&e.themes.darkMode;let on=class extends oe{constructor(){super(...arguments),this.computeLabel=e=>{if(!this.hass)return e.name;const t=Pt(this.hass);return Xr.includes(e.name)?t(`editor.card.generic.${e.name}`):e.label&&rn.has(e.label)?t(`editor.card.trash.${e.label}`):this.hass.localize(`ui.panel.lovelace.editor.card.generic.${e.name}`)}}connectedCallback(){super.connectedCallback(),_t()}setConfig(e){Zr(e,tn),this.config=e}updated(e){if(super.updated(e),e.has("hass")&&this.hass){const t=an(e.get("hass")),r=an(this.hass);t!==r&&this.toggleAttribute("dark-mode",r)}}render(){return this.hass&&this.config?U`
            <ha-form
                .hass=${this.hass}
                .data=${this.config}
                .schema=${nn}
                .computeLabel=${this.computeLabel}
                @value-changed=${this.valueChanged}
            ></ha-form>
        `:H}valueChanged(e){((e,t,r,n)=>{n=n||{},r=null==r?{}:r;const a=new Event(t,{bubbles:void 0===n.bubbles||n.bubbles,cancelable:Boolean(n.cancelable),composed:void 0===n.composed||n.composed});a.detail=r,e.dispatchEvent(a)})(this,"config-changed",{config:e.detail.value})}static get styles(){return[le,s`
                :host {
                    ${Er}
                }
                :host([dark-mode]) {
                    ${Sr}
                }
                :host {
                    ${Pr}
                    ${Tr}
                }
            `]}};e([Cr({attribute:!1})],on.prototype,"hass",void 0),e([Or()],on.prototype,"config",void 0),on=e([Mr(Fr)],on);var sn=Object.freeze({__proto__:null,get TrashCardEditor(){return on},computeDarkMode:an});export{Ir as TrashCard};
