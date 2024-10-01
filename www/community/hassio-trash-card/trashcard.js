var e="https://github.com/idaho/hassio-trash-card";function t(e,t,r,n){var i,a=arguments.length,s=a<3?t:null===n?n=Object.getOwnPropertyDescriptor(t,r):n;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)s=Reflect.decorate(e,t,r,n);else for(var o=e.length-1;o>=0;o--)(i=e[o])&&(s=(a<3?i(s):a>3?i(t,r,s):i(t,r))||s);return a>3&&s&&Object.defineProperty(t,r,s),s}"function"==typeof SuppressedError&&SuppressedError;const r=e=>`${e.getFullYear()}-${`${e.getMonth()+1}`.padStart(2,"0")}-${`${e.getDate()}`.padStart(2,"0")}`,n=globalThis,i=n.ShadowRoot&&(void 0===n.ShadyCSS||n.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,a=Symbol(),s=new WeakMap;let o=class{constructor(e,t,r){if(this._$cssResult$=!0,r!==a)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=e,this.t=t}get styleSheet(){let e=this.o;const t=this.t;if(i&&void 0===e){const r=void 0!==t&&1===t.length;r&&(e=s.get(t)),void 0===e&&((this.o=e=new CSSStyleSheet).replaceSync(this.cssText),r&&s.set(t,e))}return e}toString(){return this.cssText}};const l=(e,...t)=>{const r=1===e.length?e[0]:t.reduce(((t,r,n)=>t+(e=>{if(!0===e._$cssResult$)return e.cssText;if("number"==typeof e)return e;throw Error("Value passed to 'css' function must be a 'css' function result: "+e+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(r)+e[n+1]),e[0]);return new o(r,e,a)},c=i?e=>e:e=>e instanceof CSSStyleSheet?(e=>{let t="";for(const r of e.cssRules)t+=r.cssText;return(e=>new o("string"==typeof e?e:e+"",void 0,a))(t)})(e):e
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,{is:d,defineProperty:u,getOwnPropertyDescriptor:h,getOwnPropertyNames:m,getOwnPropertySymbols:f,getPrototypeOf:g}=Object,p=globalThis,y=p.trustedTypes,v=y?y.emptyScript:"",b=p.reactiveElementPolyfillSupport,_=(e,t)=>e,w={toAttribute(e,t){switch(t){case Boolean:e=e?v:null;break;case Object:case Array:e=null==e?e:JSON.stringify(e)}return e},fromAttribute(e,t){let r=e;switch(t){case Boolean:r=null!==e;break;case Number:r=null===e?null:Number(e);break;case Object:case Array:try{r=JSON.parse(e)}catch(e){r=null}}return r}},k=(e,t)=>!d(e,t),S={attribute:!0,type:String,converter:w,reflect:!1,hasChanged:k};Symbol.metadata??=Symbol("metadata"),p.litPropertyMetadata??=new WeakMap;class $ extends HTMLElement{static addInitializer(e){this._$Ei(),(this.l??=[]).push(e)}static get observedAttributes(){return this.finalize(),this._$Eh&&[...this._$Eh.keys()]}static createProperty(e,t=S){if(t.state&&(t.attribute=!1),this._$Ei(),this.elementProperties.set(e,t),!t.noAccessor){const r=Symbol(),n=this.getPropertyDescriptor(e,r,t);void 0!==n&&u(this.prototype,e,n)}}static getPropertyDescriptor(e,t,r){const{get:n,set:i}=h(this.prototype,e)??{get(){return this[t]},set(e){this[t]=e}};return{get(){return n?.call(this)},set(t){const a=n?.call(this);i.call(this,t),this.requestUpdate(e,a,r)},configurable:!0,enumerable:!0}}static getPropertyOptions(e){return this.elementProperties.get(e)??S}static _$Ei(){if(this.hasOwnProperty(_("elementProperties")))return;const e=g(this);e.finalize(),void 0!==e.l&&(this.l=[...e.l]),this.elementProperties=new Map(e.elementProperties)}static finalize(){if(this.hasOwnProperty(_("finalized")))return;if(this.finalized=!0,this._$Ei(),this.hasOwnProperty(_("properties"))){const e=this.properties,t=[...m(e),...f(e)];for(const r of t)this.createProperty(r,e[r])}const e=this[Symbol.metadata];if(null!==e){const t=litPropertyMetadata.get(e);if(void 0!==t)for(const[e,r]of t)this.elementProperties.set(e,r)}this._$Eh=new Map;for(const[e,t]of this.elementProperties){const r=this._$Eu(e,t);void 0!==r&&this._$Eh.set(r,e)}this.elementStyles=this.finalizeStyles(this.styles)}static finalizeStyles(e){const t=[];if(Array.isArray(e)){const r=new Set(e.flat(1/0).reverse());for(const e of r)t.unshift(c(e))}else void 0!==e&&t.push(c(e));return t}static _$Eu(e,t){const r=t.attribute;return!1===r?void 0:"string"==typeof r?r:"string"==typeof e?e.toLowerCase():void 0}constructor(){super(),this._$Ep=void 0,this.isUpdatePending=!1,this.hasUpdated=!1,this._$Em=null,this._$Ev()}_$Ev(){this._$ES=new Promise((e=>this.enableUpdating=e)),this._$AL=new Map,this._$E_(),this.requestUpdate(),this.constructor.l?.forEach((e=>e(this)))}addController(e){(this._$EO??=new Set).add(e),void 0!==this.renderRoot&&this.isConnected&&e.hostConnected?.()}removeController(e){this._$EO?.delete(e)}_$E_(){const e=new Map,t=this.constructor.elementProperties;for(const r of t.keys())this.hasOwnProperty(r)&&(e.set(r,this[r]),delete this[r]);e.size>0&&(this._$Ep=e)}createRenderRoot(){const e=this.shadowRoot??this.attachShadow(this.constructor.shadowRootOptions);return((e,t)=>{if(i)e.adoptedStyleSheets=t.map((e=>e instanceof CSSStyleSheet?e:e.styleSheet));else for(const r of t){const t=document.createElement("style"),i=n.litNonce;void 0!==i&&t.setAttribute("nonce",i),t.textContent=r.cssText,e.appendChild(t)}})(e,this.constructor.elementStyles),e}connectedCallback(){this.renderRoot??=this.createRenderRoot(),this.enableUpdating(!0),this._$EO?.forEach((e=>e.hostConnected?.()))}enableUpdating(e){}disconnectedCallback(){this._$EO?.forEach((e=>e.hostDisconnected?.()))}attributeChangedCallback(e,t,r){this._$AK(e,r)}_$EC(e,t){const r=this.constructor.elementProperties.get(e),n=this.constructor._$Eu(e,r);if(void 0!==n&&!0===r.reflect){const i=(void 0!==r.converter?.toAttribute?r.converter:w).toAttribute(t,r.type);this._$Em=e,null==i?this.removeAttribute(n):this.setAttribute(n,i),this._$Em=null}}_$AK(e,t){const r=this.constructor,n=r._$Eh.get(e);if(void 0!==n&&this._$Em!==n){const e=r.getPropertyOptions(n),i="function"==typeof e.converter?{fromAttribute:e.converter}:void 0!==e.converter?.fromAttribute?e.converter:w;this._$Em=n,this[n]=i.fromAttribute(t,e.type),this._$Em=null}}requestUpdate(e,t,r){if(void 0!==e){if(r??=this.constructor.getPropertyOptions(e),!(r.hasChanged??k)(this[e],t))return;this.P(e,t,r)}!1===this.isUpdatePending&&(this._$ES=this._$ET())}P(e,t,r){this._$AL.has(e)||this._$AL.set(e,t),!0===r.reflect&&this._$Em!==e&&(this._$Ej??=new Set).add(e)}async _$ET(){this.isUpdatePending=!0;try{await this._$ES}catch(e){Promise.reject(e)}const e=this.scheduleUpdate();return null!=e&&await e,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){if(!this.isUpdatePending)return;if(!this.hasUpdated){if(this.renderRoot??=this.createRenderRoot(),this._$Ep){for(const[e,t]of this._$Ep)this[e]=t;this._$Ep=void 0}const e=this.constructor.elementProperties;if(e.size>0)for(const[t,r]of e)!0!==r.wrapped||this._$AL.has(t)||void 0===this[t]||this.P(t,this[t],r)}let e=!1;const t=this._$AL;try{e=this.shouldUpdate(t),e?(this.willUpdate(t),this._$EO?.forEach((e=>e.hostUpdate?.())),this.update(t)):this._$EU()}catch(t){throw e=!1,this._$EU(),t}e&&this._$AE(t)}willUpdate(e){}_$AE(e){this._$EO?.forEach((e=>e.hostUpdated?.())),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(e)),this.updated(e)}_$EU(){this._$AL=new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$ES}shouldUpdate(e){return!0}update(e){this._$Ej&&=this._$Ej.forEach((e=>this._$EC(e,this[e]))),this._$EU()}updated(e){}firstUpdated(e){}}$.elementStyles=[],$.shadowRootOptions={mode:"open"},$[_("elementProperties")]=new Map,$[_("finalized")]=new Map,b?.({ReactiveElement:$}),(p.reactiveElementVersions??=[]).push("2.0.4");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const z=globalThis,T=z.trustedTypes,D=T?T.createPolicy("lit-html",{createHTML:e=>e}):void 0,x="$lit$",A=`lit$${Math.random().toFixed(9).slice(2)}$`,E="?"+A,N=`<${E}>`,M=document,O=()=>M.createComment(""),I=e=>null===e||"object"!=typeof e&&"function"!=typeof e,C=Array.isArray,j="[ \t\n\f\r]",R=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,V=/-->/g,L=/>/g,P=RegExp(`>|${j}(?:([^\\s"'>=/]+)(${j}*=${j}*(?:[^ \t\n\f\r"'\`<>=]|("|')|))|$)`,"g"),F=/'/g,U=/"/g,W=/^(?:script|style|textarea|title)$/i,Y=(e=>(t,...r)=>({_$litType$:e,strings:t,values:r}))(1),Z=Symbol.for("lit-noChange"),H=Symbol.for("lit-nothing"),q=new WeakMap,B=M.createTreeWalker(M,129);function J(e,t){if(!C(e)||!e.hasOwnProperty("raw"))throw Error("invalid template strings array");return void 0!==D?D.createHTML(t):t}class G{constructor({strings:e,_$litType$:t},r){let n;this.parts=[];let i=0,a=0;const s=e.length-1,o=this.parts,[l,c]=((e,t)=>{const r=e.length-1,n=[];let i,a=2===t?"<svg>":3===t?"<math>":"",s=R;for(let t=0;t<r;t++){const r=e[t];let o,l,c=-1,d=0;for(;d<r.length&&(s.lastIndex=d,l=s.exec(r),null!==l);)d=s.lastIndex,s===R?"!--"===l[1]?s=V:void 0!==l[1]?s=L:void 0!==l[2]?(W.test(l[2])&&(i=RegExp("</"+l[2],"g")),s=P):void 0!==l[3]&&(s=P):s===P?">"===l[0]?(s=i??R,c=-1):void 0===l[1]?c=-2:(c=s.lastIndex-l[2].length,o=l[1],s=void 0===l[3]?P:'"'===l[3]?U:F):s===U||s===F?s=P:s===V||s===L?s=R:(s=P,i=void 0);const u=s===P&&e[t+1].startsWith("/>")?" ":"";a+=s===R?r+N:c>=0?(n.push(o),r.slice(0,c)+x+r.slice(c)+A+u):r+A+(-2===c?t:u)}return[J(e,a+(e[r]||"<?>")+(2===t?"</svg>":3===t?"</math>":"")),n]})(e,t);if(this.el=G.createElement(l,r),B.currentNode=this.el.content,2===t||3===t){const e=this.el.content.firstChild;e.replaceWith(...e.childNodes)}for(;null!==(n=B.nextNode())&&o.length<s;){if(1===n.nodeType){if(n.hasAttributes())for(const e of n.getAttributeNames())if(e.endsWith(x)){const t=c[a++],r=n.getAttribute(e).split(A),s=/([.?@])?(.*)/.exec(t);o.push({type:1,index:i,name:s[2],strings:r,ctor:"."===s[1]?te:"?"===s[1]?re:"@"===s[1]?ne:ee}),n.removeAttribute(e)}else e.startsWith(A)&&(o.push({type:6,index:i}),n.removeAttribute(e));if(W.test(n.tagName)){const e=n.textContent.split(A),t=e.length-1;if(t>0){n.textContent=T?T.emptyScript:"";for(let r=0;r<t;r++)n.append(e[r],O()),B.nextNode(),o.push({type:2,index:++i});n.append(e[t],O())}}}else if(8===n.nodeType)if(n.data===E)o.push({type:2,index:i});else{let e=-1;for(;-1!==(e=n.data.indexOf(A,e+1));)o.push({type:7,index:i}),e+=A.length-1}i++}}static createElement(e,t){const r=M.createElement("template");return r.innerHTML=e,r}}function K(e,t,r=e,n){if(t===Z)return t;let i=void 0!==n?r.o?.[n]:r.l;const a=I(t)?void 0:t._$litDirective$;return i?.constructor!==a&&(i?._$AO?.(!1),void 0===a?i=void 0:(i=new a(e),i._$AT(e,r,n)),void 0!==n?(r.o??=[])[n]=i:r.l=i),void 0!==i&&(t=K(e,i._$AS(e,t.values),i,n)),t}class Q{constructor(e,t){this._$AV=[],this._$AN=void 0,this._$AD=e,this._$AM=t}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}u(e){const{el:{content:t},parts:r}=this._$AD,n=(e?.creationScope??M).importNode(t,!0);B.currentNode=n;let i=B.nextNode(),a=0,s=0,o=r[0];for(;void 0!==o;){if(a===o.index){let t;2===o.type?t=new X(i,i.nextSibling,this,e):1===o.type?t=new o.ctor(i,o.name,o.strings,this,e):6===o.type&&(t=new ie(i,this,e)),this._$AV.push(t),o=r[++s]}a!==o?.index&&(i=B.nextNode(),a++)}return B.currentNode=M,n}p(e){let t=0;for(const r of this._$AV)void 0!==r&&(void 0!==r.strings?(r._$AI(e,r,t),t+=r.strings.length-2):r._$AI(e[t])),t++}}class X{get _$AU(){return this._$AM?._$AU??this.v}constructor(e,t,r,n){this.type=2,this._$AH=H,this._$AN=void 0,this._$AA=e,this._$AB=t,this._$AM=r,this.options=n,this.v=n?.isConnected??!0}get parentNode(){let e=this._$AA.parentNode;const t=this._$AM;return void 0!==t&&11===e?.nodeType&&(e=t.parentNode),e}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(e,t=this){e=K(this,e,t),I(e)?e===H||null==e||""===e?(this._$AH!==H&&this._$AR(),this._$AH=H):e!==this._$AH&&e!==Z&&this._(e):void 0!==e._$litType$?this.$(e):void 0!==e.nodeType?this.T(e):(e=>C(e)||"function"==typeof e?.[Symbol.iterator])(e)?this.k(e):this._(e)}O(e){return this._$AA.parentNode.insertBefore(e,this._$AB)}T(e){this._$AH!==e&&(this._$AR(),this._$AH=this.O(e))}_(e){this._$AH!==H&&I(this._$AH)?this._$AA.nextSibling.data=e:this.T(M.createTextNode(e)),this._$AH=e}$(e){const{values:t,_$litType$:r}=e,n="number"==typeof r?this._$AC(e):(void 0===r.el&&(r.el=G.createElement(J(r.h,r.h[0]),this.options)),r);if(this._$AH?._$AD===n)this._$AH.p(t);else{const e=new Q(n,this),r=e.u(this.options);e.p(t),this.T(r),this._$AH=e}}_$AC(e){let t=q.get(e.strings);return void 0===t&&q.set(e.strings,t=new G(e)),t}k(e){C(this._$AH)||(this._$AH=[],this._$AR());const t=this._$AH;let r,n=0;for(const i of e)n===t.length?t.push(r=new X(this.O(O()),this.O(O()),this,this.options)):r=t[n],r._$AI(i),n++;n<t.length&&(this._$AR(r&&r._$AB.nextSibling,n),t.length=n)}_$AR(e=this._$AA.nextSibling,t){for(this._$AP?.(!1,!0,t);e&&e!==this._$AB;){const t=e.nextSibling;e.remove(),e=t}}setConnected(e){void 0===this._$AM&&(this.v=e,this._$AP?.(e))}}class ee{get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}constructor(e,t,r,n,i){this.type=1,this._$AH=H,this._$AN=void 0,this.element=e,this.name=t,this._$AM=n,this.options=i,r.length>2||""!==r[0]||""!==r[1]?(this._$AH=Array(r.length-1).fill(new String),this.strings=r):this._$AH=H}_$AI(e,t=this,r,n){const i=this.strings;let a=!1;if(void 0===i)e=K(this,e,t,0),a=!I(e)||e!==this._$AH&&e!==Z,a&&(this._$AH=e);else{const n=e;let s,o;for(e=i[0],s=0;s<i.length-1;s++)o=K(this,n[r+s],t,s),o===Z&&(o=this._$AH[s]),a||=!I(o)||o!==this._$AH[s],o===H?e=H:e!==H&&(e+=(o??"")+i[s+1]),this._$AH[s]=o}a&&!n&&this.j(e)}j(e){e===H?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,e??"")}}class te extends ee{constructor(){super(...arguments),this.type=3}j(e){this.element[this.name]=e===H?void 0:e}}class re extends ee{constructor(){super(...arguments),this.type=4}j(e){this.element.toggleAttribute(this.name,!!e&&e!==H)}}class ne extends ee{constructor(e,t,r,n,i){super(e,t,r,n,i),this.type=5}_$AI(e,t=this){if((e=K(this,e,t,0)??H)===Z)return;const r=this._$AH,n=e===H&&r!==H||e.capture!==r.capture||e.once!==r.once||e.passive!==r.passive,i=e!==H&&(r===H||n);n&&this.element.removeEventListener(this.name,this,r),i&&this.element.addEventListener(this.name,this,e),this._$AH=e}handleEvent(e){"function"==typeof this._$AH?this._$AH.call(this.options?.host??this.element,e):this._$AH.handleEvent(e)}}class ie{constructor(e,t,r){this.element=e,this.type=6,this._$AN=void 0,this._$AM=t,this.options=r}get _$AU(){return this._$AM._$AU}_$AI(e){K(this,e)}}const ae=z.litHtmlPolyfillSupport;ae?.(G,X),(z.litHtmlVersions??=[]).push("3.2.0");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
class se extends ${constructor(){super(...arguments),this.renderOptions={host:this},this.o=void 0}createRenderRoot(){const e=super.createRenderRoot();return this.renderOptions.renderBefore??=e.firstChild,e}update(e){const t=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this.o=((e,t,r)=>{const n=r?.renderBefore??t;let i=n._$litPart$;if(void 0===i){const e=r?.renderBefore??null;n._$litPart$=i=new X(t.insertBefore(O(),e),e,void 0,r??{})}return i._$AI(e),i})(t,this.renderRoot,this.renderOptions)}connectedCallback(){super.connectedCallback(),this.o?.setConnected(!0)}disconnectedCallback(){super.disconnectedCallback(),this.o?.setConnected(!1)}render(){return Z}}se._$litElement$=!0,se.finalized=!0,globalThis.litElementHydrateSupport?.({LitElement:se});const oe=globalThis.litElementPolyfillSupport;oe?.({LitElement:se}),(globalThis.litElementVersions??=[]).push("4.1.0");
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const le=e=>(t,r)=>{void 0!==r?r.addInitializer((()=>{customElements.define(e,t)})):customElements.define(e,t)}
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */,ce={attribute:!0,type:String,converter:w,reflect:!1,hasChanged:k},de=(e=ce,t,r)=>{const{kind:n,metadata:i}=r;let a=globalThis.litPropertyMetadata.get(i);if(void 0===a&&globalThis.litPropertyMetadata.set(i,a=new Map),a.set(r.name,e),"accessor"===n){const{name:n}=r;return{set(r){const i=t.get.call(this);t.set.call(this,r),this.requestUpdate(n,i,e)},init(t){return void 0!==t&&this.P(n,void 0,e),t}}}if("setter"===n){const{name:n}=r;return function(r){const i=this[n];t.call(this,r),this.requestUpdate(n,i,e)}}throw Error("Unsupported decorator location: "+n)};function ue(e){return(t,r)=>"object"==typeof r?de(e,t,r):((e,t,r)=>{const n=t.hasOwnProperty(r);return t.constructor.createProperty(r,n?{...e,wrapped:!0}:e),n?Object.getOwnPropertyDescriptor(t,r):void 0})(e,t,r)}
/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */function he(e){return ue({...e,state:!0,attribute:!1})}const me="trash-card",fe=`${me}-editor`;class ge{constructor(){this.data=[]}reset(){this.data=[]}log(e,t){this.data.push({message:e,data:t})}getLogs(){return this.data}}const pe=(e,t,r)=>r&&e.content.summary?e.content.summary:t.label??e.content.summary??"unknown",ye=(e,t,r)=>({...e,...t,label:pe(e,t,r),type:"custom"===t.type?`custom-${t.idx}`:t.type}),ve=(e,t)=>e.reduce(((e,r)=>{const n=((e,{pattern:t,useSummary:r})=>{if(!e||!("summary"in e.content))return[];const{content:{summary:n}}=e,i=t.map(((e,t)=>({...e,idx:t}))).filter((e=>e.pattern&&n.toLowerCase().includes(e.pattern.toLowerCase())));return i.length>0?i.map((t=>ye(e,t,r))):[ye(e,{...t.find((e=>"others"===e.type)),idx:0},r)]})(r,t);return[...e,...n]}),[]).filter((e=>Boolean(e))),be=(e=new Date)=>{const t=-e.getTimezoneOffset(),r=t%60;return`${t>=0?"+":""}${Number.parseInt(""+t/60,10)<0?`-${(""+-1*Number.parseInt(""+t/60,10)).padStart(2,"0")}`:`${Number.parseInt(""+t/60,10)}`.padStart(2,"0")}:${`${r<0?-1*r:r}`.padStart(2,"0")}`},_e=(e,{config:t,now:n,dropAfter:i,filterFutureEventsDay:a})=>{const s=`${a}T00:00:00${be()}`,o=new Date(s);return e.filter((e=>!(e.date.start>o)&&(e.isWholeDayEvent?e.date.end>n:!(e.date.end<n)))).sort(((e,t)=>e.date.start.getTime()-t.date.start.getTime())).filter((e=>((e,t)=>{if(!t.filter_events)return!0;const r=t.pattern.filter((e=>"others"!==e.type)).map((e=>e.pattern)).filter((e=>void 0!==e));return 0===r.length||r.some((t=>e.content.summary.toLowerCase().includes(t.toLowerCase())))})(e,t)&&(((e,t,n)=>e.isWholeDayEvent&&r(e.date.start)===r(t)&&!n||e.isWholeDayEvent&&r(e.date.start)!==r(t))(e,n,i)||!e.isWholeDayEvent)))},we=async(e,t,{start:r,end:n})=>{const i=`calendars/${t}?start=${r}&end=${n}`;return await e.callApi("GET",i).then((e=>e.map((e=>({...e,entity:t})))))},ke=async(e,t,{start:r,end:n,dropAfter:i},a,s,o)=>{const l=[];for await(const i of t)l.push(...await we(e,i,{start:r,end:n}));a.reset(),a.log("timezone",o),a.log("calendar data",l);const c=((e,t)=>{const r=new Date;r.setUTCHours(0),r.setMinutes(0),r.setSeconds(0),r.setMilliseconds(0);const n=r.toISOString(),i=`${n.slice(n.indexOf("T"),-1)}${t}`;return e.map((e=>({date:{start:new Date("date"in e.start?`${e.start.date}${i}`:e.start.dateTime),end:new Date("date"in e.end?`${e.end.date}${i}`:e.end.dateTime)},isWholeDayEvent:Boolean("date"in e.start),content:{...Object.fromEntries(Object.entries(e).filter((([e])=>!["end","start"].includes(e))))}})))})(l,o);c.sort(((e,t)=>e.date.start.getTime()-t.date.start.getTime()));const d=new Date;a.log("normaliseEvents",c),a.log("dropAfter",i),a.log("now",d);const u=_e(c,{config:{pattern:s.pattern,filter_events:s.filter_events},dropAfter:i,now:d,filterFutureEventsDay:n});a.log("activeElements",u);const h=ve(u,{pattern:s.pattern,useSummary:Boolean(s.use_summary)});return a.log("eventsToItems",h),s.event_grouping?(e=>{const t=new Set([]);return e.filter((e=>{const{type:r}=e;if(t.has(r))return!1;if("others"===r){const{content:r}=e,n=r.recurrence_id??r.summary;return!t.has(n)&&(t.add(n),!0)}return t.add(r),!0}))})(h):h},Se=e=>"settings"in e||"entity"in e,$e=e=>{const t=[],{settings:r,entity:n,...i}=e,a={...i};return"entity"in e&&(a.entities=Array.isArray(n)?n:[n]),"settings"in e?(Object.entries(r).forEach((([e,r])=>{t.push({...r,type:e})})),{...a,pattern:t}):a},ze=1,Te=e=>(...t)=>({_$litDirective$:e,values:t});class De{constructor(e){}get _$AU(){return this._$AM._$AU}_$AT(e,t,r){this.t=e,this._$AM=t,this.i=r}_$AS(e,t){return this.update(e,t)}update(e,t){return this.render(...t)}}
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */const xe="important",Ae=" !"+xe,Ee=Te(class extends De{constructor(e){if(super(e),e.type!==ze||"style"!==e.name||e.strings?.length>2)throw Error("The `styleMap` directive must be used in the `style` attribute and must be the only part in the attribute.")}render(e){return Object.keys(e).reduce(((t,r)=>{const n=e[r];return null==n?t:t+`${r=r.includes("-")?r:r.replace(/(?:^(webkit|moz|ms|o)|)(?=[A-Z])/g,"-$&").toLowerCase()}:${n};`}),"")}update(e,[t]){const{style:r}=e.element;if(void 0===this.ft)return this.ft=new Set(Object.keys(t)),this.render(t);for(const e of this.ft)null==t[e]&&(this.ft.delete(e),e.includes("-")?r.removeProperty(e):r[e]=null);for(const e in t){const n=t[e];if(null!=n){this.ft.add(e);const t="string"==typeof n&&n.endsWith(Ae);e.includes("-")||t?r.setProperty(e,t?n.slice(0,-11):n,t?xe:""):r[e]=n}}return Z}});var Ne={form:{color_picker:{values:{default:"Standardfarve"}},day_style:{title:"Vis begivenheds tid som",values:{default:"Dato",counter:"dage til",weekday:"ugedag",custom:"Brugerdefineret datoformat"}},day_style_format:{title:"Brugerdefineret datoformat",helper:"Definer dit eget datoformat. (dd = dag med foranstillet 0, d = dag, MM = måned med foranstillet 0, M = måned, yy = kort år, yyyy = langt år) F.eks. dd.MM.yyyy = 03.04.2024, hvor d.M.yy = 3.4.24 ville resultere."},card_style:{title:"Vis som",values:{card:"Standardkort",chip:"Chip kort",icon:"Ikon"}},alignment_style:{title:"Justering",values:{left:"venstre",center:"centreret",right:"ret",space:"med afstand"}},color_mode:{title:"Anvend farve til",values:{background:"Baggrund",icon:"Ikon"}},layout_picker:{values:{default:"Standardlayout",vertical:"Vertikalt layout",horizontal:"Horisontalt layout"}},tabs:{settings:"Indstillinger",appearance:"Udseende",patterns:"Mønstre"},refresh_rate:{title:"Opdateringsinterval",helper:"Tjek ændringer i kalenderen hvert x minut"}},card:{generic:{icon_color:"Ikonfarve",layout:"Layout",fill_container:"Fyld container",next_days:"Dage frem i tiden",filter_events:"Filtrer begivenheder efter mønstre",drop_todayevents_from:"Fra hvilken tid skal heldags begivenhed skjules",full_size:"Kort uden margen",use_summary:"Begivenhedssammendrag i stedet for etiket",hide_time_range:"Skjul tid",event_grouping:"Vis kun næste begivenhed pr. mønster",icon_size:"Ikonstørrelse",with_label:"Vis etiket"},trash:{pattern:{title:"Rediger mønster",edit:"rediger",delete:"slet",create:"Opret nyt mønster",new_custom_label:"Nyt mønster",type:{organic:"Organisk",paper:"Papir",recycle:"Genbrug",waste:"Affald",others:"Andre"},fields:{label:"Etiket",color:"Farve",icon:"Ikon",pattern:"Detektions mønster",picture_url:"Billede-URL",picture_url_description:"Hvis en billed-URL er angivet, vises det tilsvarende billede i stedet for ikonet. Placer et billede i mappen `/config/www` og brug `/local/[filnavn]`."}}}}},Me={not_found:"Entitet ikke fundet",trash:{today:"i dag",tomorrow:"i morgen",day:"<DAY>",today_from_till:"I dag\nfra <START> til <END>",tomorrow_from_till:"I morgen\nmellem <START> og <END>",day_from_till:"<DAY>\nmellem <START> og <END>",daysleft:"om <DAYS> dag",daysleft_more:"om <DAYS> dage",daysleft_from_till:"om <DAYS> dag\nmellem <START> og <END>",daysleft_more_from_till:"om <DAYS> dage\nmellem <START> og <END>"}},Oe={editor:Ne,card:Me},Ie={form:{color_picker:{values:{default:"Standard-Farbe"}},day_style:{title:"Ereignis-Zeitpunkt anzeigen als",values:{default:"Datum",counter:"Tage bis",weekday:"Wochentag",custom:"Eigenes Datumsformat"}},day_style_format:{title:"Eigenes Datumsformat",helper:"Definiere ein eigenes Datumsformat. (dd = Tag mit führender 0, d = Tag, MM = Monat mit führender 0, M = Monat, yy = Jahr kurz, yyyy = Jahr lang) | z.B. ergibt dd.MM.yyyy = 03.04.2024, wobei d.M.yy = 3.4.24 ergeben würde."},card_style:{title:"Darstellung",values:{card:"Standard Karte",chip:"Chip Karte",icon:"Icon"}},alignment_style:{title:"Ausrichtung",values:{left:"Linksbündig",center:"Mittig",right:"Rechtsbündig",space:"Mit Abstand"}},color_mode:{title:"Farbe anwenden auf",values:{background:"Hintergrund",icon:"Symbol"}},layout_picker:{values:{default:"Standard Layout",vertical:"Vertikales Layout",horizontal:"Horizontales Layout"}},tabs:{settings:"Einstellungen",appearance:"Darstellung",patterns:"Vorlagen"},refresh_rate:{title:"Aktualisierungsintervall",helper:"Prüfung aller x Minuten auf Änderungen im Kalender."}},card:{generic:{icon_color:"Icon-Farbe",layout:"Layout",fill_container:"Container ausfüllen",next_days:"Tage in der Zukunft",filter_events:"Ereignisse nach Vorlagen filtern",drop_todayevents_from:"Ab wieviel Uhr Ganztages Ereignis ausblenden",full_size:"Karte ohne Seitenrand",use_summary:"Ereignisbezeichnung anstelle des Lables verwenden",hide_time_range:"Uhrzeit ausblenden",event_grouping:"Nur das nächste Ereignis je Vorlage anzeigen",icon_size:"Icongröße",with_label:"Bezeichnung anzeigen"},trash:{pattern:{title:"Vorlage bearbeiten",edit:"bearbeiten",delete:"löschen",create:"Neue Vorlage erstellen",new_custom_label:"Neue Vorlage",type:{organic:"Bio",paper:"Papier",recycle:"Verpackung",waste:"Restmüll",others:"Sonstiges"},fields:{label:"Bezeichnung",color:"Farbe",icon:"Symbol",pattern:"Mustererkennung (z.B. Rest für Restmüll)",picture_url:"Bild-URL",picture_url_description:"Wenn eine Bild-URL angegeben wird, wird das entsprechende Bild anstelle des Icons angezeigt. Lege dazu einfach ein Bild in dem `/config/www` Ordner ab und verwende `/local/[Dateiname]`."}}}}},Ce={not_found:"Entität nicht gefunden",trash:{today:"Heute",tomorrow:"Morgen",day:"<DAY>",today_from_till:"Heute\nvon <START> bis <END>",tomorrow_from_till:"Morgen\nzwischen <START> und <END>",day_from_till:"<DAY>\nzwischen <START> und <END>",daysleft:"in <DAYS> Tag",daysleft_more:"in <DAYS> Tagen",daysleft_from_till:"in <DAYS> Tag\nvon <START> bis <END>",daysleft_more_from_till:"in <DAYS> Tagen\nvon <START> bis <END>"}},je={editor:Ie,card:Ce},Re={form:{color_picker:{values:{default:"Default color"}},day_style:{title:"Show event time as",values:{default:"Date",counter:"days to",weekday:"Day of the week",custom:"Custom date format"}},day_style_format:{title:"Custom date format",helper:"Define your own date format. (dd = day with leading 0, d = day, MM = month with leading 0, M = month, yy = year short, yyyy = year long) E.g. dd.MM.yyyy = 03.04.2024, where d.M.yy = 3.4.24 would result."},card_style:{title:"Display as",values:{card:"Standard card",chip:"Chip card",icon:"Icon"}},alignment_style:{title:"Alignment",values:{left:"left",center:"centered",right:"right",space:"spaced"}},color_mode:{title:"Apply color to",values:{background:"Background",icon:"Icon"}},layout_picker:{values:{default:"Default layout",vertical:"Vertical layout",horizontal:"Horizontal layout"}},tabs:{settings:"Settings",appearance:"Appearance",patterns:"Patterns"},refresh_rate:{title:"Update interval",helper:"Check for changes in the calendar every x minutes"}},card:{generic:{icon_color:"Icon color",layout:"Layout",fill_container:"Fill container",next_days:"Days in the future",filter_events:"Filter events by patterns",drop_todayevents_from:"From what time to hide all-day event",full_size:"Card without margin",use_summary:"Event summary instead of label",hide_time_range:"Hide time",event_grouping:"Only display the next event per pattern",icon_size:"Icon size",with_label:"Show label"},trash:{pattern:{title:"Edit pattern",edit:"edit",delete:"delete",create:"Create new pattern",new_custom_label:"New pattern",type:{organic:"Organic",paper:"Paper",recycle:"Recycle",waste:"Waste",others:"Others"},fields:{label:"Label",color:"Color",icon:"Icon",pattern:"Detection pattern",picture_url:"Picture URL",picture_url_description:"If a picture URL is specified, the corresponding picture is displayed instead of the icon. Place an image in the `/config/www` folder and use `/local/[filename]`."}}}}},Ve={not_found:"Entity not found",trash:{today:"today",tomorrow:"tomorrow",day:"<DAY>",today_from_till:"Today\nfrom <START> to <END>",tomorrow_from_till:"Tomorrow\nbetween <START> and <END>",day_from_till:"<DAY>\nbetween <START> and <END>",daysleft:"in <DAYS> day",daysleft_more:"in <DAYS> days",daysleft_from_till:"in <DAYS> day\nbetween <START> and <END>",daysleft_more_from_till:"in <DAYS> days\nbetween <START> and <END>"}},Le={editor:Re,card:Ve},Pe={form:{color_picker:{values:{default:"Couleur par défaut"}},day_style:{title:"Afficher l'heure de l'événement en tant que",values:{default:"Date",counter:"jours jusqu'à",weekday:"our de la semaine",custom:"Propre format de date"}},day_style_format:{title:"Propre format de date",helper:"Définir un format de date personnalisé. (dd = jour avec 0 en tête, d = jour, MM = mois avec 0 en tête, M = mois, yy = année courte, yyyy = année longue) Par exemple, dd.MM.yyyy = 03.04.2024, où d.M.yy = 3.4.24 donnerait"},card_style:{title:"Représenter comme",values:{card:"carte standard",chip:"carte à puce",icon:"Icône"}},alignment_style:{title:"Alignement",values:{left:"gauche",center:"centré",right:"droit",space:"espacé"}},color_mode:{title:"Appliquer une couleur à",values:{background:"Contexte",icon:"Icône"}},layout_picker:{values:{default:"Disposition par défaut",vertical:"Disposition Verticale",horizontal:"Disposition Horizontale"}},tabs:{settings:"Paramètres",appearance:"Apparence",patterns:"Motifs"},refresh_rate:{title:"Intervalle d'actualisation",helper:"Vérifier les changements dans le calendrier toutes les x minutes."}},card:{generic:{icon_color:"Couleur de l'icône",layout:"Disposition",fill_container:"Remplir le conteneur",next_days:"Jours dans le futur",filter_events:"Filtrer les événements par motifs",drop_todayevents_from:"A partir de quelle heure masquer l'événement de toute la journée ?",full_size:"Carte sans marge",use_summary:"Résumé de l'événement au lieu de l'étiquette",hide_time_range:"cacher le temps",event_grouping:"Afficher uniquement l'événement suivant par modèle",icon_size:"taille de l'icône",with_label:"Afficher l'étiquette"},trash:{pattern:{title:"Modifier le modèle",edit:"Modifier",delete:"Supprimer",create:"Créer un nouveau modèle",new_custom_label:"Nouveau modèle",type:{organic:"Organique",paper:"Papier",recycle:"Recyclage",waste:"Déchets",others:"Autres"},fields:{label:"Étiquette",color:"Couleur",icon:"Icône",pattern:"Modèle de détection",picture_url:"URL de l'image",picture_url_description:"Si une URL d'image est indiquée, l'image correspondante sera affichée au lieu de l'icône. Placez une image dans le dossier `/config/www` et utilisez `/local/[nom de fichier]`"}}}}},Fe={not_found:"Entité introuvable",trash:{today:"Aujourd'hui",tomorrow:"Demain",day:"<DAY>",today_from_till:"Aujourd'hui\nentre <START> et <END>",tomorrow_from_till:"Demain\nentre <START> et <END>",day_from_till:"<DAY>\nentre <START> et <END>",daysleft:"Dans <DAYS> jour",daysleft_more:"Dans <DAYS> jours",daysleft_from_till:"Dans <DAYS> jour\nentre <START> et <END>",daysleft_more_from_till:"Dans <DAYS> jours\nentre <START> et <END>"}},Ue={editor:Pe,card:Fe},We={form:{color_picker:{values:{default:"Alapértelmezett szín"}},day_style:{title:"Esemény idejének megjelenítése mint",values:{default:"Dátum",counter:"nap múlva",weekday:"a hét napja",custom:"Saját dátumformátum"}},day_style_format:{title:"Egyéni dátumformátum",helper:"Saját dátumformátum meghatározása. (dd = nap 0 előtaggal, d = nap, MM = hónap 0 előtaggal, M = hónap, yy = év rövid, yyyy = év hosszú) Pl. dd.MM.yyyy = 03.04.2024, ahol d.M.yy = 3.4.24 lenne az eredmény."},card_style:{title:"Megjelenítés",values:{card:"Standard kártya",chip:"Chipkártya",icon:"Ikon"}},alignment_style:{title:"Kiegyenlítés",values:{left:"balra",center:"központosított",right:"jobbra",space:"spaced"}},color_mode:{title:"Alkalmazza a színt",values:{background:"Háttér",icon:"Ikon"}},layout_picker:{values:{default:"Alapértelmezett elrendezés",vertical:"Függőleges elrendezés",horizontal:"Vízszintes elrendezés"}},tabs:{settings:"Beállítások",appearance:"Kinézet",patterns:"Minták"},refresh_rate:{title:"Aktualizálási időintervallum",helper:"A naptár változásainak ellenőrzése x percenként."}},card:{generic:{icon_color:"Ikon szín",layout:"Elrendezés",fill_container:"Konténer kitöltése",next_days:"Jövőbeli napok száma",filter_events:"Események minta szerinti szűrése",drop_todayevents_from:"Mikortól rejtsük el az egésznapos eseményeket",full_size:"Margó nélküli kártya",use_summary:"Esemény összegzés a cimke helyett",hide_time_range:"Rejtsd el az időt",event_grouping:"Csak a következő eseményt jeleníti meg mintánként",icon_size:"Ikon mérete",with_label:"Címke megjelenítése"},trash:{pattern:{title:"Minta szerkesztése",edit:"szerkeszt",delete:"töröl",create:"Új minta létrehozása",new_custom_label:"Új minta",type:{organic:"Komposztálható",paper:"Papír",recycle:"Újrahasznosítható",waste:"Szemét",others:"Egyéb"},fields:{label:"Cimke",color:"Szín",icon:"Ikon",pattern:"Felismerési minta",picture_url:"Kép URL címe",picture_url_description:"Ha egy kép URL címe van megadva, akkor az ikon helyett a megfelelő kép jelenik meg. Helyezzen el egy képet a `/config/www` mappában, és használja a `/local/[fájlnév]`"}}}}},Ye={not_found:"Entitás nem található",trash:{today:"ma",tomorrow:"holnap",day:"<DAY>",today_from_till:"Ma\n<START>-tól <END>-ig",tomorrow_from_till:"Holnap\n<START> és <END> között",day_from_till:"<DAY>\n<START> és <END> között",daysleft:"<DAYS> napon belül",daysleft_more:"<DAYS> napon belül",daysleft_from_till:"<DAYS> napon belül\n<START> és <END> között",daysleft_more_from_till:"<DAY> napon belül\n<START> és <END> között"}},Ze={editor:We,card:Ye},He={form:{color_picker:{values:{default:"Colore di default"}},day_style:{title:"Mostra la data degli eventi come",values:{default:"Data",counter:"giorni a",weekday:"giorno della settimana",custom:"Formato di data proprio"}},day_style_format:{title:"Formato di data personalizzato",helper:"Definisci il tuo formato di data personalizzato. (dd = giorno con lo 0 iniziale, d = giorno, MM = mese con lo 0 iniziale, M = mese, yy = anno breve, yyyy = anno lungo) Ad esempio dd.MM.yyyy = 03.04.2024, dove d.M.yy = 3.4.24 risulterebbe"},card_style:{title:"Visualizza come",values:{card:"Carta standard",chip:"Carta chip",icon:"Icona"}},alignment_style:{title:"Allineamento",values:{left:"sinistra",center:"centrato",right:"diritto",space:"distanziato"}},color_mode:{title:"Applicare il colore a",values:{background:"Sfondo",icon:"Icona"}},layout_picker:{values:{default:"Layout di default",vertical:"Layout verticale",horizontal:"Layout orizzontala"}},tabs:{settings:"Impostazioni",appearance:"Aspetto",patterns:"Modelli"},refresh_rate:{title:"Intervallo di realizzazione",helper:"Controlla le modifiche al calendario ogni x minuti."}},card:{generic:{icon_color:"Colore icona",layout:"Layout",fill_container:"Riempi il container",next_days:"Giorni nel futuro",filter_events:"Filtra eventi con i pattern",drop_todayevents_from:"Da quale orario nascondere gli eventi di Tutto il giorno",full_size:"Card senza margini",use_summary:"Usa l'oggetto dell'evento al posto dell'etichetta",hide_time_range:"nascondere il tempo",event_grouping:"Visualizza solo l'evento successivo per schema",icon_size:"Dimensione dell'icona",with_label:"Mostra etichetta"},trash:{pattern:{title:"Modifica del modello",edit:"modificare",delete:"cancellare",create:"Crea un nuovo modello",new_custom_label:"Nuovo modello",type:{organic:"Organico",paper:"Carta",recycle:"Plastica",waste:"Indifferenziato",others:"Altro"},fields:{label:"Etichetta",color:"Colore",icon:"Icona",pattern:"Pattern identificazione",picture_url:"URL immagine",picture_url_description:"Se viene specificato un URL dell'immagine, al posto dell'icona viene visualizzata l'immagine corrispondente. Posizionare un'immagine nella cartella `/config/www` e utilizzare `/local/[filename]`."}}}}},qe={not_found:"Entità non trovata",trash:{today:"Oggi",tomorrow:"Domani",day:"<DAY>",today_from_till:"Oggi\nda <START> a <END>",tomorrow_from_till:"Domani\ntra <START> e <END>",day_from_till:"<DAY>\ntra <START> e <END>",daysleft:"entro <DAYS> giorni",daysleft_more:"entro <DAYS> giorni",daysleft_from_till:"entro <DAYS> giorni\ntra <START> e <END>",daysleft_more_from_till:"entro <DAYS> giorni\ntra <START> e <END>"}},Be={editor:He,card:qe},Je={form:{color_picker:{values:{default:"Standaard kleur"}},day_style:{title:"Toon afvalinzamelingtijd als",values:{default:"Datum",counter:"Aftellend",weekday:"Weekdag",custom:"Eigen datumnotatie"}},day_style_format:{title:"Aangepast datumformaat",helper:"Definieer je eigen datumnotatie. (dd = dag met voorloop 0, d = dag, MM = maand met voorloop 0, M = maand, yy = jaar kort, yyyy = jaar lang) Bijv. dd.MM.yyyy = 03.04.2024, waar d.M.yy = 3.4.24 zou resulteren."},card_style:{title:"Weergeven als",values:{card:"Standaard kaart",chip:"Chipkaart",icon:"Icoon"}},alignment_style:{title:"Uitlijning",values:{left:"links",center:"gecentreerd",right:"rechts",space:"verdeeld"}},color_mode:{title:"Kleur aanbrengen op",values:{background:"Achtergrond",icon:"Icoon"}},layout_picker:{values:{default:"Standaard lay-out",vertical:"Verticale lay-out",horizontal:"Horizontale lay-out"}},tabs:{settings:"Instellingen",appearance:"Uiterlijk",patterns:"Patronen"},refresh_rate:{title:"Verversingsinterval",helper:"Controleert elke x minuten op wijzigingen in de kalenderactiviteiten."}},card:{generic:{icon_color:"Icoonkleur",layout:"Lay-out",fill_container:"Vul container",next_days:"Aantal dagen vooruit kijken",filter_events:"Filter kalenderactiviteiten op patronen",drop_todayevents_from:"Tijdstip om afvalinzameling voor die dag te verbergen",full_size:"Kaart zonder marge",use_summary:"Gebruik de samenvatting van de kalenderactiviteit i.p.v. de label",hide_time_range:"Verberg tijd",event_grouping:"Toon per patroon alleen de eerstvolgende afvalinzameling",icon_size:"Icoongrootte",with_label:"Toon label"},trash:{pattern:{title:"Patroon bewerken",edit:"bewerken",delete:"verwijderen",create:"Nieuw patroon aanmaken",new_custom_label:"Nieuw patroon",type:{organic:"GFT",paper:"Papier",recycle:"PMD",waste:"Restafval",others:"Overige"},fields:{label:"Label",color:"Kleur",icon:"Icoon",pattern:"Detectiepatroon",picture_url:"Afbeeldings-URL",picture_url_description:"Als er een afbeeldings-URL is opgegeven, wordt de bijbehorende afbeelding weergegeven in plaats van het icoon. Plaats een afbeelding in de `/config/www` map en gebruik `/local/[bestandsnaam]`."}}}}},Ge={not_found:"Entiteit niet gevonden",trash:{today:"vandaag",tomorrow:"morgen",day:"<DAY>",today_from_till:"Vandaag\nvan <START> tot <END>",tomorrow_from_till:"Morgen\ntussen <START> en <END>",day_from_till:"<DAY>\ntussen <START> en <END>",daysleft:"over <DAYS> dag",daysleft_more:"over <DAYS> dagen",daysleft_from_till:"over <DAYS> dag\ntussen <START> en <END>",daysleft_more_from_till:"over <DAYS> dagen\ntussen <START> en <END>"}},Ke={editor:Je,card:Ge},Qe={form:{color_picker:{values:{default:"Domyślny kolor"}},day_style:{title:"Pokaż czas zdarzenia jako",values:{default:"Data",counter:"dni do",weekday:"dzień tygodnia",custom:"Własny format daty"}},day_style_format:{title:"Niestandardowy format daty",helper:"Zdefiniuj własny format daty. (dd = dzień z początkowym 0, d = dzień, MM = miesiąc z początkowym 0, M = miesiąc, yy = rok krótki, yyyy = rok długi) Np. dd.MM.yyy = 03.04.2024, gdzie d.M.yy = 3.4.24"},card_style:{title:"Wyświetl jako",values:{card:"Karta standardowa",chip:"Karta chipowa",icon:"Symbol"}},alignment_style:{title:"Wyrównanie",values:{left:"lewy",center:"wyśrodkowany",right:"prawo",space:"rozstawiony"}},color_mode:{title:"Zastosuj kolor do",values:{background:"Kontekst",icon:"Symbol"}},layout_picker:{values:{default:"Domyślny układ",vertical:"Pionowy układ",horizontal:"Poziomy układ"}},tabs:{settings:"Ustawienia",appearance:"Wygląd",patterns:"Wzorce"},refresh_rate:{title:"Interwał aktualizacji",helper:"Sprawdzanie zmian w kalendarzu co x minut."}},card:{generic:{icon_color:"Kolor ikony",layout:"Układ",fill_container:"Wypełnij zawartością",next_days:"Ilość dni do przodu",filter_events:"Filtruj zdarzenia według wzorca",drop_todayevents_from:"Od której godziny ukryć wydarzenie całodniowe",full_size:"Karta bez marginesu",use_summary:"Podsumowanie zamiast oznaczenia",hide_time_range:"Ukryj czas",event_grouping:"Wyświetla tylko następne zdarzenie dla wzorca",icon_size:"Rozmiar ikony",with_label:"Pokaż oznaczenie"},trash:{pattern:{title:"Edytuj wzorzec",edit:"edytuj",delete:"usuń",create:"Utwórz nowy wzorzec",new_custom_label:"Nowy wzorzec",type:{organic:"BIO",paper:"Papier",recycle:"Tworzywa",waste:"Zmieszane",others:"Pozostałe"},fields:{label:"Oznaczenie",color:"Kolor",icon:"Ikona",pattern:"Szablon wzorca",picture_url:"Adres URL obrazka",picture_url_description:"Jeśli podano adres URL obrazu, odpowiedni obraz jest wyświetlany zamiast ikony. Umieść obrazek w folderze `/config/www` i użyj `/local/[nazwa_pliku]`."}}}}},Xe={not_found:"Encji nie znaleziono",trash:{today:"dziś",tomorrow:"jutro",day:"<DAY>",today_from_till:"Dziś\nod <START> do <END>",tomorrow_from_till:"Jutro\npomięzdy <START> a <END>",day_from_till:"<DAY>\npomiędzy <START> a <END>",daysleft:"za <DAYS> dzień",daysleft_more:"za <DAYS> dni",daysleft_from_till:"za <DAYS> dni\npomiędzy <START> a <END>",daysleft_more_from_till:"za <DAYS> dni\npomiędzy <START> a <END>"}},et={editor:Qe,card:Xe},tt={form:{color_picker:{values:{default:"Predvolená farba"}},day_style:{title:"Zobraziť čas udalosti ako",values:{default:"Dátum",counter:"dni do",weekday:"deň v týždni",custom:"Vlastný formát dátumu"}},day_style_format:{title:"Vlastný formát dátumu",helper:"Definujte vlastný formát dátumu. (dd = deň s úvodnou 0, d = deň, MM = mesiac s úvodnou 0, M = mesiac, yy = rok krátky, yyyy = rok dlhý) Napr. dd.MM.yyyy = 03.04.2024, kde by výsledkom bolo d.M.yy = 3.4.24."},card_style:{title:"Zobrazenie ako",values:{card:"Štandardná karta",chip:"čipová karta",icon:"Ikona"}},alignment_style:{title:"Zarovnanie",values:{left:"vľavo",center:"vycentrované",right:"vpravo",space:"rozmiestnené"}},color_mode:{title:"Použiť farbu na",values:{background:"Pozadie",icon:"Ikona"}},layout_picker:{values:{default:"Predvolené rozloženie",vertical:"Vertikálne rozloženie",horizontal:"Horizontálne rozloženie"}},tabs:{settings:"Nastavenia",appearance:"Vzhľad",patterns:"Pattern"},refresh_rate:{title:"Interval realizácie",helper:"Kontrola zmien v kalendári každých x minút."}},card:{generic:{icon_color:"Farba ikony",layout:"Rozloženie",fill_container:"Naplňte nádobu",next_days:"Dni v budúcnosti",filter_events:"Filtrovanie udalostí podľa vzorov",drop_todayevents_from:"od akého času sa má skryť celodenná udalosť",full_size:"Karta bez marže",use_summary:"Zhrnutie udalosti namiesto označenia",hide_time_range:"čas skrývania",event_grouping:"Zobrazenie iba nasledujúcej udalosti na vzor",icon_size:"Veľkosť ikony",with_label:"Zobraziť označenie"},trash:{pattern:{title:"Upraviť vzor",edit:"upraviť",delete:"vyma",create:"Vytvoriť nový vzor",new_custom_label:"Nový vzor",type:{organic:"Organický",paper:"Papiera",recycle:"Recyklačný",waste:"Odpadu",others:"Iné"},fields:{label:"štítok",color:"Farba",icon:"Ikona",pattern:"Vzor detekcie",picture_url:"URL obrázku",picture_url_description:"Ak je zadaná adresa URL obrázka, namiesto ikony sa zobrazí príslušný obrázok. Umiestnite obrázok do priečinka `/config/www` a použite `/local/[meno súboru]`."}}}}},rt={not_found:"Entita sa nenašla",trash:{today:"dnes",tomorrow:"zajtra",day:"<DAY>",today_from_till:"Dnes\nod <START> do <END>",tomorrow_from_till:"Zajtra\nod <START> do <END>",day_from_till:"<DAY>\nmedzi <START> a <END>",daysleft:"za <DAYS> dní",daysleft_more:"za <DAYS> dní",daysleft_from_till:"za <DAYS> dní\nmedzi <START> a <END>",daysleft_more_from_till:"za <DAYS> dní\nmedzi <START> a <END>"}},nt={editor:tt,card:rt},it={form:{color_picker:{values:{default:"Privzeta barva"}},day_style:{title:"Prikaži čas dogodka kot",values:{default:"Datum",counter:"dni dno",weekday:"dan v tednu",custom:"Oblika datuma po meri"}},day_style_format:{title:"Oblika datuma po meri",helper:"Določi lastno obliko datuma. (dd = dan z vodilno 0, d = dan, MM = mesec z vodilno 0, M = mesec, yy = kratko leto, llll = dolgo leto) Npr. dd.MM.llll = 03.04.2024, rezultat za oblik od.M.yy pa bi izgledal = 3.4.24."},card_style:{title:"Prikaži kot",values:{card:"Standardna kartica",chip:"Chip kartica",icon:"Ikona"}},alignment_style:{title:"Poravnava",values:{left:"leva",center:"sredinska",right:"desna",space:"s presledki"}},color_mode:{title:"Pobarvaj",values:{background:"Ozadje",icon:"Ikono"}},layout_picker:{values:{default:"Privzeta postavitev",vertical:"Ležeča postavitev",horizontal:"Pokončna postavitev"}},tabs:{settings:"Nastavitve",appearance:"Izgled",patterns:"Vzorci"},refresh_rate:{title:"Interval posodabljanja",helper:"Preverite spremembe v koledarju vsakih x minut"}},card:{generic:{icon_color:"Barva ikone",layout:"Postavitev",fill_container:"Napolni prostor",next_days:"Dnevi v prihodnosti",filter_events:"Filtriraj dogodke po vzorcih",drop_todayevents_from:"Od katere ure dalje naj se skrije celodnevni dogodek",full_size:"Kartica brez roba strani",use_summary:"Povzetek dogodka namesto oznake",hide_time_range:"Skrij čas",event_grouping:"Prikaži samo naslednji dogodek glede na vzorec",icon_size:"Velikost ikone",with_label:"Pokaži oznako"},trash:{pattern:{title:"Uredi vzorec",edit:"uredi",delete:"izbriši",create:"Ustvari nov vzorec",new_custom_label:"Nov vzorec",type:{organic:"Bio odpadki",paper:"Papir",recycle:"Mešana embalaža",waste:"Mešani odpadki",others:"Ostalo"},fields:{label:"Oznaka",color:"Barva",icon:"Ikona",pattern:"Vzorec zaznavanja",picture_url:"URL slike",picture_url_description:"Če je uporabljen URL slike, se namesto ikone prikaže ustrezna slika. Postavite sliko v mapo '/config/www' in uporabite '/local/[ime_datoteke]'."}}}}},at={not_found:"Ne najdem entitete",trash:{today:"danes",tomorrow:"jutri",day:"<DAY>",today_from_till:"Danes\nod <START> do <END>",tomorrow_from_till:"Jutri\nmed <START> in <END>",day_from_till:"<DAY>\nmed <START> in <END>",daysleft:"čez <DAYS> dan",daysleft_more:"čez <DAYS> dni",daysleft_from_till:"čez <DAYS> dan\nmed <START> in <END>",daysleft_more_from_till:"čez <DAYS> dni\nmed <START> in <END>"}},st={editor:it,card:at},ot={form:{color_picker:{values:{default:"Noklusējuma krāsa"}},day_style:{title:"Rādīt notikumu laiku kā",values:{default:"datumu",counter:"dienas līdz",weekday:"nedēļas diena",custom:"pielāgotu datuma formātu"}},day_style_format:{title:"Pielāgots datuma formāts",helper:"Definējiet savu datuma formātu. (dd = diena ar sākuma 0, d = diena, MM = mēnesis ar sākuma 0, M = mēnesis, yy = gads saīsināts, yyyy = gads pilns) Piem. dd.MM.yyyy = 03.04.2024, d.M.yy = 3.4.24"},card_style:{title:"Parādīt kā",values:{card:"Standarta kartiņu",chip:"Chip kartiņu",icon:"Ikonu"}},alignment_style:{title:"Izlīdzināšana",values:{left:"pa kreisi",center:"centrā",right:"pa labi",space:"atdalīts"}},color_mode:{title:"Pielietot krāsu",values:{background:"fonam",icon:"ikonai"}},layout_picker:{values:{default:"Noklusējuma izkārtojums",vertical:"Vertikāls izkārtojums",horizontal:"Horizontāls izkārtojums"}},tabs:{settings:"Iestatījumi",appearance:"Izskats",patterns:"Filtri"},refresh_rate:{title:"Atjaunināšanas intervāls",helper:"Pārbaudīt izmaiņas kalendārā ik pēc x minūtēm"}},card:{generic:{icon_color:"Ikonas krāsa",layout:"Izkārtojums",fill_container:"Piepildīt konteineru",next_days:"Dienas nākotnē",filter_events:"Filtrēt notikumus",drop_todayevents_from:"No kāda laika slēpt visas dienas notikumu",full_size:"Kartiņa bez robežas",use_summary:"Notikuma kopsavilkums, nevis etiķete",hide_time_range:"Paslēpt laiku",event_grouping:"Rādīt tikai nākamo notikumu katram filtram",icon_size:"Ikonas izmērs",with_label:"Rādīt etiķeti"},trash:{pattern:{title:"Labot filtru",edit:"labot",delete:"dzēst",create:"Pievienot filtru",new_custom_label:"Jauns filtrs",type:{organic:"Bioloģiskie",paper:"Iepakojums",recycle:"Stikls",waste:"Atkritumi",others:"Citi"},fields:{label:"Etiķete",color:"Krāsa",icon:"Ikona",pattern:"Notikuma filtrs",picture_url:"Attēla URL",picture_url_description:"Ja ir norādīts attēla URL, ikonas vietā tiek parādīts atbilstošais attēls. Ievietojiet attēlu mapē `/config/www` un izmantojiet `/local/[faila nosaukums]`."}}}}},lt={not_found:"Vienība nav atrasta",trash:{today:"šodien",tomorrow:"rīt",day:"<DAY>",today_from_till:"Šodien\nno <START> līdz <END>",tomorrow_from_till:"Rīt\nno <START> līdz <END>",day_from_till:"<DAY>\nno <START> līdz <END>",daysleft:"pēc <DAYS> dienas",daysleft_more:"pēc <DAYS> dienām",daysleft_from_till:"pēc <DAYS> dienas\nno <START> līdz <END>",daysleft_more_from_till:"pēc <DAYS> dienām\nno <START> līdz <END>"}},ct={editor:ot,card:lt},dt={form:{color_picker:{values:{default:"Standardfärg"}},day_style:{title:"Visa händelsetiden som",values:{default:"Datum",counter:"dagar till",weekday:"veckodag",custom:"Användardefinierat datumformat"}},day_style_format:{title:"Användardefinierat datumformat",helper:"Definera ditt eget datumformat. (dd = dag med inledande 0, d = dag, MM = månad med inledande 0, M = månad, yy = kort år, yyyy = långt år) T.ex. dd.MM.yyyy = 03.04.2024, där d.M.yy = 3.4.24 blir resultatet."},card_style:{title:"Visa som",values:{card:"Standardkort",chip:"Chipkort",icon:"Ikon"}},alignment_style:{title:"Justering",values:{left:"vänster",center:"centrerat",right:"höger",space:"med avstånd"}},color_mode:{title:"Använd färg till",values:{background:"Bakgrund",icon:"Ikon"}},layout_picker:{values:{default:"Standardlayout",vertical:"Vertikal layout",horizontal:"Horisontal layout"}},tabs:{settings:"Inställningar",appearance:"Utseende",patterns:"Mönster"},refresh_rate:{title:"Uppdateringsintervall",helper:"Kolla ändringar i kalendern var x minut"}},card:{generic:{icon_color:"Ikonfärg",layout:"Layout",fill_container:"Full container",next_days:"Dagar fram i tiden",filter_events:"Filtrera händelser efter mönster",drop_todayevents_from:"Från vilken tid ska heldagshändelser gömmas",full_size:"Kort uan marginal",use_summary:"Summering istället för etikett",hide_time_range:"Göm tid",event_grouping:"Visa endast nästa händelse för mönster",icon_size:"Ikonstorlek",with_label:"Visa etikett"},trash:{pattern:{title:"Redigera mönster",edit:"redigera",delete:"ta bort",create:"Skapa nytt mönster",new_custom_label:"Nytt mönster",type:{organic:"Organisk",paper:"Papper",recycle:"Återvinning",waste:"Skräp",others:"Andra"},fields:{label:"Etikett",color:"Färg",icon:"Ikon",pattern:"Detektions mönster",picture_url:"Bild-URL",picture_url_description:"Om en bild-URL är angivet, visas det bilden istället för ikonen. Placera en bild i mappen `/config/www` och använd `/local/[filnamn]`."}}}}},ut={not_found:"Entiteten hittades inte",trash:{today:"idag",tomorrow:"imorgon",day:"<DAY>",today_from_till:"Idag\nfrån <START> till <END>",tomorrow_from_till:"Imorgon\nmellan <START> och <END>",day_from_till:"<DAY>\nmellan <START> och <END>",daysleft:"om <DAYS> dag",daysleft_more:"om <DAYS> dagar",daysleft_from_till:"om <DAYS> dag\nmellan <START> och <END>",daysleft_more_from_till:"om <DAYS> dagar\nmellan <START> och <END>"}},ht={editor:dt,card:ut};const mt={da:Object.freeze({__proto__:null,card:Me,default:Oe,editor:Ne}),de:Object.freeze({__proto__:null,card:Ce,default:je,editor:Ie}),en:Object.freeze({__proto__:null,card:Ve,default:Le,editor:Re}),fr:Object.freeze({__proto__:null,card:Fe,default:Ue,editor:Pe}),hu:Object.freeze({__proto__:null,card:Ye,default:Ze,editor:We}),it:Object.freeze({__proto__:null,card:qe,default:Be,editor:He}),nl:Object.freeze({__proto__:null,card:Ge,default:Ke,editor:Je}),pl:Object.freeze({__proto__:null,card:Xe,default:et,editor:Qe}),sk:Object.freeze({__proto__:null,card:rt,default:nt,editor:tt}),sl:Object.freeze({__proto__:null,card:at,default:st,editor:it}),lv:Object.freeze({__proto__:null,card:lt,default:ct,editor:ot}),se:Object.freeze({__proto__:null,card:ut,default:ht,editor:dt})},ft=(e,t)=>{try{return e.split(".").reduce(((e,t)=>e[t]),mt[t])}catch{return}};function gt(e){return function(t){const r=e?.locale.language??"en";let n=ft(t,r);return n||(n=ft(t,"en")),n??t}}const pt=(e,t)=>{const r=new Date(e.getTime());r.setHours(0),r.setMinutes(0),r.setSeconds(0);const n=new Date(t.date.start.getTime());return n.setHours(0),n.setMinutes(0),n.setSeconds(0),Math.round(Math.abs((r.getTime()-n.getTime())/864e5))};class yt extends Error{}class vt extends yt{constructor(e){super(`Invalid DateTime: ${e.toMessage()}`)}}class bt extends yt{constructor(e){super(`Invalid Interval: ${e.toMessage()}`)}}class _t extends yt{constructor(e){super(`Invalid Duration: ${e.toMessage()}`)}}class wt extends yt{}class kt extends yt{constructor(e){super(`Invalid unit ${e}`)}}class St extends yt{}class $t extends yt{constructor(){super("Zone is an abstract class")}}const zt="numeric",Tt="short",Dt="long",xt={year:zt,month:zt,day:zt},At={year:zt,month:Tt,day:zt},Et={year:zt,month:Tt,day:zt,weekday:Tt},Nt={year:zt,month:Dt,day:zt},Mt={year:zt,month:Dt,day:zt,weekday:Dt},Ot={hour:zt,minute:zt},It={hour:zt,minute:zt,second:zt},Ct={hour:zt,minute:zt,second:zt,timeZoneName:Tt},jt={hour:zt,minute:zt,second:zt,timeZoneName:Dt},Rt={hour:zt,minute:zt,hourCycle:"h23"},Vt={hour:zt,minute:zt,second:zt,hourCycle:"h23"},Lt={hour:zt,minute:zt,second:zt,hourCycle:"h23",timeZoneName:Tt},Pt={hour:zt,minute:zt,second:zt,hourCycle:"h23",timeZoneName:Dt},Ft={year:zt,month:zt,day:zt,hour:zt,minute:zt},Ut={year:zt,month:zt,day:zt,hour:zt,minute:zt,second:zt},Wt={year:zt,month:Tt,day:zt,hour:zt,minute:zt},Yt={year:zt,month:Tt,day:zt,hour:zt,minute:zt,second:zt},Zt={year:zt,month:Tt,day:zt,weekday:Tt,hour:zt,minute:zt},Ht={year:zt,month:Dt,day:zt,hour:zt,minute:zt,timeZoneName:Tt},qt={year:zt,month:Dt,day:zt,hour:zt,minute:zt,second:zt,timeZoneName:Tt},Bt={year:zt,month:Dt,day:zt,weekday:Dt,hour:zt,minute:zt,timeZoneName:Dt},Jt={year:zt,month:Dt,day:zt,weekday:Dt,hour:zt,minute:zt,second:zt,timeZoneName:Dt};class Gt{get type(){throw new $t}get name(){throw new $t}get ianaName(){return this.name}get isUniversal(){throw new $t}offsetName(e,t){throw new $t}formatOffset(e,t){throw new $t}offset(e){throw new $t}equals(e){throw new $t}get isValid(){throw new $t}}let Kt=null;class Qt extends Gt{static get instance(){return null===Kt&&(Kt=new Qt),Kt}get type(){return"system"}get name(){return(new Intl.DateTimeFormat).resolvedOptions().timeZone}get isUniversal(){return!1}offsetName(e,{format:t,locale:r}){return yn(e,t,r)}formatOffset(e,t){return wn(this.offset(e),t)}offset(e){return-new Date(e).getTimezoneOffset()}equals(e){return"system"===e.type}get isValid(){return!0}}let Xt={};const er={year:0,month:1,day:2,era:3,hour:4,minute:5,second:6};let tr={};class rr extends Gt{static create(e){return tr[e]||(tr[e]=new rr(e)),tr[e]}static resetCache(){tr={},Xt={}}static isValidSpecifier(e){return this.isValidZone(e)}static isValidZone(e){if(!e)return!1;try{return new Intl.DateTimeFormat("en-US",{timeZone:e}).format(),!0}catch(e){return!1}}constructor(e){super(),this.zoneName=e,this.valid=rr.isValidZone(e)}get type(){return"iana"}get name(){return this.zoneName}get isUniversal(){return!1}offsetName(e,{format:t,locale:r}){return yn(e,t,r,this.name)}formatOffset(e,t){return wn(this.offset(e),t)}offset(e){const t=new Date(e);if(isNaN(t))return NaN;const r=(n=this.name,Xt[n]||(Xt[n]=new Intl.DateTimeFormat("en-US",{hour12:!1,timeZone:n,year:"numeric",month:"2-digit",day:"2-digit",hour:"2-digit",minute:"2-digit",second:"2-digit",era:"short"})),Xt[n]);var n;let[i,a,s,o,l,c,d]=r.formatToParts?function(e,t){const r=e.formatToParts(t),n=[];for(let e=0;e<r.length;e++){const{type:t,value:i}=r[e],a=er[t];"era"===t?n[a]=i:Jr(a)||(n[a]=parseInt(i,10))}return n}(r,t):function(e,t){const r=e.format(t).replace(/\u200E/g,""),n=/(\d+)\/(\d+)\/(\d+) (AD|BC),? (\d+):(\d+):(\d+)/.exec(r),[,i,a,s,o,l,c,d]=n;return[s,i,a,o,l,c,d]}(r,t);"BC"===o&&(i=1-Math.abs(i));let u=+t;const h=u%1e3;return u-=h>=0?h:1e3+h,(mn({year:i,month:a,day:s,hour:24===l?0:l,minute:c,second:d,millisecond:0})-u)/6e4}equals(e){return"iana"===e.type&&e.name===this.name}get isValid(){return this.valid}}let nr={};let ir={};function ar(e,t={}){const r=JSON.stringify([e,t]);let n=ir[r];return n||(n=new Intl.DateTimeFormat(e,t),ir[r]=n),n}let sr={};let or={};let lr=null;let cr={};function dr(e,t,r,n){const i=e.listingMode();return"error"===i?null:"en"===i?r(t):n(t)}class ur{constructor(e,t,r){this.padTo=r.padTo||0,this.floor=r.floor||!1;const{padTo:n,floor:i,...a}=r;if(!t||Object.keys(a).length>0){const t={useGrouping:!1,...r};r.padTo>0&&(t.minimumIntegerDigits=r.padTo),this.inf=function(e,t={}){const r=JSON.stringify([e,t]);let n=sr[r];return n||(n=new Intl.NumberFormat(e,t),sr[r]=n),n}(e,t)}}format(e){if(this.inf){const t=this.floor?Math.floor(e):e;return this.inf.format(t)}return an(this.floor?Math.floor(e):cn(e,3),this.padTo)}}class hr{constructor(e,t,r){let n;if(this.opts=r,this.originalZone=void 0,this.opts.timeZone)this.dt=e;else if("fixed"===e.zone.type){const t=e.offset/60*-1,r=t>=0?`Etc/GMT+${t}`:`Etc/GMT${t}`;0!==e.offset&&rr.create(r).valid?(n=r,this.dt=e):(n="UTC",this.dt=0===e.offset?e:e.setZone("UTC").plus({minutes:e.offset}),this.originalZone=e.zone)}else"system"===e.zone.type?this.dt=e:"iana"===e.zone.type?(this.dt=e,n=e.zone.name):(n="UTC",this.dt=e.setZone("UTC").plus({minutes:e.offset}),this.originalZone=e.zone);const i={...this.opts};i.timeZone=i.timeZone||n,this.dtf=ar(t,i)}format(){return this.originalZone?this.formatToParts().map((({value:e})=>e)).join(""):this.dtf.format(this.dt.toJSDate())}formatToParts(){const e=this.dtf.formatToParts(this.dt.toJSDate());return this.originalZone?e.map((e=>{if("timeZoneName"===e.type){const t=this.originalZone.offsetName(this.dt.ts,{locale:this.dt.locale,format:this.opts.timeZoneName});return{...e,value:t}}return e})):e}resolvedOptions(){return this.dtf.resolvedOptions()}}class mr{constructor(e,t,r){this.opts={style:"long",...r},!t&&Qr()&&(this.rtf=function(e,t={}){const{base:r,...n}=t,i=JSON.stringify([e,n]);let a=or[i];return a||(a=new Intl.RelativeTimeFormat(e,t),or[i]=a),a}(e,r))}format(e,t){return this.rtf?this.rtf.format(e,t):function(e,t,r="always",n=!1){const i={years:["year","yr."],quarters:["quarter","qtr."],months:["month","mo."],weeks:["week","wk."],days:["day","day","days"],hours:["hour","hr."],minutes:["minute","min."],seconds:["second","sec."]},a=-1===["hours","minutes","seconds"].indexOf(e);if("auto"===r&&a){const r="days"===e;switch(t){case 1:return r?"tomorrow":`next ${i[e][0]}`;case-1:return r?"yesterday":`last ${i[e][0]}`;case 0:return r?"today":`this ${i[e][0]}`}}const s=Object.is(t,-0)||t<0,o=Math.abs(t),l=1===o,c=i[e],d=n?l?c[1]:c[2]||c[1]:l?i[e][0]:e;return s?`${o} ${d} ago`:`in ${o} ${d}`}(t,e,this.opts.numeric,"long"!==this.opts.style)}formatToParts(e,t){return this.rtf?this.rtf.formatToParts(e,t):[]}}const fr={firstDay:1,minimalDays:4,weekend:[6,7]};class gr{static fromOpts(e){return gr.create(e.locale,e.numberingSystem,e.outputCalendar,e.weekSettings,e.defaultToEN)}static create(e,t,r,n,i=!1){const a=e||Or.defaultLocale,s=a||(i?"en-US":lr||(lr=(new Intl.DateTimeFormat).resolvedOptions().locale,lr)),o=t||Or.defaultNumberingSystem,l=r||Or.defaultOutputCalendar,c=rn(n)||Or.defaultWeekSettings;return new gr(s,o,l,c,a)}static resetCache(){lr=null,ir={},sr={},or={}}static fromObject({locale:e,numberingSystem:t,outputCalendar:r,weekSettings:n}={}){return gr.create(e,t,r,n)}constructor(e,t,r,n,i){const[a,s,o]=function(e){const t=e.indexOf("-x-");-1!==t&&(e=e.substring(0,t));const r=e.indexOf("-u-");if(-1===r)return[e];{let t,n;try{t=ar(e).resolvedOptions(),n=e}catch(i){const a=e.substring(0,r);t=ar(a).resolvedOptions(),n=a}const{numberingSystem:i,calendar:a}=t;return[n,i,a]}}(e);this.locale=a,this.numberingSystem=t||s||null,this.outputCalendar=r||o||null,this.weekSettings=n,this.intl=function(e,t,r){return r||t?(e.includes("-u-")||(e+="-u"),r&&(e+=`-ca-${r}`),t&&(e+=`-nu-${t}`),e):e}(this.locale,this.numberingSystem,this.outputCalendar),this.weekdaysCache={format:{},standalone:{}},this.monthsCache={format:{},standalone:{}},this.meridiemCache=null,this.eraCache={},this.specifiedLocale=i,this.fastNumbersCached=null}get fastNumbers(){var e;return null==this.fastNumbersCached&&(this.fastNumbersCached=(!(e=this).numberingSystem||"latn"===e.numberingSystem)&&("latn"===e.numberingSystem||!e.locale||e.locale.startsWith("en")||"latn"===new Intl.DateTimeFormat(e.intl).resolvedOptions().numberingSystem)),this.fastNumbersCached}listingMode(){const e=this.isEnglish(),t=!(null!==this.numberingSystem&&"latn"!==this.numberingSystem||null!==this.outputCalendar&&"gregory"!==this.outputCalendar);return e&&t?"en":"intl"}clone(e){return e&&0!==Object.getOwnPropertyNames(e).length?gr.create(e.locale||this.specifiedLocale,e.numberingSystem||this.numberingSystem,e.outputCalendar||this.outputCalendar,rn(e.weekSettings)||this.weekSettings,e.defaultToEN||!1):this}redefaultToEN(e={}){return this.clone({...e,defaultToEN:!0})}redefaultToSystem(e={}){return this.clone({...e,defaultToEN:!1})}months(e,t=!1){return dr(this,e,Tn,(()=>{const r=t?{month:e,day:"numeric"}:{month:e},n=t?"format":"standalone";return this.monthsCache[n][e]||(this.monthsCache[n][e]=function(e){const t=[];for(let r=1;r<=12;r++){const n=Aa.utc(2009,r,1);t.push(e(n))}return t}((e=>this.extract(e,r,"month")))),this.monthsCache[n][e]}))}weekdays(e,t=!1){return dr(this,e,En,(()=>{const r=t?{weekday:e,year:"numeric",month:"long",day:"numeric"}:{weekday:e},n=t?"format":"standalone";return this.weekdaysCache[n][e]||(this.weekdaysCache[n][e]=function(e){const t=[];for(let r=1;r<=7;r++){const n=Aa.utc(2016,11,13+r);t.push(e(n))}return t}((e=>this.extract(e,r,"weekday")))),this.weekdaysCache[n][e]}))}meridiems(){return dr(this,void 0,(()=>Nn),(()=>{if(!this.meridiemCache){const e={hour:"numeric",hourCycle:"h12"};this.meridiemCache=[Aa.utc(2016,11,13,9),Aa.utc(2016,11,13,19)].map((t=>this.extract(t,e,"dayperiod")))}return this.meridiemCache}))}eras(e){return dr(this,e,Cn,(()=>{const t={era:e};return this.eraCache[e]||(this.eraCache[e]=[Aa.utc(-40,1,1),Aa.utc(2017,1,1)].map((e=>this.extract(e,t,"era")))),this.eraCache[e]}))}extract(e,t,r){const n=this.dtFormatter(e,t).formatToParts().find((e=>e.type.toLowerCase()===r));return n?n.value:null}numberFormatter(e={}){return new ur(this.intl,e.forceSimple||this.fastNumbers,e)}dtFormatter(e,t={}){return new hr(e,this.intl,t)}relFormatter(e={}){return new mr(this.intl,this.isEnglish(),e)}listFormatter(e={}){return function(e,t={}){const r=JSON.stringify([e,t]);let n=nr[r];return n||(n=new Intl.ListFormat(e,t),nr[r]=n),n}(this.intl,e)}isEnglish(){return"en"===this.locale||"en-us"===this.locale.toLowerCase()||new Intl.DateTimeFormat(this.intl).resolvedOptions().locale.startsWith("en-us")}getWeekSettings(){return this.weekSettings?this.weekSettings:Xr()?function(e){let t=cr[e];if(!t){const r=new Intl.Locale(e);t="getWeekInfo"in r?r.getWeekInfo():r.weekInfo,cr[e]=t}return t}(this.locale):fr}getStartOfWeek(){return this.getWeekSettings().firstDay}getMinDaysInFirstWeek(){return this.getWeekSettings().minimalDays}getWeekendDays(){return this.getWeekSettings().weekend}equals(e){return this.locale===e.locale&&this.numberingSystem===e.numberingSystem&&this.outputCalendar===e.outputCalendar}toString(){return`Locale(${this.locale}, ${this.numberingSystem}, ${this.outputCalendar})`}}let pr=null;class yr extends Gt{static get utcInstance(){return null===pr&&(pr=new yr(0)),pr}static instance(e){return 0===e?yr.utcInstance:new yr(e)}static parseSpecifier(e){if(e){const t=e.match(/^utc(?:([+-]\d{1,2})(?::(\d{2}))?)?$/i);if(t)return new yr(vn(t[1],t[2]))}return null}constructor(e){super(),this.fixed=e}get type(){return"fixed"}get name(){return 0===this.fixed?"UTC":`UTC${wn(this.fixed,"narrow")}`}get ianaName(){return 0===this.fixed?"Etc/UTC":`Etc/GMT${wn(-this.fixed,"narrow")}`}offsetName(){return this.name}formatOffset(e,t){return wn(this.fixed,t)}get isUniversal(){return!0}offset(){return this.fixed}equals(e){return"fixed"===e.type&&e.fixed===this.fixed}get isValid(){return!0}}class vr extends Gt{constructor(e){super(),this.zoneName=e}get type(){return"invalid"}get name(){return this.zoneName}get isUniversal(){return!1}offsetName(){return null}formatOffset(){return""}offset(){return NaN}equals(){return!1}get isValid(){return!1}}function br(e,t){if(Jr(e)||null===e)return t;if(e instanceof Gt)return e;if(function(e){return"string"==typeof e}(e)){const r=e.toLowerCase();return"default"===r?t:"local"===r||"system"===r?Qt.instance:"utc"===r||"gmt"===r?yr.utcInstance:yr.parseSpecifier(r)||rr.create(e)}return Gr(e)?yr.instance(e):"object"==typeof e&&"offset"in e&&"function"==typeof e.offset?e:new vr(e)}const _r={arab:"[٠-٩]",arabext:"[۰-۹]",bali:"[᭐-᭙]",beng:"[০-৯]",deva:"[०-९]",fullwide:"[０-９]",gujr:"[૦-૯]",hanidec:"[〇|一|二|三|四|五|六|七|八|九]",khmr:"[០-៩]",knda:"[೦-೯]",laoo:"[໐-໙]",limb:"[᥆-᥏]",mlym:"[൦-൯]",mong:"[᠐-᠙]",mymr:"[၀-၉]",orya:"[୦-୯]",tamldec:"[௦-௯]",telu:"[౦-౯]",thai:"[๐-๙]",tibt:"[༠-༩]",latn:"\\d"},wr={arab:[1632,1641],arabext:[1776,1785],bali:[6992,7001],beng:[2534,2543],deva:[2406,2415],fullwide:[65296,65303],gujr:[2790,2799],khmr:[6112,6121],knda:[3302,3311],laoo:[3792,3801],limb:[6470,6479],mlym:[3430,3439],mong:[6160,6169],mymr:[4160,4169],orya:[2918,2927],tamldec:[3046,3055],telu:[3174,3183],thai:[3664,3673],tibt:[3872,3881]},kr=_r.hanidec.replace(/[\[|\]]/g,"").split("");let Sr={};function $r({numberingSystem:e},t=""){const r=e||"latn";return Sr[r]||(Sr[r]={}),Sr[r][t]||(Sr[r][t]=new RegExp(`${_r[r]}${t}`)),Sr[r][t]}let zr,Tr=()=>Date.now(),Dr="system",xr=null,Ar=null,Er=null,Nr=60,Mr=null;class Or{static get now(){return Tr}static set now(e){Tr=e}static set defaultZone(e){Dr=e}static get defaultZone(){return br(Dr,Qt.instance)}static get defaultLocale(){return xr}static set defaultLocale(e){xr=e}static get defaultNumberingSystem(){return Ar}static set defaultNumberingSystem(e){Ar=e}static get defaultOutputCalendar(){return Er}static set defaultOutputCalendar(e){Er=e}static get defaultWeekSettings(){return Mr}static set defaultWeekSettings(e){Mr=rn(e)}static get twoDigitCutoffYear(){return Nr}static set twoDigitCutoffYear(e){Nr=e%100}static get throwOnInvalid(){return zr}static set throwOnInvalid(e){zr=e}static resetCaches(){gr.resetCache(),rr.resetCache(),Aa.resetCache(),Sr={}}}class Ir{constructor(e,t){this.reason=e,this.explanation=t}toMessage(){return this.explanation?`${this.reason}: ${this.explanation}`:this.reason}}const Cr=[0,31,59,90,120,151,181,212,243,273,304,334],jr=[0,31,60,91,121,152,182,213,244,274,305,335];function Rr(e,t){return new Ir("unit out of range",`you specified ${t} (of type ${typeof t}) as a ${e}, which is invalid`)}function Vr(e,t,r){const n=new Date(Date.UTC(e,t-1,r));e<100&&e>=0&&n.setUTCFullYear(n.getUTCFullYear()-1900);const i=n.getUTCDay();return 0===i?7:i}function Lr(e,t,r){return r+(dn(e)?jr:Cr)[t-1]}function Pr(e,t){const r=dn(e)?jr:Cr,n=r.findIndex((e=>e<t));return{month:n+1,day:t-r[n]}}function Fr(e,t){return(e-t+7)%7+1}function Ur(e,t=4,r=1){const{year:n,month:i,day:a}=e,s=Lr(n,i,a),o=Fr(Vr(n,i,a),r);let l,c=Math.floor((s-o+14-t)/7);return c<1?(l=n-1,c=gn(l,t,r)):c>gn(n,t,r)?(l=n+1,c=1):l=n,{weekYear:l,weekNumber:c,weekday:o,...kn(e)}}function Wr(e,t=4,r=1){const{weekYear:n,weekNumber:i,weekday:a}=e,s=Fr(Vr(n,1,t),r),o=un(n);let l,c=7*i+a-s-7+t;c<1?(l=n-1,c+=un(l)):c>o?(l=n+1,c-=un(n)):l=n;const{month:d,day:u}=Pr(l,c);return{year:l,month:d,day:u,...kn(e)}}function Yr(e){const{year:t,month:r,day:n}=e;return{year:t,ordinal:Lr(t,r,n),...kn(e)}}function Zr(e){const{year:t,ordinal:r}=e,{month:n,day:i}=Pr(t,r);return{year:t,month:n,day:i,...kn(e)}}function Hr(e,t){if(!Jr(e.localWeekday)||!Jr(e.localWeekNumber)||!Jr(e.localWeekYear)){if(!Jr(e.weekday)||!Jr(e.weekNumber)||!Jr(e.weekYear))throw new wt("Cannot mix locale-based week fields with ISO-based week fields");return Jr(e.localWeekday)||(e.weekday=e.localWeekday),Jr(e.localWeekNumber)||(e.weekNumber=e.localWeekNumber),Jr(e.localWeekYear)||(e.weekYear=e.localWeekYear),delete e.localWeekday,delete e.localWeekNumber,delete e.localWeekYear,{minDaysInFirstWeek:t.getMinDaysInFirstWeek(),startOfWeek:t.getStartOfWeek()}}return{minDaysInFirstWeek:4,startOfWeek:1}}function qr(e){const t=Kr(e.year),r=nn(e.month,1,12),n=nn(e.day,1,hn(e.year,e.month));return t?r?!n&&Rr("day",e.day):Rr("month",e.month):Rr("year",e.year)}function Br(e){const{hour:t,minute:r,second:n,millisecond:i}=e,a=nn(t,0,23)||24===t&&0===r&&0===n&&0===i,s=nn(r,0,59),o=nn(n,0,59),l=nn(i,0,999);return a?s?o?!l&&Rr("millisecond",i):Rr("second",n):Rr("minute",r):Rr("hour",t)}function Jr(e){return void 0===e}function Gr(e){return"number"==typeof e}function Kr(e){return"number"==typeof e&&e%1==0}function Qr(){try{return"undefined"!=typeof Intl&&!!Intl.RelativeTimeFormat}catch(e){return!1}}function Xr(){try{return"undefined"!=typeof Intl&&!!Intl.Locale&&("weekInfo"in Intl.Locale.prototype||"getWeekInfo"in Intl.Locale.prototype)}catch(e){return!1}}function en(e,t,r){if(0!==e.length)return e.reduce(((e,n)=>{const i=[t(n),n];return e&&r(e[0],i[0])===e[0]?e:i}),null)[1]}function tn(e,t){return Object.prototype.hasOwnProperty.call(e,t)}function rn(e){if(null==e)return null;if("object"!=typeof e)throw new St("Week settings must be an object");if(!nn(e.firstDay,1,7)||!nn(e.minimalDays,1,7)||!Array.isArray(e.weekend)||e.weekend.some((e=>!nn(e,1,7))))throw new St("Invalid week settings");return{firstDay:e.firstDay,minimalDays:e.minimalDays,weekend:Array.from(e.weekend)}}function nn(e,t,r){return Kr(e)&&e>=t&&e<=r}function an(e,t=2){let r;return r=e<0?"-"+(""+-e).padStart(t,"0"):(""+e).padStart(t,"0"),r}function sn(e){return Jr(e)||null===e||""===e?void 0:parseInt(e,10)}function on(e){return Jr(e)||null===e||""===e?void 0:parseFloat(e)}function ln(e){if(!Jr(e)&&null!==e&&""!==e){const t=1e3*parseFloat("0."+e);return Math.floor(t)}}function cn(e,t,r=!1){const n=10**t;return(r?Math.trunc:Math.round)(e*n)/n}function dn(e){return e%4==0&&(e%100!=0||e%400==0)}function un(e){return dn(e)?366:365}function hn(e,t){const r=function(e,t){return e-t*Math.floor(e/t)}(t-1,12)+1;return 2===r?dn(e+(t-r)/12)?29:28:[31,null,31,30,31,30,31,31,30,31,30,31][r-1]}function mn(e){let t=Date.UTC(e.year,e.month-1,e.day,e.hour,e.minute,e.second,e.millisecond);return e.year<100&&e.year>=0&&(t=new Date(t),t.setUTCFullYear(e.year,e.month-1,e.day)),+t}function fn(e,t,r){return-Fr(Vr(e,1,t),r)+t-1}function gn(e,t=4,r=1){const n=fn(e,t,r),i=fn(e+1,t,r);return(un(e)-n+i)/7}function pn(e){return e>99?e:e>Or.twoDigitCutoffYear?1900+e:2e3+e}function yn(e,t,r,n=null){const i=new Date(e),a={hourCycle:"h23",year:"numeric",month:"2-digit",day:"2-digit",hour:"2-digit",minute:"2-digit"};n&&(a.timeZone=n);const s={timeZoneName:t,...a},o=new Intl.DateTimeFormat(r,s).formatToParts(i).find((e=>"timezonename"===e.type.toLowerCase()));return o?o.value:null}function vn(e,t){let r=parseInt(e,10);Number.isNaN(r)&&(r=0);const n=parseInt(t,10)||0;return 60*r+(r<0||Object.is(r,-0)?-n:n)}function bn(e){const t=Number(e);if("boolean"==typeof e||""===e||Number.isNaN(t))throw new St(`Invalid unit value ${e}`);return t}function _n(e,t){const r={};for(const n in e)if(tn(e,n)){const i=e[n];if(null==i)continue;r[t(n)]=bn(i)}return r}function wn(e,t){const r=Math.trunc(Math.abs(e/60)),n=Math.trunc(Math.abs(e%60)),i=e>=0?"+":"-";switch(t){case"short":return`${i}${an(r,2)}:${an(n,2)}`;case"narrow":return`${i}${r}${n>0?`:${n}`:""}`;case"techie":return`${i}${an(r,2)}${an(n,2)}`;default:throw new RangeError(`Value format ${t} is out of range for property format`)}}function kn(e){return function(e,t){return t.reduce(((t,r)=>(t[r]=e[r],t)),{})}(e,["hour","minute","second","millisecond"])}const Sn=["January","February","March","April","May","June","July","August","September","October","November","December"],$n=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],zn=["J","F","M","A","M","J","J","A","S","O","N","D"];function Tn(e){switch(e){case"narrow":return[...zn];case"short":return[...$n];case"long":return[...Sn];case"numeric":return["1","2","3","4","5","6","7","8","9","10","11","12"];case"2-digit":return["01","02","03","04","05","06","07","08","09","10","11","12"];default:return null}}const Dn=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],xn=["Mon","Tue","Wed","Thu","Fri","Sat","Sun"],An=["M","T","W","T","F","S","S"];function En(e){switch(e){case"narrow":return[...An];case"short":return[...xn];case"long":return[...Dn];case"numeric":return["1","2","3","4","5","6","7"];default:return null}}const Nn=["AM","PM"],Mn=["Before Christ","Anno Domini"],On=["BC","AD"],In=["B","A"];function Cn(e){switch(e){case"narrow":return[...In];case"short":return[...On];case"long":return[...Mn];default:return null}}function jn(e,t){let r="";for(const n of e)n.literal?r+=n.val:r+=t(n.val);return r}const Rn={D:xt,DD:At,DDD:Nt,DDDD:Mt,t:Ot,tt:It,ttt:Ct,tttt:jt,T:Rt,TT:Vt,TTT:Lt,TTTT:Pt,f:Ft,ff:Wt,fff:Ht,ffff:Bt,F:Ut,FF:Yt,FFF:qt,FFFF:Jt};class Vn{static create(e,t={}){return new Vn(e,t)}static parseFormat(e){let t=null,r="",n=!1;const i=[];for(let a=0;a<e.length;a++){const s=e.charAt(a);"'"===s?(r.length>0&&i.push({literal:n||/^\s+$/.test(r),val:r}),t=null,r="",n=!n):n||s===t?r+=s:(r.length>0&&i.push({literal:/^\s+$/.test(r),val:r}),r=s,t=s)}return r.length>0&&i.push({literal:n||/^\s+$/.test(r),val:r}),i}static macroTokenToFormatOpts(e){return Rn[e]}constructor(e,t){this.opts=t,this.loc=e,this.systemLoc=null}formatWithSystemDefault(e,t){null===this.systemLoc&&(this.systemLoc=this.loc.redefaultToSystem());return this.systemLoc.dtFormatter(e,{...this.opts,...t}).format()}dtFormatter(e,t={}){return this.loc.dtFormatter(e,{...this.opts,...t})}formatDateTime(e,t){return this.dtFormatter(e,t).format()}formatDateTimeParts(e,t){return this.dtFormatter(e,t).formatToParts()}formatInterval(e,t){return this.dtFormatter(e.start,t).dtf.formatRange(e.start.toJSDate(),e.end.toJSDate())}resolvedOptions(e,t){return this.dtFormatter(e,t).resolvedOptions()}num(e,t=0){if(this.opts.forceSimple)return an(e,t);const r={...this.opts};return t>0&&(r.padTo=t),this.loc.numberFormatter(r).format(e)}formatDateTimeFromString(e,t){const r="en"===this.loc.listingMode(),n=this.loc.outputCalendar&&"gregory"!==this.loc.outputCalendar,i=(t,r)=>this.loc.extract(e,t,r),a=t=>e.isOffsetFixed&&0===e.offset&&t.allowZ?"Z":e.isValid?e.zone.formatOffset(e.ts,t.format):"",s=()=>r?function(e){return Nn[e.hour<12?0:1]}(e):i({hour:"numeric",hourCycle:"h12"},"dayperiod"),o=(t,n)=>r?function(e,t){return Tn(t)[e.month-1]}(e,t):i(n?{month:t}:{month:t,day:"numeric"},"month"),l=(t,n)=>r?function(e,t){return En(t)[e.weekday-1]}(e,t):i(n?{weekday:t}:{weekday:t,month:"long",day:"numeric"},"weekday"),c=t=>{const r=Vn.macroTokenToFormatOpts(t);return r?this.formatWithSystemDefault(e,r):t},d=t=>r?function(e,t){return Cn(t)[e.year<0?0:1]}(e,t):i({era:t},"era");return jn(Vn.parseFormat(t),(t=>{switch(t){case"S":return this.num(e.millisecond);case"u":case"SSS":return this.num(e.millisecond,3);case"s":return this.num(e.second);case"ss":return this.num(e.second,2);case"uu":return this.num(Math.floor(e.millisecond/10),2);case"uuu":return this.num(Math.floor(e.millisecond/100));case"m":return this.num(e.minute);case"mm":return this.num(e.minute,2);case"h":return this.num(e.hour%12==0?12:e.hour%12);case"hh":return this.num(e.hour%12==0?12:e.hour%12,2);case"H":return this.num(e.hour);case"HH":return this.num(e.hour,2);case"Z":return a({format:"narrow",allowZ:this.opts.allowZ});case"ZZ":return a({format:"short",allowZ:this.opts.allowZ});case"ZZZ":return a({format:"techie",allowZ:this.opts.allowZ});case"ZZZZ":return e.zone.offsetName(e.ts,{format:"short",locale:this.loc.locale});case"ZZZZZ":return e.zone.offsetName(e.ts,{format:"long",locale:this.loc.locale});case"z":return e.zoneName;case"a":return s();case"d":return n?i({day:"numeric"},"day"):this.num(e.day);case"dd":return n?i({day:"2-digit"},"day"):this.num(e.day,2);case"c":case"E":return this.num(e.weekday);case"ccc":return l("short",!0);case"cccc":return l("long",!0);case"ccccc":return l("narrow",!0);case"EEE":return l("short",!1);case"EEEE":return l("long",!1);case"EEEEE":return l("narrow",!1);case"L":return n?i({month:"numeric",day:"numeric"},"month"):this.num(e.month);case"LL":return n?i({month:"2-digit",day:"numeric"},"month"):this.num(e.month,2);case"LLL":return o("short",!0);case"LLLL":return o("long",!0);case"LLLLL":return o("narrow",!0);case"M":return n?i({month:"numeric"},"month"):this.num(e.month);case"MM":return n?i({month:"2-digit"},"month"):this.num(e.month,2);case"MMM":return o("short",!1);case"MMMM":return o("long",!1);case"MMMMM":return o("narrow",!1);case"y":return n?i({year:"numeric"},"year"):this.num(e.year);case"yy":return n?i({year:"2-digit"},"year"):this.num(e.year.toString().slice(-2),2);case"yyyy":return n?i({year:"numeric"},"year"):this.num(e.year,4);case"yyyyyy":return n?i({year:"numeric"},"year"):this.num(e.year,6);case"G":return d("short");case"GG":return d("long");case"GGGGG":return d("narrow");case"kk":return this.num(e.weekYear.toString().slice(-2),2);case"kkkk":return this.num(e.weekYear,4);case"W":return this.num(e.weekNumber);case"WW":return this.num(e.weekNumber,2);case"n":return this.num(e.localWeekNumber);case"nn":return this.num(e.localWeekNumber,2);case"ii":return this.num(e.localWeekYear.toString().slice(-2),2);case"iiii":return this.num(e.localWeekYear,4);case"o":return this.num(e.ordinal);case"ooo":return this.num(e.ordinal,3);case"q":return this.num(e.quarter);case"qq":return this.num(e.quarter,2);case"X":return this.num(Math.floor(e.ts/1e3));case"x":return this.num(e.ts);default:return c(t)}}))}formatDurationFromString(e,t){const r=e=>{switch(e[0]){case"S":return"millisecond";case"s":return"second";case"m":return"minute";case"h":return"hour";case"d":return"day";case"w":return"week";case"M":return"month";case"y":return"year";default:return null}},n=Vn.parseFormat(t),i=n.reduce(((e,{literal:t,val:r})=>t?e:e.concat(r)),[]),a=e.shiftTo(...i.map(r).filter((e=>e)));return jn(n,(e=>t=>{const n=r(t);return n?this.num(e.get(n),t.length):t})(a))}}const Ln=/[A-Za-z_+-]{1,256}(?::?\/[A-Za-z0-9_+-]{1,256}(?:\/[A-Za-z0-9_+-]{1,256})?)?/;function Pn(...e){const t=e.reduce(((e,t)=>e+t.source),"");return RegExp(`^${t}$`)}function Fn(...e){return t=>e.reduce((([e,r,n],i)=>{const[a,s,o]=i(t,n);return[{...e,...a},s||r,o]}),[{},null,1]).slice(0,2)}function Un(e,...t){if(null==e)return[null,null];for(const[r,n]of t){const t=r.exec(e);if(t)return n(t)}return[null,null]}function Wn(...e){return(t,r)=>{const n={};let i;for(i=0;i<e.length;i++)n[e[i]]=sn(t[r+i]);return[n,null,r+i]}}const Yn=/(?:(Z)|([+-]\d\d)(?::?(\d\d))?)/,Zn=/(\d\d)(?::?(\d\d)(?::?(\d\d)(?:[.,](\d{1,30}))?)?)?/,Hn=RegExp(`${Zn.source}${`(?:${Yn.source}?(?:\\[(${Ln.source})\\])?)?`}`),qn=RegExp(`(?:T${Hn.source})?`),Bn=Wn("weekYear","weekNumber","weekDay"),Jn=Wn("year","ordinal"),Gn=RegExp(`${Zn.source} ?(?:${Yn.source}|(${Ln.source}))?`),Kn=RegExp(`(?: ${Gn.source})?`);function Qn(e,t,r){const n=e[t];return Jr(n)?r:sn(n)}function Xn(e,t){return[{hours:Qn(e,t,0),minutes:Qn(e,t+1,0),seconds:Qn(e,t+2,0),milliseconds:ln(e[t+3])},null,t+4]}function ei(e,t){const r=!e[t]&&!e[t+1],n=vn(e[t+1],e[t+2]);return[{},r?null:yr.instance(n),t+3]}function ti(e,t){return[{},e[t]?rr.create(e[t]):null,t+1]}const ri=RegExp(`^T?${Zn.source}$`),ni=/^-?P(?:(?:(-?\d{1,20}(?:\.\d{1,20})?)Y)?(?:(-?\d{1,20}(?:\.\d{1,20})?)M)?(?:(-?\d{1,20}(?:\.\d{1,20})?)W)?(?:(-?\d{1,20}(?:\.\d{1,20})?)D)?(?:T(?:(-?\d{1,20}(?:\.\d{1,20})?)H)?(?:(-?\d{1,20}(?:\.\d{1,20})?)M)?(?:(-?\d{1,20})(?:[.,](-?\d{1,20}))?S)?)?)$/;function ii(e){const[t,r,n,i,a,s,o,l,c]=e,d="-"===t[0],u=l&&"-"===l[0],h=(e,t=!1)=>void 0!==e&&(t||e&&d)?-e:e;return[{years:h(on(r)),months:h(on(n)),weeks:h(on(i)),days:h(on(a)),hours:h(on(s)),minutes:h(on(o)),seconds:h(on(l),"-0"===l),milliseconds:h(ln(c),u)}]}const ai={GMT:0,EDT:-240,EST:-300,CDT:-300,CST:-360,MDT:-360,MST:-420,PDT:-420,PST:-480};function si(e,t,r,n,i,a,s){const o={year:2===t.length?pn(sn(t)):sn(t),month:$n.indexOf(r)+1,day:sn(n),hour:sn(i),minute:sn(a)};return s&&(o.second=sn(s)),e&&(o.weekday=e.length>3?Dn.indexOf(e)+1:xn.indexOf(e)+1),o}const oi=/^(?:(Mon|Tue|Wed|Thu|Fri|Sat|Sun),\s)?(\d{1,2})\s(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s(\d{2,4})\s(\d\d):(\d\d)(?::(\d\d))?\s(?:(UT|GMT|[ECMP][SD]T)|([Zz])|(?:([+-]\d\d)(\d\d)))$/;function li(e){const[,t,r,n,i,a,s,o,l,c,d,u]=e,h=si(t,i,n,r,a,s,o);let m;return m=l?ai[l]:c?0:vn(d,u),[h,new yr(m)]}const ci=/^(Mon|Tue|Wed|Thu|Fri|Sat|Sun), (\d\d) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) (\d{4}) (\d\d):(\d\d):(\d\d) GMT$/,di=/^(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday), (\d\d)-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)-(\d\d) (\d\d):(\d\d):(\d\d) GMT$/,ui=/^(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) ( \d|\d\d) (\d\d):(\d\d):(\d\d) (\d{4})$/;function hi(e){const[,t,r,n,i,a,s,o]=e;return[si(t,i,n,r,a,s,o),yr.utcInstance]}function mi(e){const[,t,r,n,i,a,s,o]=e;return[si(t,o,r,n,i,a,s),yr.utcInstance]}const fi=Pn(/([+-]\d{6}|\d{4})(?:-?(\d\d)(?:-?(\d\d))?)?/,qn),gi=Pn(/(\d{4})-?W(\d\d)(?:-?(\d))?/,qn),pi=Pn(/(\d{4})-?(\d{3})/,qn),yi=Pn(Hn),vi=Fn((function(e,t){return[{year:Qn(e,t),month:Qn(e,t+1,1),day:Qn(e,t+2,1)},null,t+3]}),Xn,ei,ti),bi=Fn(Bn,Xn,ei,ti),_i=Fn(Jn,Xn,ei,ti),wi=Fn(Xn,ei,ti);const ki=Fn(Xn);const Si=Pn(/(\d{4})-(\d\d)-(\d\d)/,Kn),$i=Pn(Gn),zi=Fn(Xn,ei,ti);const Ti="Invalid Duration",Di={weeks:{days:7,hours:168,minutes:10080,seconds:604800,milliseconds:6048e5},days:{hours:24,minutes:1440,seconds:86400,milliseconds:864e5},hours:{minutes:60,seconds:3600,milliseconds:36e5},minutes:{seconds:60,milliseconds:6e4},seconds:{milliseconds:1e3}},xi={years:{quarters:4,months:12,weeks:52,days:365,hours:8760,minutes:525600,seconds:31536e3,milliseconds:31536e6},quarters:{months:3,weeks:13,days:91,hours:2184,minutes:131040,seconds:7862400,milliseconds:78624e5},months:{weeks:4,days:30,hours:720,minutes:43200,seconds:2592e3,milliseconds:2592e6},...Di},Ai=365.2425,Ei=30.436875,Ni={years:{quarters:4,months:12,weeks:52.1775,days:Ai,hours:8765.82,minutes:525949.2,seconds:525949.2*60,milliseconds:525949.2*60*1e3},quarters:{months:3,weeks:13.044375,days:91.310625,hours:2191.455,minutes:131487.3,seconds:525949.2*60/4,milliseconds:7889237999.999999},months:{weeks:4.3481250000000005,days:Ei,hours:730.485,minutes:43829.1,seconds:2629746,milliseconds:2629746e3},...Di},Mi=["years","quarters","months","weeks","days","hours","minutes","seconds","milliseconds"],Oi=Mi.slice(0).reverse();function Ii(e,t,r=!1){const n={values:r?t.values:{...e.values,...t.values||{}},loc:e.loc.clone(t.loc),conversionAccuracy:t.conversionAccuracy||e.conversionAccuracy,matrix:t.matrix||e.matrix};return new Ri(n)}function Ci(e,t){let r=t.milliseconds??0;for(const n of Oi.slice(1))t[n]&&(r+=t[n]*e[n].milliseconds);return r}function ji(e,t){const r=Ci(e,t)<0?-1:1;Mi.reduceRight(((n,i)=>{if(Jr(t[i]))return n;if(n){const a=t[n]*r,s=e[i][n],o=Math.floor(a/s);t[i]+=o*r,t[n]-=o*s*r}return i}),null),Mi.reduce(((r,n)=>{if(Jr(t[n]))return r;if(r){const i=t[r]%1;t[r]-=i,t[n]+=i*e[r][n]}return n}),null)}class Ri{constructor(e){const t="longterm"===e.conversionAccuracy||!1;let r=t?Ni:xi;e.matrix&&(r=e.matrix),this.values=e.values,this.loc=e.loc||gr.create(),this.conversionAccuracy=t?"longterm":"casual",this.invalid=e.invalid||null,this.matrix=r,this.isLuxonDuration=!0}static fromMillis(e,t){return Ri.fromObject({milliseconds:e},t)}static fromObject(e,t={}){if(null==e||"object"!=typeof e)throw new St("Duration.fromObject: argument expected to be an object, got "+(null===e?"null":typeof e));return new Ri({values:_n(e,Ri.normalizeUnit),loc:gr.fromObject(t),conversionAccuracy:t.conversionAccuracy,matrix:t.matrix})}static fromDurationLike(e){if(Gr(e))return Ri.fromMillis(e);if(Ri.isDuration(e))return e;if("object"==typeof e)return Ri.fromObject(e);throw new St(`Unknown duration argument ${e} of type ${typeof e}`)}static fromISO(e,t){const[r]=function(e){return Un(e,[ni,ii])}(e);return r?Ri.fromObject(r,t):Ri.invalid("unparsable",`the input "${e}" can't be parsed as ISO 8601`)}static fromISOTime(e,t){const[r]=function(e){return Un(e,[ri,ki])}(e);return r?Ri.fromObject(r,t):Ri.invalid("unparsable",`the input "${e}" can't be parsed as ISO 8601`)}static invalid(e,t=null){if(!e)throw new St("need to specify a reason the Duration is invalid");const r=e instanceof Ir?e:new Ir(e,t);if(Or.throwOnInvalid)throw new _t(r);return new Ri({invalid:r})}static normalizeUnit(e){const t={year:"years",years:"years",quarter:"quarters",quarters:"quarters",month:"months",months:"months",week:"weeks",weeks:"weeks",day:"days",days:"days",hour:"hours",hours:"hours",minute:"minutes",minutes:"minutes",second:"seconds",seconds:"seconds",millisecond:"milliseconds",milliseconds:"milliseconds"}[e?e.toLowerCase():e];if(!t)throw new kt(e);return t}static isDuration(e){return e&&e.isLuxonDuration||!1}get locale(){return this.isValid?this.loc.locale:null}get numberingSystem(){return this.isValid?this.loc.numberingSystem:null}toFormat(e,t={}){const r={...t,floor:!1!==t.round&&!1!==t.floor};return this.isValid?Vn.create(this.loc,r).formatDurationFromString(this,e):Ti}toHuman(e={}){if(!this.isValid)return Ti;const t=Mi.map((t=>{const r=this.values[t];return Jr(r)?null:this.loc.numberFormatter({style:"unit",unitDisplay:"long",...e,unit:t.slice(0,-1)}).format(r)})).filter((e=>e));return this.loc.listFormatter({type:"conjunction",style:e.listStyle||"narrow",...e}).format(t)}toObject(){return this.isValid?{...this.values}:{}}toISO(){if(!this.isValid)return null;let e="P";return 0!==this.years&&(e+=this.years+"Y"),0===this.months&&0===this.quarters||(e+=this.months+3*this.quarters+"M"),0!==this.weeks&&(e+=this.weeks+"W"),0!==this.days&&(e+=this.days+"D"),0===this.hours&&0===this.minutes&&0===this.seconds&&0===this.milliseconds||(e+="T"),0!==this.hours&&(e+=this.hours+"H"),0!==this.minutes&&(e+=this.minutes+"M"),0===this.seconds&&0===this.milliseconds||(e+=cn(this.seconds+this.milliseconds/1e3,3)+"S"),"P"===e&&(e+="T0S"),e}toISOTime(e={}){if(!this.isValid)return null;const t=this.toMillis();if(t<0||t>=864e5)return null;e={suppressMilliseconds:!1,suppressSeconds:!1,includePrefix:!1,format:"extended",...e,includeOffset:!1};return Aa.fromMillis(t,{zone:"UTC"}).toISOTime(e)}toJSON(){return this.toISO()}toString(){return this.toISO()}[Symbol.for("nodejs.util.inspect.custom")](){return this.isValid?`Duration { values: ${JSON.stringify(this.values)} }`:`Duration { Invalid, reason: ${this.invalidReason} }`}toMillis(){return this.isValid?Ci(this.matrix,this.values):NaN}valueOf(){return this.toMillis()}plus(e){if(!this.isValid)return this;const t=Ri.fromDurationLike(e),r={};for(const e of Mi)(tn(t.values,e)||tn(this.values,e))&&(r[e]=t.get(e)+this.get(e));return Ii(this,{values:r},!0)}minus(e){if(!this.isValid)return this;const t=Ri.fromDurationLike(e);return this.plus(t.negate())}mapUnits(e){if(!this.isValid)return this;const t={};for(const r of Object.keys(this.values))t[r]=bn(e(this.values[r],r));return Ii(this,{values:t},!0)}get(e){return this[Ri.normalizeUnit(e)]}set(e){if(!this.isValid)return this;return Ii(this,{values:{...this.values,..._n(e,Ri.normalizeUnit)}})}reconfigure({locale:e,numberingSystem:t,conversionAccuracy:r,matrix:n}={}){return Ii(this,{loc:this.loc.clone({locale:e,numberingSystem:t}),matrix:n,conversionAccuracy:r})}as(e){return this.isValid?this.shiftTo(e).get(e):NaN}normalize(){if(!this.isValid)return this;const e=this.toObject();return ji(this.matrix,e),Ii(this,{values:e},!0)}rescale(){if(!this.isValid)return this;return Ii(this,{values:function(e){const t={};for(const[r,n]of Object.entries(e))0!==n&&(t[r]=n);return t}(this.normalize().shiftToAll().toObject())},!0)}shiftTo(...e){if(!this.isValid)return this;if(0===e.length)return this;e=e.map((e=>Ri.normalizeUnit(e)));const t={},r={},n=this.toObject();let i;for(const a of Mi)if(e.indexOf(a)>=0){i=a;let e=0;for(const t in r)e+=this.matrix[t][a]*r[t],r[t]=0;Gr(n[a])&&(e+=n[a]);const s=Math.trunc(e);t[a]=s,r[a]=(1e3*e-1e3*s)/1e3}else Gr(n[a])&&(r[a]=n[a]);for(const e in r)0!==r[e]&&(t[i]+=e===i?r[e]:r[e]/this.matrix[i][e]);return ji(this.matrix,t),Ii(this,{values:t},!0)}shiftToAll(){return this.isValid?this.shiftTo("years","months","weeks","days","hours","minutes","seconds","milliseconds"):this}negate(){if(!this.isValid)return this;const e={};for(const t of Object.keys(this.values))e[t]=0===this.values[t]?0:-this.values[t];return Ii(this,{values:e},!0)}get years(){return this.isValid?this.values.years||0:NaN}get quarters(){return this.isValid?this.values.quarters||0:NaN}get months(){return this.isValid?this.values.months||0:NaN}get weeks(){return this.isValid?this.values.weeks||0:NaN}get days(){return this.isValid?this.values.days||0:NaN}get hours(){return this.isValid?this.values.hours||0:NaN}get minutes(){return this.isValid?this.values.minutes||0:NaN}get seconds(){return this.isValid?this.values.seconds||0:NaN}get milliseconds(){return this.isValid?this.values.milliseconds||0:NaN}get isValid(){return null===this.invalid}get invalidReason(){return this.invalid?this.invalid.reason:null}get invalidExplanation(){return this.invalid?this.invalid.explanation:null}equals(e){if(!this.isValid||!e.isValid)return!1;if(!this.loc.equals(e.loc))return!1;for(const n of Mi)if(t=this.values[n],r=e.values[n],!(void 0===t||0===t?void 0===r||0===r:t===r))return!1;var t,r;return!0}}const Vi="Invalid Interval";class Li{constructor(e){this.s=e.start,this.e=e.end,this.invalid=e.invalid||null,this.isLuxonInterval=!0}static invalid(e,t=null){if(!e)throw new St("need to specify a reason the Interval is invalid");const r=e instanceof Ir?e:new Ir(e,t);if(Or.throwOnInvalid)throw new bt(r);return new Li({invalid:r})}static fromDateTimes(e,t){const r=Ea(e),n=Ea(t),i=function(e,t){return e&&e.isValid?t&&t.isValid?t<e?Li.invalid("end before start",`The end of an interval must be after its start, but you had start=${e.toISO()} and end=${t.toISO()}`):null:Li.invalid("missing or invalid end"):Li.invalid("missing or invalid start")}(r,n);return null==i?new Li({start:r,end:n}):i}static after(e,t){const r=Ri.fromDurationLike(t),n=Ea(e);return Li.fromDateTimes(n,n.plus(r))}static before(e,t){const r=Ri.fromDurationLike(t),n=Ea(e);return Li.fromDateTimes(n.minus(r),n)}static fromISO(e,t){const[r,n]=(e||"").split("/",2);if(r&&n){let e,i,a,s;try{e=Aa.fromISO(r,t),i=e.isValid}catch(n){i=!1}try{a=Aa.fromISO(n,t),s=a.isValid}catch(n){s=!1}if(i&&s)return Li.fromDateTimes(e,a);if(i){const r=Ri.fromISO(n,t);if(r.isValid)return Li.after(e,r)}else if(s){const e=Ri.fromISO(r,t);if(e.isValid)return Li.before(a,e)}}return Li.invalid("unparsable",`the input "${e}" can't be parsed as ISO 8601`)}static isInterval(e){return e&&e.isLuxonInterval||!1}get start(){return this.isValid?this.s:null}get end(){return this.isValid?this.e:null}get isValid(){return null===this.invalidReason}get invalidReason(){return this.invalid?this.invalid.reason:null}get invalidExplanation(){return this.invalid?this.invalid.explanation:null}length(e="milliseconds"){return this.isValid?this.toDuration(e).get(e):NaN}count(e="milliseconds",t){if(!this.isValid)return NaN;const r=this.start.startOf(e,t);let n;return n=t?.useLocaleWeeks?this.end.reconfigure({locale:r.locale}):this.end,n=n.startOf(e,t),Math.floor(n.diff(r,e).get(e))+(n.valueOf()!==this.end.valueOf())}hasSame(e){return!!this.isValid&&(this.isEmpty()||this.e.minus(1).hasSame(this.s,e))}isEmpty(){return this.s.valueOf()===this.e.valueOf()}isAfter(e){return!!this.isValid&&this.s>e}isBefore(e){return!!this.isValid&&this.e<=e}contains(e){return!!this.isValid&&(this.s<=e&&this.e>e)}set({start:e,end:t}={}){return this.isValid?Li.fromDateTimes(e||this.s,t||this.e):this}splitAt(...e){if(!this.isValid)return[];const t=e.map(Ea).filter((e=>this.contains(e))).sort(((e,t)=>e.toMillis()-t.toMillis())),r=[];let{s:n}=this,i=0;for(;n<this.e;){const e=t[i]||this.e,a=+e>+this.e?this.e:e;r.push(Li.fromDateTimes(n,a)),n=a,i+=1}return r}splitBy(e){const t=Ri.fromDurationLike(e);if(!this.isValid||!t.isValid||0===t.as("milliseconds"))return[];let r,{s:n}=this,i=1;const a=[];for(;n<this.e;){const e=this.start.plus(t.mapUnits((e=>e*i)));r=+e>+this.e?this.e:e,a.push(Li.fromDateTimes(n,r)),n=r,i+=1}return a}divideEqually(e){return this.isValid?this.splitBy(this.length()/e).slice(0,e):[]}overlaps(e){return this.e>e.s&&this.s<e.e}abutsStart(e){return!!this.isValid&&+this.e==+e.s}abutsEnd(e){return!!this.isValid&&+e.e==+this.s}engulfs(e){return!!this.isValid&&(this.s<=e.s&&this.e>=e.e)}equals(e){return!(!this.isValid||!e.isValid)&&(this.s.equals(e.s)&&this.e.equals(e.e))}intersection(e){if(!this.isValid)return this;const t=this.s>e.s?this.s:e.s,r=this.e<e.e?this.e:e.e;return t>=r?null:Li.fromDateTimes(t,r)}union(e){if(!this.isValid)return this;const t=this.s<e.s?this.s:e.s,r=this.e>e.e?this.e:e.e;return Li.fromDateTimes(t,r)}static merge(e){const[t,r]=e.sort(((e,t)=>e.s-t.s)).reduce((([e,t],r)=>t?t.overlaps(r)||t.abutsStart(r)?[e,t.union(r)]:[e.concat([t]),r]:[e,r]),[[],null]);return r&&t.push(r),t}static xor(e){let t=null,r=0;const n=[],i=e.map((e=>[{time:e.s,type:"s"},{time:e.e,type:"e"}])),a=Array.prototype.concat(...i).sort(((e,t)=>e.time-t.time));for(const e of a)r+="s"===e.type?1:-1,1===r?t=e.time:(t&&+t!=+e.time&&n.push(Li.fromDateTimes(t,e.time)),t=null);return Li.merge(n)}difference(...e){return Li.xor([this].concat(e)).map((e=>this.intersection(e))).filter((e=>e&&!e.isEmpty()))}toString(){return this.isValid?`[${this.s.toISO()} – ${this.e.toISO()})`:Vi}[Symbol.for("nodejs.util.inspect.custom")](){return this.isValid?`Interval { start: ${this.s.toISO()}, end: ${this.e.toISO()} }`:`Interval { Invalid, reason: ${this.invalidReason} }`}toLocaleString(e=xt,t={}){return this.isValid?Vn.create(this.s.loc.clone(t),e).formatInterval(this):Vi}toISO(e){return this.isValid?`${this.s.toISO(e)}/${this.e.toISO(e)}`:Vi}toISODate(){return this.isValid?`${this.s.toISODate()}/${this.e.toISODate()}`:Vi}toISOTime(e){return this.isValid?`${this.s.toISOTime(e)}/${this.e.toISOTime(e)}`:Vi}toFormat(e,{separator:t=" – "}={}){return this.isValid?`${this.s.toFormat(e)}${t}${this.e.toFormat(e)}`:Vi}toDuration(e,t){return this.isValid?this.e.diff(this.s,e,t):Ri.invalid(this.invalidReason)}mapEndpoints(e){return Li.fromDateTimes(e(this.s),e(this.e))}}class Pi{static hasDST(e=Or.defaultZone){const t=Aa.now().setZone(e).set({month:12});return!e.isUniversal&&t.offset!==t.set({month:6}).offset}static isValidIANAZone(e){return rr.isValidZone(e)}static normalizeZone(e){return br(e,Or.defaultZone)}static getStartOfWeek({locale:e=null,locObj:t=null}={}){return(t||gr.create(e)).getStartOfWeek()}static getMinimumDaysInFirstWeek({locale:e=null,locObj:t=null}={}){return(t||gr.create(e)).getMinDaysInFirstWeek()}static getWeekendWeekdays({locale:e=null,locObj:t=null}={}){return(t||gr.create(e)).getWeekendDays().slice()}static months(e="long",{locale:t=null,numberingSystem:r=null,locObj:n=null,outputCalendar:i="gregory"}={}){return(n||gr.create(t,r,i)).months(e)}static monthsFormat(e="long",{locale:t=null,numberingSystem:r=null,locObj:n=null,outputCalendar:i="gregory"}={}){return(n||gr.create(t,r,i)).months(e,!0)}static weekdays(e="long",{locale:t=null,numberingSystem:r=null,locObj:n=null}={}){return(n||gr.create(t,r,null)).weekdays(e)}static weekdaysFormat(e="long",{locale:t=null,numberingSystem:r=null,locObj:n=null}={}){return(n||gr.create(t,r,null)).weekdays(e,!0)}static meridiems({locale:e=null}={}){return gr.create(e).meridiems()}static eras(e="short",{locale:t=null}={}){return gr.create(t,null,"gregory").eras(e)}static features(){return{relative:Qr(),localeWeek:Xr()}}}function Fi(e,t){const r=e=>e.toUTC(0,{keepLocalTime:!0}).startOf("day").valueOf(),n=r(t)-r(e);return Math.floor(Ri.fromMillis(n).as("days"))}function Ui(e,t,r,n){let[i,a,s,o]=function(e,t,r){const n=[["years",(e,t)=>t.year-e.year],["quarters",(e,t)=>t.quarter-e.quarter+4*(t.year-e.year)],["months",(e,t)=>t.month-e.month+12*(t.year-e.year)],["weeks",(e,t)=>{const r=Fi(e,t);return(r-r%7)/7}],["days",Fi]],i={},a=e;let s,o;for(const[l,c]of n)r.indexOf(l)>=0&&(s=l,i[l]=c(e,t),o=a.plus(i),o>t?(i[l]--,(e=a.plus(i))>t&&(o=e,i[l]--,e=a.plus(i))):e=o);return[e,i,o,s]}(e,t,r);const l=t-i,c=r.filter((e=>["hours","minutes","seconds","milliseconds"].indexOf(e)>=0));0===c.length&&(s<t&&(s=i.plus({[o]:1})),s!==i&&(a[o]=(a[o]||0)+l/(s-i)));const d=Ri.fromObject(a,n);return c.length>0?Ri.fromMillis(l,n).shiftTo(...c).plus(d):d}function Wi(e,t=(e=>e)){return{regex:e,deser:([e])=>t(function(e){let t=parseInt(e,10);if(isNaN(t)){t="";for(let r=0;r<e.length;r++){const n=e.charCodeAt(r);if(-1!==e[r].search(_r.hanidec))t+=kr.indexOf(e[r]);else for(const e in wr){const[r,i]=wr[e];n>=r&&n<=i&&(t+=n-r)}}return parseInt(t,10)}return t}(e))}}const Yi=`[ ${String.fromCharCode(160)}]`,Zi=new RegExp(Yi,"g");function Hi(e){return e.replace(/\./g,"\\.?").replace(Zi,Yi)}function qi(e){return e.replace(/\./g,"").replace(Zi," ").toLowerCase()}function Bi(e,t){return null===e?null:{regex:RegExp(e.map(Hi).join("|")),deser:([r])=>e.findIndex((e=>qi(r)===qi(e)))+t}}function Ji(e,t){return{regex:e,deser:([,e,t])=>vn(e,t),groups:t}}function Gi(e){return{regex:e,deser:([e])=>e}}const Ki={year:{"2-digit":"yy",numeric:"yyyyy"},month:{numeric:"M","2-digit":"MM",short:"MMM",long:"MMMM"},day:{numeric:"d","2-digit":"dd"},weekday:{short:"EEE",long:"EEEE"},dayperiod:"a",dayPeriod:"a",hour12:{numeric:"h","2-digit":"hh"},hour24:{numeric:"H","2-digit":"HH"},minute:{numeric:"m","2-digit":"mm"},second:{numeric:"s","2-digit":"ss"},timeZoneName:{long:"ZZZZZ",short:"ZZZ"}};let Qi=null;function Xi(e,t){return Array.prototype.concat(...e.map((e=>function(e,t){if(e.literal)return e;const r=ra(Vn.macroTokenToFormatOpts(e.val),t);return null==r||r.includes(void 0)?e:r}(e,t))))}class ea{constructor(e,t){if(this.locale=e,this.format=t,this.tokens=Xi(Vn.parseFormat(t),e),this.units=this.tokens.map((t=>function(e,t){const r=$r(t),n=$r(t,"{2}"),i=$r(t,"{3}"),a=$r(t,"{4}"),s=$r(t,"{6}"),o=$r(t,"{1,2}"),l=$r(t,"{1,3}"),c=$r(t,"{1,6}"),d=$r(t,"{1,9}"),u=$r(t,"{2,4}"),h=$r(t,"{4,6}"),m=e=>{return{regex:RegExp((t=e.val,t.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&"))),deser:([e])=>e,literal:!0};var t},f=(f=>{if(e.literal)return m(f);switch(f.val){case"G":return Bi(t.eras("short"),0);case"GG":return Bi(t.eras("long"),0);case"y":return Wi(c);case"yy":case"kk":return Wi(u,pn);case"yyyy":case"kkkk":return Wi(a);case"yyyyy":return Wi(h);case"yyyyyy":return Wi(s);case"M":case"L":case"d":case"H":case"h":case"m":case"q":case"s":case"W":return Wi(o);case"MM":case"LL":case"dd":case"HH":case"hh":case"mm":case"qq":case"ss":case"WW":return Wi(n);case"MMM":return Bi(t.months("short",!0),1);case"MMMM":return Bi(t.months("long",!0),1);case"LLL":return Bi(t.months("short",!1),1);case"LLLL":return Bi(t.months("long",!1),1);case"o":case"S":return Wi(l);case"ooo":case"SSS":return Wi(i);case"u":return Gi(d);case"uu":return Gi(o);case"uuu":case"E":case"c":return Wi(r);case"a":return Bi(t.meridiems(),0);case"EEE":return Bi(t.weekdays("short",!1),1);case"EEEE":return Bi(t.weekdays("long",!1),1);case"ccc":return Bi(t.weekdays("short",!0),1);case"cccc":return Bi(t.weekdays("long",!0),1);case"Z":case"ZZ":return Ji(new RegExp(`([+-]${o.source})(?::(${n.source}))?`),2);case"ZZZ":return Ji(new RegExp(`([+-]${o.source})(${n.source})?`),2);case"z":return Gi(/[a-z_+-/]{1,256}?/i);case" ":return Gi(/[^\S\n\r]/);default:return m(f)}})(e)||{invalidReason:"missing Intl.DateTimeFormat.formatToParts support"};return f.token=e,f}(t,e))),this.disqualifyingUnit=this.units.find((e=>e.invalidReason)),!this.disqualifyingUnit){const[e,t]=function(e){const t=e.map((e=>e.regex)).reduce(((e,t)=>`${e}(${t.source})`),"");return[`^${t}$`,e]}(this.units);this.regex=RegExp(e,"i"),this.handlers=t}}explainFromTokens(e){if(this.isValid){const[t,r]=function(e,t,r){const n=e.match(t);if(n){const e={};let t=1;for(const i in r)if(tn(r,i)){const a=r[i],s=a.groups?a.groups+1:1;!a.literal&&a.token&&(e[a.token.val[0]]=a.deser(n.slice(t,t+s))),t+=s}return[n,e]}return[n,{}]}(e,this.regex,this.handlers),[n,i,a]=r?function(e){let t,r=null;Jr(e.z)||(r=rr.create(e.z)),Jr(e.Z)||(r||(r=new yr(e.Z)),t=e.Z),Jr(e.q)||(e.M=3*(e.q-1)+1),Jr(e.h)||(e.h<12&&1===e.a?e.h+=12:12===e.h&&0===e.a&&(e.h=0)),0===e.G&&e.y&&(e.y=-e.y),Jr(e.u)||(e.S=ln(e.u));const n=Object.keys(e).reduce(((t,r)=>{const n=(e=>{switch(e){case"S":return"millisecond";case"s":return"second";case"m":return"minute";case"h":case"H":return"hour";case"d":return"day";case"o":return"ordinal";case"L":case"M":return"month";case"y":return"year";case"E":case"c":return"weekday";case"W":return"weekNumber";case"k":return"weekYear";case"q":return"quarter";default:return null}})(r);return n&&(t[n]=e[r]),t}),{});return[n,r,t]}(r):[null,null,void 0];if(tn(r,"a")&&tn(r,"H"))throw new wt("Can't include meridiem when specifying 24-hour format");return{input:e,tokens:this.tokens,regex:this.regex,rawMatches:t,matches:r,result:n,zone:i,specificOffset:a}}return{input:e,tokens:this.tokens,invalidReason:this.invalidReason}}get isValid(){return!this.disqualifyingUnit}get invalidReason(){return this.disqualifyingUnit?this.disqualifyingUnit.invalidReason:null}}function ta(e,t,r){return new ea(e,r).explainFromTokens(t)}function ra(e,t){if(!e)return null;const r=Vn.create(t,e).dtFormatter((Qi||(Qi=Aa.fromMillis(1555555555555)),Qi)),n=r.formatToParts(),i=r.resolvedOptions();return n.map((t=>function(e,t,r){const{type:n,value:i}=e;if("literal"===n){const e=/^\s+$/.test(i);return{literal:!e,val:e?" ":i}}const a=t[n];let s=n;"hour"===n&&(s=null!=t.hour12?t.hour12?"hour12":"hour24":null!=t.hourCycle?"h11"===t.hourCycle||"h12"===t.hourCycle?"hour12":"hour24":r.hour12?"hour12":"hour24");let o=Ki[s];if("object"==typeof o&&(o=o[a]),o)return{literal:!1,val:o}}(t,e,i)))}const na="Invalid DateTime",ia=864e13;function aa(e){return new Ir("unsupported zone",`the zone "${e.name}" is not supported`)}function sa(e){return null===e.weekData&&(e.weekData=Ur(e.c)),e.weekData}function oa(e){return null===e.localWeekData&&(e.localWeekData=Ur(e.c,e.loc.getMinDaysInFirstWeek(),e.loc.getStartOfWeek())),e.localWeekData}function la(e,t){const r={ts:e.ts,zone:e.zone,c:e.c,o:e.o,loc:e.loc,invalid:e.invalid};return new Aa({...r,...t,old:r})}function ca(e,t,r){let n=e-60*t*1e3;const i=r.offset(n);if(t===i)return[n,t];n-=60*(i-t)*1e3;const a=r.offset(n);return i===a?[n,i]:[e-60*Math.min(i,a)*1e3,Math.max(i,a)]}function da(e,t){const r=new Date(e+=60*t*1e3);return{year:r.getUTCFullYear(),month:r.getUTCMonth()+1,day:r.getUTCDate(),hour:r.getUTCHours(),minute:r.getUTCMinutes(),second:r.getUTCSeconds(),millisecond:r.getUTCMilliseconds()}}function ua(e,t,r){return ca(mn(e),t,r)}function ha(e,t){const r=e.o,n=e.c.year+Math.trunc(t.years),i=e.c.month+Math.trunc(t.months)+3*Math.trunc(t.quarters),a={...e.c,year:n,month:i,day:Math.min(e.c.day,hn(n,i))+Math.trunc(t.days)+7*Math.trunc(t.weeks)},s=Ri.fromObject({years:t.years-Math.trunc(t.years),quarters:t.quarters-Math.trunc(t.quarters),months:t.months-Math.trunc(t.months),weeks:t.weeks-Math.trunc(t.weeks),days:t.days-Math.trunc(t.days),hours:t.hours,minutes:t.minutes,seconds:t.seconds,milliseconds:t.milliseconds}).as("milliseconds"),o=mn(a);let[l,c]=ca(o,r,e.zone);return 0!==s&&(l+=s,c=e.zone.offset(l)),{ts:l,o:c}}function ma(e,t,r,n,i,a){const{setZone:s,zone:o}=r;if(e&&0!==Object.keys(e).length||t){const n=t||o,i=Aa.fromObject(e,{...r,zone:n,specificOffset:a});return s?i:i.setZone(o)}return Aa.invalid(new Ir("unparsable",`the input "${i}" can't be parsed as ${n}`))}function fa(e,t,r=!0){return e.isValid?Vn.create(gr.create("en-US"),{allowZ:r,forceSimple:!0}).formatDateTimeFromString(e,t):null}function ga(e,t){const r=e.c.year>9999||e.c.year<0;let n="";return r&&e.c.year>=0&&(n+="+"),n+=an(e.c.year,r?6:4),t?(n+="-",n+=an(e.c.month),n+="-",n+=an(e.c.day)):(n+=an(e.c.month),n+=an(e.c.day)),n}function pa(e,t,r,n,i,a){let s=an(e.c.hour);return t?(s+=":",s+=an(e.c.minute),0===e.c.millisecond&&0===e.c.second&&r||(s+=":")):s+=an(e.c.minute),0===e.c.millisecond&&0===e.c.second&&r||(s+=an(e.c.second),0===e.c.millisecond&&n||(s+=".",s+=an(e.c.millisecond,3))),i&&(e.isOffsetFixed&&0===e.offset&&!a?s+="Z":e.o<0?(s+="-",s+=an(Math.trunc(-e.o/60)),s+=":",s+=an(Math.trunc(-e.o%60))):(s+="+",s+=an(Math.trunc(e.o/60)),s+=":",s+=an(Math.trunc(e.o%60)))),a&&(s+="["+e.zone.ianaName+"]"),s}const ya={month:1,day:1,hour:0,minute:0,second:0,millisecond:0},va={weekNumber:1,weekday:1,hour:0,minute:0,second:0,millisecond:0},ba={ordinal:1,hour:0,minute:0,second:0,millisecond:0},_a=["year","month","day","hour","minute","second","millisecond"],wa=["weekYear","weekNumber","weekday","hour","minute","second","millisecond"],ka=["year","ordinal","hour","minute","second","millisecond"];function Sa(e){switch(e.toLowerCase()){case"localweekday":case"localweekdays":return"localWeekday";case"localweeknumber":case"localweeknumbers":return"localWeekNumber";case"localweekyear":case"localweekyears":return"localWeekYear";default:return function(e){const t={year:"year",years:"year",month:"month",months:"month",day:"day",days:"day",hour:"hour",hours:"hour",minute:"minute",minutes:"minute",quarter:"quarter",quarters:"quarter",second:"second",seconds:"second",millisecond:"millisecond",milliseconds:"millisecond",weekday:"weekday",weekdays:"weekday",weeknumber:"weekNumber",weeksnumber:"weekNumber",weeknumbers:"weekNumber",weekyear:"weekYear",weekyears:"weekYear",ordinal:"ordinal"}[e.toLowerCase()];if(!t)throw new kt(e);return t}(e)}}function $a(e,t){const r=br(t.zone,Or.defaultZone);if(!r.isValid)return Aa.invalid(aa(r));const n=gr.fromObject(t);let i,a;if(Jr(e.year))i=Or.now();else{for(const t of _a)Jr(e[t])&&(e[t]=ya[t]);const t=qr(e)||Br(e);if(t)return Aa.invalid(t);const n=function(e){return xa[e]||(void 0===Da&&(Da=Or.now()),xa[e]=e.offset(Da)),xa[e]}(r);[i,a]=ua(e,n,r)}return new Aa({ts:i,zone:r,loc:n,o:a})}function za(e,t,r){const n=!!Jr(r.round)||r.round,i=(e,i)=>{e=cn(e,n||r.calendary?0:2,!0);return t.loc.clone(r).relFormatter(r).format(e,i)},a=n=>r.calendary?t.hasSame(e,n)?0:t.startOf(n).diff(e.startOf(n),n).get(n):t.diff(e,n).get(n);if(r.unit)return i(a(r.unit),r.unit);for(const e of r.units){const t=a(e);if(Math.abs(t)>=1)return i(t,e)}return i(e>t?-0:0,r.units[r.units.length-1])}function Ta(e){let t,r={};return e.length>0&&"object"==typeof e[e.length-1]?(r=e[e.length-1],t=Array.from(e).slice(0,e.length-1)):t=Array.from(e),[r,t]}let Da,xa={};class Aa{constructor(e){const t=e.zone||Or.defaultZone;let r=e.invalid||(Number.isNaN(e.ts)?new Ir("invalid input"):null)||(t.isValid?null:aa(t));this.ts=Jr(e.ts)?Or.now():e.ts;let n=null,i=null;if(!r){if(e.old&&e.old.ts===this.ts&&e.old.zone.equals(t))[n,i]=[e.old.c,e.old.o];else{const a=Gr(e.o)&&!e.old?e.o:t.offset(this.ts);n=da(this.ts,a),r=Number.isNaN(n.year)?new Ir("invalid input"):null,n=r?null:n,i=r?null:a}}this._zone=t,this.loc=e.loc||gr.create(),this.invalid=r,this.weekData=null,this.localWeekData=null,this.c=n,this.o=i,this.isLuxonDateTime=!0}static now(){return new Aa({})}static local(){const[e,t]=Ta(arguments),[r,n,i,a,s,o,l]=t;return $a({year:r,month:n,day:i,hour:a,minute:s,second:o,millisecond:l},e)}static utc(){const[e,t]=Ta(arguments),[r,n,i,a,s,o,l]=t;return e.zone=yr.utcInstance,$a({year:r,month:n,day:i,hour:a,minute:s,second:o,millisecond:l},e)}static fromJSDate(e,t={}){const r=function(e){return"[object Date]"===Object.prototype.toString.call(e)}(e)?e.valueOf():NaN;if(Number.isNaN(r))return Aa.invalid("invalid input");const n=br(t.zone,Or.defaultZone);return n.isValid?new Aa({ts:r,zone:n,loc:gr.fromObject(t)}):Aa.invalid(aa(n))}static fromMillis(e,t={}){if(Gr(e))return e<-ia||e>ia?Aa.invalid("Timestamp out of range"):new Aa({ts:e,zone:br(t.zone,Or.defaultZone),loc:gr.fromObject(t)});throw new St(`fromMillis requires a numerical input, but received a ${typeof e} with value ${e}`)}static fromSeconds(e,t={}){if(Gr(e))return new Aa({ts:1e3*e,zone:br(t.zone,Or.defaultZone),loc:gr.fromObject(t)});throw new St("fromSeconds requires a numerical input")}static fromObject(e,t={}){e=e||{};const r=br(t.zone,Or.defaultZone);if(!r.isValid)return Aa.invalid(aa(r));const n=gr.fromObject(t),i=_n(e,Sa),{minDaysInFirstWeek:a,startOfWeek:s}=Hr(i,n),o=Or.now(),l=Jr(t.specificOffset)?r.offset(o):t.specificOffset,c=!Jr(i.ordinal),d=!Jr(i.year),u=!Jr(i.month)||!Jr(i.day),h=d||u,m=i.weekYear||i.weekNumber;if((h||c)&&m)throw new wt("Can't mix weekYear/weekNumber units with year/month/day or ordinals");if(u&&c)throw new wt("Can't mix ordinal dates with month/day");const f=m||i.weekday&&!h;let g,p,y=da(o,l);f?(g=wa,p=va,y=Ur(y,a,s)):c?(g=ka,p=ba,y=Yr(y)):(g=_a,p=ya);let v=!1;for(const e of g){Jr(i[e])?i[e]=v?p[e]:y[e]:v=!0}const b=f?function(e,t=4,r=1){const n=Kr(e.weekYear),i=nn(e.weekNumber,1,gn(e.weekYear,t,r)),a=nn(e.weekday,1,7);return n?i?!a&&Rr("weekday",e.weekday):Rr("week",e.weekNumber):Rr("weekYear",e.weekYear)}(i,a,s):c?function(e){const t=Kr(e.year),r=nn(e.ordinal,1,un(e.year));return t?!r&&Rr("ordinal",e.ordinal):Rr("year",e.year)}(i):qr(i),_=b||Br(i);if(_)return Aa.invalid(_);const w=f?Wr(i,a,s):c?Zr(i):i,[k,S]=ua(w,l,r),$=new Aa({ts:k,zone:r,o:S,loc:n});return i.weekday&&h&&e.weekday!==$.weekday?Aa.invalid("mismatched weekday",`you can't specify both a weekday of ${i.weekday} and a date of ${$.toISO()}`):$.isValid?$:Aa.invalid($.invalid)}static fromISO(e,t={}){const[r,n]=function(e){return Un(e,[fi,vi],[gi,bi],[pi,_i],[yi,wi])}(e);return ma(r,n,t,"ISO 8601",e)}static fromRFC2822(e,t={}){const[r,n]=function(e){return Un(function(e){return e.replace(/\([^()]*\)|[\n\t]/g," ").replace(/(\s\s+)/g," ").trim()}(e),[oi,li])}(e);return ma(r,n,t,"RFC 2822",e)}static fromHTTP(e,t={}){const[r,n]=function(e){return Un(e,[ci,hi],[di,hi],[ui,mi])}(e);return ma(r,n,t,"HTTP",t)}static fromFormat(e,t,r={}){if(Jr(e)||Jr(t))throw new St("fromFormat requires an input string and a format");const{locale:n=null,numberingSystem:i=null}=r,a=gr.fromOpts({locale:n,numberingSystem:i,defaultToEN:!0}),[s,o,l,c]=function(e,t,r){const{result:n,zone:i,specificOffset:a,invalidReason:s}=ta(e,t,r);return[n,i,a,s]}(a,e,t);return c?Aa.invalid(c):ma(s,o,r,`format ${t}`,e,l)}static fromString(e,t,r={}){return Aa.fromFormat(e,t,r)}static fromSQL(e,t={}){const[r,n]=function(e){return Un(e,[Si,vi],[$i,zi])}(e);return ma(r,n,t,"SQL",e)}static invalid(e,t=null){if(!e)throw new St("need to specify a reason the DateTime is invalid");const r=e instanceof Ir?e:new Ir(e,t);if(Or.throwOnInvalid)throw new vt(r);return new Aa({invalid:r})}static isDateTime(e){return e&&e.isLuxonDateTime||!1}static parseFormatForOpts(e,t={}){const r=ra(e,gr.fromObject(t));return r?r.map((e=>e?e.val:null)).join(""):null}static expandFormat(e,t={}){return Xi(Vn.parseFormat(e),gr.fromObject(t)).map((e=>e.val)).join("")}static resetCache(){Da=void 0,xa={}}get(e){return this[e]}get isValid(){return null===this.invalid}get invalidReason(){return this.invalid?this.invalid.reason:null}get invalidExplanation(){return this.invalid?this.invalid.explanation:null}get locale(){return this.isValid?this.loc.locale:null}get numberingSystem(){return this.isValid?this.loc.numberingSystem:null}get outputCalendar(){return this.isValid?this.loc.outputCalendar:null}get zone(){return this._zone}get zoneName(){return this.isValid?this.zone.name:null}get year(){return this.isValid?this.c.year:NaN}get quarter(){return this.isValid?Math.ceil(this.c.month/3):NaN}get month(){return this.isValid?this.c.month:NaN}get day(){return this.isValid?this.c.day:NaN}get hour(){return this.isValid?this.c.hour:NaN}get minute(){return this.isValid?this.c.minute:NaN}get second(){return this.isValid?this.c.second:NaN}get millisecond(){return this.isValid?this.c.millisecond:NaN}get weekYear(){return this.isValid?sa(this).weekYear:NaN}get weekNumber(){return this.isValid?sa(this).weekNumber:NaN}get weekday(){return this.isValid?sa(this).weekday:NaN}get isWeekend(){return this.isValid&&this.loc.getWeekendDays().includes(this.weekday)}get localWeekday(){return this.isValid?oa(this).weekday:NaN}get localWeekNumber(){return this.isValid?oa(this).weekNumber:NaN}get localWeekYear(){return this.isValid?oa(this).weekYear:NaN}get ordinal(){return this.isValid?Yr(this.c).ordinal:NaN}get monthShort(){return this.isValid?Pi.months("short",{locObj:this.loc})[this.month-1]:null}get monthLong(){return this.isValid?Pi.months("long",{locObj:this.loc})[this.month-1]:null}get weekdayShort(){return this.isValid?Pi.weekdays("short",{locObj:this.loc})[this.weekday-1]:null}get weekdayLong(){return this.isValid?Pi.weekdays("long",{locObj:this.loc})[this.weekday-1]:null}get offset(){return this.isValid?+this.o:NaN}get offsetNameShort(){return this.isValid?this.zone.offsetName(this.ts,{format:"short",locale:this.locale}):null}get offsetNameLong(){return this.isValid?this.zone.offsetName(this.ts,{format:"long",locale:this.locale}):null}get isOffsetFixed(){return this.isValid?this.zone.isUniversal:null}get isInDST(){return!this.isOffsetFixed&&(this.offset>this.set({month:1,day:1}).offset||this.offset>this.set({month:5}).offset)}getPossibleOffsets(){if(!this.isValid||this.isOffsetFixed)return[this];const e=864e5,t=6e4,r=mn(this.c),n=this.zone.offset(r-e),i=this.zone.offset(r+e),a=this.zone.offset(r-n*t),s=this.zone.offset(r-i*t);if(a===s)return[this];const o=r-a*t,l=r-s*t,c=da(o,a),d=da(l,s);return c.hour===d.hour&&c.minute===d.minute&&c.second===d.second&&c.millisecond===d.millisecond?[la(this,{ts:o}),la(this,{ts:l})]:[this]}get isInLeapYear(){return dn(this.year)}get daysInMonth(){return hn(this.year,this.month)}get daysInYear(){return this.isValid?un(this.year):NaN}get weeksInWeekYear(){return this.isValid?gn(this.weekYear):NaN}get weeksInLocalWeekYear(){return this.isValid?gn(this.localWeekYear,this.loc.getMinDaysInFirstWeek(),this.loc.getStartOfWeek()):NaN}resolvedLocaleOptions(e={}){const{locale:t,numberingSystem:r,calendar:n}=Vn.create(this.loc.clone(e),e).resolvedOptions(this);return{locale:t,numberingSystem:r,outputCalendar:n}}toUTC(e=0,t={}){return this.setZone(yr.instance(e),t)}toLocal(){return this.setZone(Or.defaultZone)}setZone(e,{keepLocalTime:t=!1,keepCalendarTime:r=!1}={}){if((e=br(e,Or.defaultZone)).equals(this.zone))return this;if(e.isValid){let n=this.ts;if(t||r){const t=e.offset(this.ts),r=this.toObject();[n]=ua(r,t,e)}return la(this,{ts:n,zone:e})}return Aa.invalid(aa(e))}reconfigure({locale:e,numberingSystem:t,outputCalendar:r}={}){return la(this,{loc:this.loc.clone({locale:e,numberingSystem:t,outputCalendar:r})})}setLocale(e){return this.reconfigure({locale:e})}set(e){if(!this.isValid)return this;const t=_n(e,Sa),{minDaysInFirstWeek:r,startOfWeek:n}=Hr(t,this.loc),i=!Jr(t.weekYear)||!Jr(t.weekNumber)||!Jr(t.weekday),a=!Jr(t.ordinal),s=!Jr(t.year),o=!Jr(t.month)||!Jr(t.day),l=s||o,c=t.weekYear||t.weekNumber;if((l||a)&&c)throw new wt("Can't mix weekYear/weekNumber units with year/month/day or ordinals");if(o&&a)throw new wt("Can't mix ordinal dates with month/day");let d;i?d=Wr({...Ur(this.c,r,n),...t},r,n):Jr(t.ordinal)?(d={...this.toObject(),...t},Jr(t.day)&&(d.day=Math.min(hn(d.year,d.month),d.day))):d=Zr({...Yr(this.c),...t});const[u,h]=ua(d,this.o,this.zone);return la(this,{ts:u,o:h})}plus(e){if(!this.isValid)return this;return la(this,ha(this,Ri.fromDurationLike(e)))}minus(e){if(!this.isValid)return this;return la(this,ha(this,Ri.fromDurationLike(e).negate()))}startOf(e,{useLocaleWeeks:t=!1}={}){if(!this.isValid)return this;const r={},n=Ri.normalizeUnit(e);switch(n){case"years":r.month=1;case"quarters":case"months":r.day=1;case"weeks":case"days":r.hour=0;case"hours":r.minute=0;case"minutes":r.second=0;case"seconds":r.millisecond=0}if("weeks"===n)if(t){const e=this.loc.getStartOfWeek(),{weekday:t}=this;t<e&&(r.weekNumber=this.weekNumber-1),r.weekday=e}else r.weekday=1;if("quarters"===n){const e=Math.ceil(this.month/3);r.month=3*(e-1)+1}return this.set(r)}endOf(e,t){return this.isValid?this.plus({[e]:1}).startOf(e,t).minus(1):this}toFormat(e,t={}){return this.isValid?Vn.create(this.loc.redefaultToEN(t)).formatDateTimeFromString(this,e):na}toLocaleString(e=xt,t={}){return this.isValid?Vn.create(this.loc.clone(t),e).formatDateTime(this):na}toLocaleParts(e={}){return this.isValid?Vn.create(this.loc.clone(e),e).formatDateTimeParts(this):[]}toISO({format:e="extended",suppressSeconds:t=!1,suppressMilliseconds:r=!1,includeOffset:n=!0,extendedZone:i=!1}={}){if(!this.isValid)return null;const a="extended"===e;let s=ga(this,a);return s+="T",s+=pa(this,a,t,r,n,i),s}toISODate({format:e="extended"}={}){return this.isValid?ga(this,"extended"===e):null}toISOWeekDate(){return fa(this,"kkkk-'W'WW-c")}toISOTime({suppressMilliseconds:e=!1,suppressSeconds:t=!1,includeOffset:r=!0,includePrefix:n=!1,extendedZone:i=!1,format:a="extended"}={}){if(!this.isValid)return null;return(n?"T":"")+pa(this,"extended"===a,t,e,r,i)}toRFC2822(){return fa(this,"EEE, dd LLL yyyy HH:mm:ss ZZZ",!1)}toHTTP(){return fa(this.toUTC(),"EEE, dd LLL yyyy HH:mm:ss 'GMT'")}toSQLDate(){return this.isValid?ga(this,!0):null}toSQLTime({includeOffset:e=!0,includeZone:t=!1,includeOffsetSpace:r=!0}={}){let n="HH:mm:ss.SSS";return(t||e)&&(r&&(n+=" "),t?n+="z":e&&(n+="ZZ")),fa(this,n,!0)}toSQL(e={}){return this.isValid?`${this.toSQLDate()} ${this.toSQLTime(e)}`:null}toString(){return this.isValid?this.toISO():na}[Symbol.for("nodejs.util.inspect.custom")](){return this.isValid?`DateTime { ts: ${this.toISO()}, zone: ${this.zone.name}, locale: ${this.locale} }`:`DateTime { Invalid, reason: ${this.invalidReason} }`}valueOf(){return this.toMillis()}toMillis(){return this.isValid?this.ts:NaN}toSeconds(){return this.isValid?this.ts/1e3:NaN}toUnixInteger(){return this.isValid?Math.floor(this.ts/1e3):NaN}toJSON(){return this.toISO()}toBSON(){return this.toJSDate()}toObject(e={}){if(!this.isValid)return{};const t={...this.c};return e.includeConfig&&(t.outputCalendar=this.outputCalendar,t.numberingSystem=this.loc.numberingSystem,t.locale=this.loc.locale),t}toJSDate(){return new Date(this.isValid?this.ts:NaN)}diff(e,t="milliseconds",r={}){if(!this.isValid||!e.isValid)return Ri.invalid("created by diffing an invalid DateTime");const n={locale:this.locale,numberingSystem:this.numberingSystem,...r},i=(o=t,Array.isArray(o)?o:[o]).map(Ri.normalizeUnit),a=e.valueOf()>this.valueOf(),s=Ui(a?this:e,a?e:this,i,n);var o;return a?s.negate():s}diffNow(e="milliseconds",t={}){return this.diff(Aa.now(),e,t)}until(e){return this.isValid?Li.fromDateTimes(this,e):this}hasSame(e,t,r){if(!this.isValid)return!1;const n=e.valueOf(),i=this.setZone(e.zone,{keepLocalTime:!0});return i.startOf(t,r)<=n&&n<=i.endOf(t,r)}equals(e){return this.isValid&&e.isValid&&this.valueOf()===e.valueOf()&&this.zone.equals(e.zone)&&this.loc.equals(e.loc)}toRelative(e={}){if(!this.isValid)return null;const t=e.base||Aa.fromObject({},{zone:this.zone}),r=e.padding?this<t?-e.padding:e.padding:0;let n=["years","months","days","hours","minutes","seconds"],i=e.unit;return Array.isArray(e.unit)&&(n=e.unit,i=void 0),za(t,this.plus(r),{...e,numeric:"always",units:n,unit:i})}toRelativeCalendar(e={}){return this.isValid?za(e.base||Aa.fromObject({},{zone:this.zone}),this,{...e,numeric:"auto",units:["years","months","days"],calendary:!0}):null}static min(...e){if(!e.every(Aa.isDateTime))throw new St("min requires all arguments be DateTimes");return en(e,(e=>e.valueOf()),Math.min)}static max(...e){if(!e.every(Aa.isDateTime))throw new St("max requires all arguments be DateTimes");return en(e,(e=>e.valueOf()),Math.max)}static fromFormatExplain(e,t,r={}){const{locale:n=null,numberingSystem:i=null}=r;return ta(gr.fromOpts({locale:n,numberingSystem:i,defaultToEN:!0}),e,t)}static fromStringExplain(e,t,r={}){return Aa.fromFormatExplain(e,t,r)}static buildFormatParser(e,t={}){const{locale:r=null,numberingSystem:n=null}=t,i=gr.fromOpts({locale:r,numberingSystem:n,defaultToEN:!0});return new ea(i,e)}static fromFormatParser(e,t,r={}){if(Jr(e)||Jr(t))throw new St("fromFormatParser requires an input string and a format parser");const{locale:n=null,numberingSystem:i=null}=r,a=gr.fromOpts({locale:n,numberingSystem:i,defaultToEN:!0});if(!a.equals(t.locale))throw new St(`fromFormatParser called with a locale of ${a}, but the format parser was created for ${t.locale}`);const{result:s,zone:o,specificOffset:l,invalidReason:c}=t.explainFromTokens(e);return c?Aa.invalid(c):ma(s,o,r,`format ${t.format}`,e,l)}static get DATE_SHORT(){return xt}static get DATE_MED(){return At}static get DATE_MED_WITH_WEEKDAY(){return Et}static get DATE_FULL(){return Nt}static get DATE_HUGE(){return Mt}static get TIME_SIMPLE(){return Ot}static get TIME_WITH_SECONDS(){return It}static get TIME_WITH_SHORT_OFFSET(){return Ct}static get TIME_WITH_LONG_OFFSET(){return jt}static get TIME_24_SIMPLE(){return Rt}static get TIME_24_WITH_SECONDS(){return Vt}static get TIME_24_WITH_SHORT_OFFSET(){return Lt}static get TIME_24_WITH_LONG_OFFSET(){return Pt}static get DATETIME_SHORT(){return Ft}static get DATETIME_SHORT_WITH_SECONDS(){return Ut}static get DATETIME_MED(){return Wt}static get DATETIME_MED_WITH_SECONDS(){return Yt}static get DATETIME_MED_WITH_WEEKDAY(){return Zt}static get DATETIME_FULL(){return Ht}static get DATETIME_FULL_WITH_SECONDS(){return qt}static get DATETIME_HUGE(){return Bt}static get DATETIME_HUGE_WITH_SECONDS(){return Jt}}function Ea(e){if(Aa.isDateTime(e))return e;if(e&&e.valueOf&&Gr(e.valueOf()))return Aa.fromJSDate(e);if(e&&"object"==typeof e)return Aa.fromObject(e);throw new St(`Unknown datetime argument: ${e}, of type ${typeof e}`)}const Na=(e,t,r,n,i,a,s)=>{if("today"===t||"tomorrow"===t){return`${e(`${`card.trash.${t}${n&&!a?"_from_till":""}${n&&!a&&s?"_short":""}`}`).replace("<START>",n??"").replace("<END>",i??"")}`}return e(`${`card.trash.day${n&&!a?"_from_till":""}${n&&!a&&s?"_short":""}`}`).replace("<DAY>",r).replace("<START>",n??"").replace("<END>",i??"")},Ma=(e,t,n,i,a)=>{if(!a)return"";const s=gt(a),o=new Date,l=new Date;l.setDate(l.getDate()+1);const c=r(o),d=r(l),u=r(e.date.start),h=e.isWholeDayEvent?void 0:e.date.start.toLocaleTimeString(a.language,{hour:"numeric",minute:"numeric"}),m=e.isWholeDayEvent?void 0:e.date.end.toLocaleTimeString(a.language,{hour:"numeric",minute:"numeric"});if(u===c||u===d)return Na(s,u===c?"today":"tomorrow",void 0,h,m,t,!1);if("counter"===n){const r=pt(new Date,e);return`${s(`card.trash.daysleft${r>1?"_more":""}${h&&!t?"_from_till":""}`).replace("<DAYS>",`${r}`).replace("<START>",h??"").replace("<END>",m??"")}`}if("weekday"===n)return e.date.start.toLocaleDateString(a.language,{weekday:"long"});const f="custom"!==n?e.date.start.toLocaleDateString(a.language,{weekday:"long",year:"numeric",month:"long",day:"numeric"}):(g=e.date.start,p=i??"dd.mm.YYYY",y=a.language,Aa.fromJSDate(g).setLocale(y).toFormat(p));var g,p,y;return Na(s,"day",f,h,m,t,!1)},Oa=l`
  --default-red: 244, 67, 54;
  --default-pink: 233, 30, 99;
  --default-purple: 146, 107, 199;
  --default-deep-purple: 110, 65, 171;
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
  --default-deep-orange: 255, 111, 34;
  --default-brown: 121, 85, 72;
  --default-light-grey: 189, 189, 189;
  --default-grey: 158, 158, 158;
  --default-dark-grey: 96, 96, 96;
  --default-blue-grey: 96, 125, 139;
  --default-black: 0, 0, 0;
  --default-white: 255, 255, 255;
  --default-disabled: 189, 189, 189;
`,Ia=l`
  --default-disabled: 111, 111, 111;
`,Ca=l`
  --spacing: var(--mush-spacing, 10px);

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
  --card-primary-color: var(
    --mush-card-primary-color,
    var(--primary-text-color)
  );
  --card-secondary-color: var(
    --mush-card-secondary-color,
    var(--primary-text-color)
  );
  --card-primary-letter-spacing: var(--mush-card-primary-letter-spacing, 0.1px);
  --card-secondary-letter-spacing: var(
    --mush-card-secondary-letter-spacing,
    0.4px
  );

  /* Chips */
  --chip-spacing: var(--mush-chip-spacing, 8px);
  --chip-padding: var(--mush-chip-padding, 0 0.25em);
  --chip-height: var(--mush-chip-height, 36px);
  --chip-border-radius: var(--mush-chip-border-radius, 19px);
  --chip-border-width: var(
    --mush-chip-border-width,
    var(--ha-card-border-width, 1px)
  );
  --chip-border-color: var(
    --mush-chip-border-color,
    var(--ha-card-border-color, var(--divider-color))
  );
  --chip-box-shadow: var(
    --mush-chip-box-shadow,
    var(--ha-card-box-shadow, "none")
  );
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
  --control-spacing: var(--mush-control-spacing, 12px);

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
  --icon-size: var(--mush-icon-size, 36px);
  --icon-symbol-size: var(--mush-icon-symbol-size, 0.6em);
`,ja=l`
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
  --rgb-state-media-player: var(
    --mush-rgb-state-media-player,
    var(--rgb-indigo)
  );
  --rgb-state-lock: var(--mush-rgb-state-lock, var(--rgb-blue));
  --rgb-state-number: var(--mush-rgb-state-number, var(--rgb-blue));
  --rgb-state-humidifier: var(--mush-rgb-state-humidifier, var(--rgb-purple));

  /* State alarm colors */
  --rgb-state-alarm-disarmed: var(
    --mush-rgb-state-alarm-disarmed,
    var(--rgb-info)
  );
  --rgb-state-alarm-armed: var(
    --mush-rgb-state-alarm-armed,
    var(--rgb-success)
  );
  --rgb-state-alarm-triggered: var(
    --mush-rgb-state-alarm-triggered,
    var(--rgb-danger)
  );

  /* State person colors */
  --rgb-state-person-home: var(
    --mush-rgb-state-person-home,
    var(--rgb-success)
  );
  --rgb-state-person-not-home: var(
    --mush-rgb-state-person-not-home,
    var(--rgb-danger)
  );
  --rgb-state-person-zone: var(--mush-rgb-state-person-zone, var(--rgb-info));
  --rgb-state-person-unknown: var(
    --mush-rgb-state-person-unknown,
    var(--rgb-grey)
  );

  /* State update colors */
  --rgb-state-update-on: var(--mush-rgb-state-update-on, var(--rgb-orange));
  --rgb-state-update-off: var(--mush-rgb-update-off, var(--rgb-green));
  --rgb-state-update-installing: var(
    --mush-rgb-update-installing,
    var(--rgb-blue)
  );

  /* State lock colors */
  --rgb-state-lock-locked: var(--mush-rgb-state-lock-locked, var(--rgb-green));
  --rgb-state-lock-unlocked: var(
    --mush-rgb-state-lock-unlocked,
    var(--rgb-red)
  );
  --rgb-state-lock-pending: var(
    --mush-rgb-state-lock-pending,
    var(--rgb-orange)
  );

  /* State cover colors */
  --rgb-state-cover-open: var(--mush-rgb-state-cover-open, var(--rgb-blue));
  --rgb-state-cover-closed: var(
    --mush-rgb-state-cover-closed,
    var(--rgb-disabled)
  );

  /* State climate colors */
  --rgb-state-climate-auto: var(
    --mush-rgb-state-climate-auto,
    var(--rgb-green)
  );
  --rgb-state-climate-cool: var(--mush-rgb-state-climate-cool, var(--rgb-blue));
  --rgb-state-climate-dry: var(--mush-rgb-state-climate-dry, var(--rgb-orange));
  --rgb-state-climate-fan-only: var(
    --mush-rgb-state-climate-fan-only,
    var(--rgb-teal)
  );
  --rgb-state-climate-heat: var(
    --mush-rgb-state-climate-heat,
    var(--rgb-deep-orange)
  );
  --rgb-state-climate-heat-cool: var(
    --mush-rgb-state-climate-heat-cool,
    var(--rgb-green)
  );
  --rgb-state-climate-idle: var(
    --mush-rgb-state-climate-idle,
    var(--rgb-disabled)
  );
  --rgb-state-climate-off: var(
    --mush-rgb-state-climate-off,
    var(--rgb-disabled)
  );
`,Ra=l`
    :host {
        ${Oa}
    }
    :host([dark-mode]) {
        ${Ia}
    }
    :host {
        ${ja}
        ${Ca}
    }
    ha-card {
        box-sizing: border-box;
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
`,Va=(e,t,r=!1,n=!0)=>{const i=t.color??"disabled",a=(e=>Boolean(e&&Array.isArray(e)))(e)?e:[e??"background"],s={},o=(e=>["primary","accent"].includes(e)?`var(--rgb-${e}-color)`:`var(--rgb-${e})`)(i),l=(a.includes("background")||a.includes("badge"))&&(!r&&"black"===i||r&&"white"===i),c="black"===i?"rgba(255, 255, 255, .7)":"rgba(0, 0, 0, .7)";return a.includes("icon")&&(s["--tile-color"]=`rgba(${o})`,s["--badge-color"]=`rgba(${o})`),a.includes("background")&&(s["--ha-card-background"]=`rgba(${o}, .7)`),a.includes("badge")&&(s["--icon-primary-color"]=`rgba(${o})`,s["--badge-color"]=`rgba(${o})`),l&&(s["--text-color"]=c,s["--card-primary-color"]=c,s["--card-secondary-color"]=c,s["--primary-text-color"]=c,s["--secondary-text-color"]=c),l&&n&&(s["--tile-color"]=c),s};class La extends se{constructor(){super(...arguments),this.withBackground=!1}getPictureUrl(){return e=this.item.picture,t=this.hass,e?`${t.hassUrl(e)}`:void 0;var e,t}renderPicture(e){return Y`
      <ha-tile-image
        .imageStyle=${"circle"}
        .imageUrl=${e}
      ></ha-tile-image>`}renderIcon(){return Y`
      <ha-tile-icon>
        <ha-state-icon
          .icon=${this.item?.icon}
          .hass=${this.hass}
        ></ha-state-icon>
      </ha-tile-icon>`}}t([he()],La.prototype,"item",void 0),t([he()],La.prototype,"hass",void 0),t([he()],La.prototype,"config",void 0);
/**
 * @license
 * Copyright 2018 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const Pa=Te(class extends De{constructor(e){if(super(e),e.type!==ze||"class"!==e.name||e.strings?.length>2)throw Error("`classMap()` can only be used in the `class` attribute and must be the only part in the attribute.")}render(e){return" "+Object.keys(e).filter((t=>e[t])).join(" ")+" "}update(e,[t]){if(void 0===this.st){this.st=new Set,void 0!==e.strings&&(this.nt=new Set(e.strings.join(" ").split(/\s/).filter((e=>""!==e))));for(const e in t)t[e]&&!this.nt?.has(e)&&this.st.add(e);return this.render(t)}const r=e.element.classList;for(const e of this.st)e in t||(r.remove(e),this.st.delete(e));for(const e in t){const n=!!t[e];n===this.st.has(e)||this.nt?.has(e)||(n?(r.add(e),this.st.add(e)):(r.remove(e),this.st.delete(e)))}return Z}});let Fa=class extends La{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,{color_mode:t,hide_time_range:r,day_style:n,layout:i,with_label:a,day_style_format:s}=this.config,{label:o}=e,l={...Va(t,e,this.hass.themes.darkMode)},c=Ma(e,r??!1,n,s,this.hass),d=pt(new Date,e),u={today:0===d,tomorrow:1===d,another:d>1},h=this.getPictureUrl(),m={vertical:"vertical"===i};return Y`
      <ha-card style=${Ee(l)} class=${Pa(u)}>
        <div class="background" aria-labelledby="info" ></div>
        <div class="container">
          <div class="content ${Pa(m)}" >
            <div class="icon-container">
              ${h?this.renderPicture(h):this.renderIcon()}
            </div>
            <ha-tile-info
              id="info"
              .primary=${a?o:c}
              .secondary=${a?c:void 0}
            ></ha-tile-info>
          </div>
        </div>
      </ha-card>
    `}static get styles(){return[Ra,l`

        :host {
          --tile-color: var(--state-inactive-color);
          -webkit-tap-highlight-color: transparent;
        }
        ha-card:has(.background:focus-visible) {
          --shadow-default: var(--ha-card-box-shadow, 0 0 0 0 transparent);
          --shadow-focus: 0 0 0 1px var(--tile-color);
          border-color: var(--tile-color);
          box-shadow: var(--shadow-default), var(--shadow-focus);
        }
        ha-card {
          --ha-ripple-color: var(--tile-color);
          --ha-ripple-hover-opacity: 0.04;
          --ha-ripple-pressed-opacity: 0.12;
          height: 100%;
          transition:
            box-shadow 180ms ease-in-out,
            border-color 180ms ease-in-out;
          display: flex;
          flex-direction: column;
          justify-content: space-between;
        }
        ha-card.active {
          --tile-color: var(--state-icon-color);
        }
        [role="button"] {
          cursor: pointer;
        }
        [role="button"]:focus {
          outline: none;
        }
        .background {
          position: absolute;
          top: 0;
          left: 0;
          bottom: 0;
          right: 0;
          border-radius: var(--ha-card-border-radius, 12px);
          margin: calc(-1 * var(--ha-card-border-width, 1px));
          overflow: hidden;
        }
        .container {
          margin: calc(-1 * var(--ha-card-border-width, 1px));
          display: flex;
          flex-direction: column;
          flex: 1;
        }
        .content {
          position: relative;
          display: flex;
          flex-direction: row;
          align-items: center;
          padding: 10px;
          flex: 1;
          box-sizing: border-box;
          pointer-events: none;
        }
        .vertical {
          flex-direction: column;
          text-align: center;
          justify-content: center;
        }
        .vertical .icon-container {
          margin-bottom: 10px;
          margin-right: 0;
          margin-inline-start: initial;
          margin-inline-end: initial;
        }
        .vertical ha-tile-info {
          width: 100%;
          flex: none;
        }
        .icon-container {
          position: relative;
          flex: none;
          margin-right: 10px;
          margin-inline-start: initial;
          margin-inline-end: 10px;
          direction: var(--direction);
          transition: transform 180ms ease-in-out;
        }
        .icon-container ha-tile-icon,
        .icon-container ha-tile-image {
          --tile-icon-color: var(--tile-color);
          user-select: none;
          -ms-user-select: none;
          -webkit-user-select: none;
          -moz-user-select: none;
        }
        .icon-container ha-tile-badge {
          position: absolute;
          top: -3px;
          right: -3px;
          inset-inline-end: -3px;
          inset-inline-start: initial;
        }
        .icon-container[role="button"] {
          pointer-events: auto;
        }
        .icon-container[role="button"]:focus-visible,
        .icon-container[role="button"]:active {
          transform: scale(1.2);
        }
        ha-tile-info {
          position: relative;
          min-width: 0;
          transition: background-color 180ms ease-in-out;
          box-sizing: border-box;
        }
        hui-card-features {
          --feature-color: var(--tile-color);
        }

        ha-tile-icon[data-domain="alarm_control_panel"][data-state="pending"],
        ha-tile-icon[data-domain="alarm_control_panel"][data-state="arming"],
        ha-tile-icon[data-domain="alarm_control_panel"][data-state="triggered"],
        ha-tile-icon[data-domain="lock"][data-state="jammed"] {
          animation: pulse 1s infinite;
        }

        ha-tile-badge.not-found {
          --tile-badge-background-color: var(--red-color);
        }

        @keyframes pulse {
          0% {
            opacity: 1;
          }
          50% {
            opacity: 0;
          }
          100% {
            opacity: 1;
          }
        }
      `]}};Fa=t([le(`${me}-item-card`)],Fa);let Ua=class extends se{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e=this.config.items_per_row??1,t=Ee({"grid-template-columns":`repeat(${e}, calc(calc(100% - calc(${e-1} * var(--ha-section-grid-column-gap, 8px))) / ${e}))`});return Y`
        <div style=${t} class="card-container">
          ${this.items.map(((e,t)=>Y`
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
          grid-gap: var(--ha-section-grid-column-gap, 8px);
          grid-columns: auto;
        }
        trash-card-item-card {
          grid-row: auto / span 1;
        }
      `]}};t([he()],Ua.prototype,"items",void 0),t([ue({attribute:!1})],Ua.prototype,"hass",void 0),t([he()],Ua.prototype,"config",void 0),Ua=t([le(`${me}-cards-container`)],Ua);let Wa=class extends La{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,{color_mode:t,hide_time_range:r,day_style:n,day_style_format:i,with_label:a}=this.config,s={...Va(t,e,this.hass.themes.darkMode)},o=Ma(e,r??!1,n,i,this.hass),l=pt(new Date,e),c={today:0===l,tomorrow:1===l,another:l>1},d=this.getPictureUrl();this.withBackground=!0;const u={...this.config,show_name:!0};return Y`
      <ha-badge
        .type="badge"
        .hass=${this.hass}
        .config=${u}
        style=${Ee(s)}
        class=${Pa(c)}
        .iconOnly=${!a&&!o}
        .label=${a?e.label:H}
      >
        ${d?Y`<img slot="icon" src=${d} aria-hidden />`:Y`<ha-state-icon
            slot="icon"
            .hass=${this.hass}
            .icon=${e.icon}
          ></ha-state-icon>`}
        ${o}
      </ha-badge>`}};Wa=t([le(`${me}-item-chip`)],Wa);let Ya=class extends se{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e={"chip-container":!0,"align-justify":"space"===this.config.alignment_style,"align-center":"center"===this.config.alignment_style,"align-end":"right"===this.config.alignment_style};return Y`
      <div class=${Pa(e)}>
        ${this.items.map(((e,t)=>Y`
          <trash-card-item-chip
            key=${`card-${t}-${e.content.uid}`}
            .item=${e}
            .config=${this.config}
            .hass=${this.hass}
          >
          </trash-card-item-card>
        `))}
    </div>
  `}static get styles(){return[Ra,l`
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
      `]}};t([he()],Ya.prototype,"items",void 0),t([ue({attribute:!1})],Ya.prototype,"hass",void 0),t([he()],Ya.prototype,"config",void 0),Ya=t([le(`${me}-chips-container`)],Ya);let Za=class extends La{render(){if(!this.hass||!this.item||!this.config)return H;const e=this.item,t={...Va(["icon","badge"],e,this.hass.themes.darkMode,!1),"--mdc-icon-size":`${this.config.icon_size??40}px`,"--trash-card-icon-size":`${this.config.icon_size??40}px`},r=pt(new Date,e),n={today:0===r,tomorrow:1===r,another:r>1,nextEvent:this.item.nextEvent,futureEvent:!this.item.nextEvent},i=this.getPictureUrl();return this.withBackground=!0,Y`
      <ha-card style=${Ee(t)} class=${Pa(n)}>
          <div class="container">
          <div class="content">
          <div class="icon-container">
          ${i?this.renderPicture(i):Y`<ha-icon .icon=${this.item.icon} .hass=${this.hass}></ha-icon>`}
              </div>
          </div>
        </div>
        <span class="badge" >${r}</span>
      </ha-card>
    `}static get styles(){return[Ra,l`
        :host {
          --ha-card-border-width: 0px;
          --ha-card-background: transparent;
        }
        ha-card {
          display: grid;
        }
        .icon-container {
          margin-bottom: 5px;
          display: block;
        }
        .badge {
          display: inline-grid;
          border-radius: 15px;
          background-color: var(--badge-color);
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
      `]}};Za=t([le(`${me}-icon-card`)],Za);let Ha=class extends se{setConfig(e){this.config=e}setItems(e){this.items=e}setHass(e){this.hass=e}render(){if(!this.config||!this.hass)return H;if(!this.items||0===this.items.length)return H;const e=this.items.length,t=Ee({"grid-template-columns":`repeat(${e}, calc(calc(100% - calc(${e-1} * var(--ha-section-grid-column-gap, 8px))) / ${e}))`});return Y`
        <div style=${t} class="icons-container">
          ${this.items.map(((e,t)=>Y`
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
          grid-gap: var(--ha-section-grid-column-gap, 8px);
        }
        trash-card-icon-card {
          grid-row: auto / span 1;
        }
      `]}};t([he()],Ha.prototype,"items",void 0),t([ue({attribute:!1})],Ha.prototype,"hass",void 0),t([he()],Ha.prototype,"config",void 0),Ha=t([le(`${me}-icons-container`)],Ha);let qa=class extends se{render(){return Y`
          <div class="title">
            <h3><slot name="title"></slot></h3>
            <div><slot name="title-icon"></slot></div>
          </div>`}static get styles(){return[l`
      .title {
          display: grid;
          color: rgb(var(--rgb-pink));
          grid-template-columns: auto  50px
        }
      `]}};qa=t([le(`${me}-title`)],qa);let Ba=class extends se{render(){if(!this.item)return H;const{message:e,data:t}=this.item;return Y`
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
      `]}};t([he()],Ba.prototype,"item",void 0),Ba=t([le(`${me}-logrow`)],Ba);let Ja=class extends se{copyDebugLogToClipboard(e){e.stopPropagation(),navigator.clipboard.writeText(JSON.stringify(this.debugger?.getLogs()??{})).then((()=>{alert("Debug data copied to clipboard")}))}render(){return this.debugger?Y`<ha-card class="debug-container">
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
          ${this.debugger.getLogs().map((e=>Y`
            <trash-card-logrow
              .item=${e}
            ></trash-card-logrow>
            `))}
        </div>
    </ha-card>`:H}static get styles(){return[Ra,l`
        .debug-container {
          margin-bottom: 5px;
          border: rgb(var(--rgb-pink)) dotted 1px;
          opacity: 0.7;
        }
      `]}};t([he()],Ja.prototype,"debugger",void 0),Ja=t([le(`${me}-debug-container`)],Ja),(t=>{const r=window;r.customCards=r.customCards||[],r.customCards.push({...t,preview:!0,documentationURL:`${e}/blob/main/README.md`})})({type:me,name:"TrashCard",description:"TrashCard - indicates what type of trash will be picked up next based on your calendar entries 🗑️"});const Ga={tap_action:{action:"more-info"},hold_action:{action:"more-info"},with_label:!0,debug:!1};let Ka=class extends se{constructor(){super(...arguments),this.startDate=new Date,this.endDate=new Date}static async getConfigElement(){return await Promise.resolve().then((function(){return js})),document.createElement(fe)}static async getStubConfig(e){const t=Object.keys(e.states);return{type:`custom:${me}`,entities:[t[0]]}}get hass(){return this._hass}set hass(e){this._hass=e,this.shadowRoot?.querySelectorAll("div > *").forEach((t=>{t.setHass(e)}))}setConfig(e){this.config={...Ga,...Se(e)?$e(e):e},this.debugger=new ge}setDateRange(){this.startDate=new Date,this.endDate=new Date,this.endDate.setDate(this.endDate.getDate()+(this.config?.next_days??2)+1)}fetchCurrentTrashData(){if(!this.hass||!this.config||!this.debugger)return;this.setDateRange();const e=r(this.startDate),t=r(this.endDate),n=((e,t)=>{const[r,n,i]=t.split(":");return!(e.getHours()<Number(r))&&(e.getHours()>Number(r)||e.getMinutes()>Number(n)||e.getSeconds()>=Number(i))})(new Date,this.config.drop_todayevents_from??"10:00:00"),i=be();ke(this.hass,this.config.entities,{start:e,end:t,dropAfter:n},this.debugger,this.config,i).then((e=>{this.currentItems=e,this.lastChanged=new Date}))}getRefreshRate(){return 60*(this.config?.refresh_rate??60)*1e3}shouldUpdate(e){return!!e.has("currentItems")||(e.delete("currentItems"),(!this.lastChanged||e.has("config")||Date.now()-this.lastChanged.getTime()>this.getRefreshRate())&&this.fetchCurrentTrashData(),!1)}createBaseContainerElement(e){try{const t=`trash-card-${e??"card"}s-container`;if(customElements.get(t)){const e=document.createElement(t,this.config);return e.setConfig(this.config),e.setItems(this.currentItems),e}const r=document.createElement(t);return customElements.whenDefined(t).then((()=>{customElements.upgrade(r),r.setConfig(this.config),r.setItems(this.currentItems)})).catch((()=>{})),r}catch{return}}render(){if(!this.config||!this.hass)return H;if(!this.currentItems||0===this.currentItems.length)return this.config.debug?Y`<trash-card-debug-container .debugger=${this.debugger}></trash-card-debug-card>`:H;const e=this.createBaseContainerElement(this.config.card_style);return e?(e.setHass(this.hass),Y`
      ${this.config.debug?Y`<trash-card-debug-container .debugger=${this.debugger}></trash-card-debug-card>`:""}
      ${e}`):H}};t([he()],Ka.prototype,"_hass",void 0),t([he()],Ka.prototype,"config",void 0),t([ue()],Ka.prototype,"currentItems",void 0),t([ue()],Ka.prototype,"startDate",void 0),t([ue()],Ka.prototype,"endDate",void 0),t([ue()],Ka.prototype,"debugger",void 0),Ka=t([le(me)],Ka),console.info("%c🗑️ TrashCard 2.3.2","background-color: #ef5350; color: #ffffff");class Qa extends TypeError{constructor(e,t){let r;const{message:n,explanation:i,...a}=e,{path:s}=e,o=0===s.length?n:`At path: ${s.join(".")} -- ${n}`;super(i??o),null!=i&&(this.cause=o),Object.assign(this,a),this.name=this.constructor.name,this.failures=()=>r??(r=[e,...t()])}}function Xa(e){return"object"==typeof e&&null!=e}function es(e){return Xa(e)&&!Array.isArray(e)}function ts(e){return"symbol"==typeof e?e.toString():"string"==typeof e?JSON.stringify(e):`${e}`}function rs(e,t,r,n){if(!0===e)return;!1===e?e={}:"string"==typeof e&&(e={message:e});const{path:i,branch:a}=t,{type:s}=r,{refinement:o,message:l=`Expected a value of type \`${s}\`${o?` with refinement \`${o}\``:""}, but received: \`${ts(n)}\``}=e;return{value:n,type:s,refinement:o,key:i[i.length-1],path:i,branch:a,...e,message:l}}function*ns(e,t,r,n){(function(e){return Xa(e)&&"function"==typeof e[Symbol.iterator]})(e)||(e=[e]);for(const i of e){const e=rs(i,t,r,n);e&&(yield e)}}function*is(e,t,r={}){const{path:n=[],branch:i=[e],coerce:a=!1,mask:s=!1}=r,o={path:n,branch:i,mask:s};a&&(e=t.coercer(e,o));let l="valid";for(const n of t.validator(e,o))n.explanation=r.message,l="not_valid",yield[n,void 0];for(let[c,d,u]of t.entries(e,o)){const t=is(d,u,{path:void 0===c?n:[...n,c],branch:void 0===c?i:[...i,d],coerce:a,mask:s,message:r.message});for(const r of t)r[0]?(l=null!=r[0].refinement?"not_refined":"not_valid",yield[r[0],void 0]):a&&(d=r[1],void 0===c?e=d:e instanceof Map?e.set(c,d):e instanceof Set?e.add(d):Xa(e)&&(void 0!==d||c in e)&&(e[c]=d))}if("not_valid"!==l)for(const n of t.refiner(e,o))n.explanation=r.message,l="not_refined",yield[n,void 0];"valid"===l&&(yield[void 0,e])}class as{constructor(e){const{type:t,schema:r,validator:n,refiner:i,coercer:a=(e=>e),entries:s=function*(){}}=e;this.type=t,this.schema=r,this.entries=s,this.coercer=a,this.validator=n?(e,t)=>ns(n(e,t),t,this,e):()=>[],this.refiner=i?(e,t)=>ns(i(e,t),t,this,e):()=>[]}assert(e,t){return ss(e,this,t)}create(e,t){return function(e,t,r){const n=os(e,t,{coerce:!0,message:r});if(n[0])throw n[0];return n[1]}(e,this,t)}is(e){return function(e,t){const r=os(e,t);return!r[0]}(e,this)}mask(e,t){return function(e,t,r){const n=os(e,t,{coerce:!0,mask:!0,message:r});if(n[0])throw n[0];return n[1]}(e,this,t)}validate(e,t={}){return os(e,this,t)}}function ss(e,t,r){const n=os(e,t,{message:r});if(n[0])throw n[0]}function os(e,t,r={}){const n=is(e,t,r),i=function(e){const{done:t,value:r}=e.next();return t?void 0:r}(n);if(i[0]){const e=new Qa(i[0],(function*(){for(const e of n)e[0]&&(yield e[0])}));return[e,void 0]}return[void 0,i[1]]}function ls(e,t){return new as({type:e,schema:null,validator:t})}function cs(){return ls("any",(()=>!0))}function ds(e){return new as({type:"array",schema:e,*entries(t){if(e&&Array.isArray(t))for(const[r,n]of t.entries())yield[r,n,e]},coercer:e=>Array.isArray(e)?e.slice():e,validator:e=>Array.isArray(e)||`Expected an array value, but received: ${ts(e)}`})}function us(){return ls("boolean",(e=>"boolean"==typeof e))}function hs(){return ls("integer",(e=>"number"==typeof e&&!isNaN(e)&&Number.isInteger(e)||`Expected an integer, but received: ${ts(e)}`))}function ms(e){const t=ts(e),r=typeof e;return new as({type:"literal",schema:"string"===r||"number"===r||"boolean"===r?e:null,validator:r=>r===e||`Expected the literal \`${t}\`, but received: ${ts(r)}`})}function fs(){return ls("number",(e=>"number"==typeof e&&!isNaN(e)||`Expected a number, but received: ${ts(e)}`))}function gs(e){const t=e?Object.keys(e):[],r=ls("never",(()=>!1));return new as({type:"object",schema:e||null,*entries(n){if(e&&Xa(n)){const i=new Set(Object.keys(n));for(const r of t)i.delete(r),yield[r,n[r],e[r]];for(const e of i)yield[e,n[e],r]}},validator:e=>es(e)||`Expected an object, but received: ${ts(e)}`,coercer(t,r){if(!es(t))return t;const n={...t};if(r.mask&&e)for(const t in n)void 0===e[t]&&delete n[t];return n}})}function ps(e){return new as({...e,validator:(t,r)=>void 0===t||e.validator(t,r),refiner:(t,r)=>void 0===t||e.refiner(t,r)})}function ys(){return ls("string",(e=>"string"==typeof e||`Expected a string, but received: ${ts(e)}`))}function vs(e){const t=e.map((e=>e.type)).join(" | ");return new as({type:"union",schema:null,coercer(t,r){for(const n of e){const[e,i]=n.validate(t,{coerce:!0,mask:r.mask});if(!e)return i}return t},validator(r,n){const i=[];for(const t of e){const[...e]=is(r,t,n),[a]=e;if(!a[0])return[];for(const[t]of e)t&&i.push(t)}return[`Expected the value to satisfy a union of \`${t}\`, but received: ${ts(r)}`,...i]}})}const bs=e=>!!e&&e.themes.darkMode;var _s=Number.isNaN||function(e){return"number"==typeof e&&e!=e};function ws(e,t){if(e.length!==t.length)return!1;for(var r=0;r<e.length;r++)if(n=e[r],i=t[r],!(n===i||_s(n)&&_s(i)))return!1;var n,i;return!0}const ks=gs({index:ps(fs()),view_index:ps(fs()),view_layout:cs(),type:ys(),layout_options:cs(),visibility:cs()}),Ss=["default","counter","weekday","custom"],$s=["card","chip","icon"],zs=["left","center","right","space"],Ts=["background","icon"],Ds=function(...e){const t="type"===e[0].type,r=e.map((e=>e.schema)),n=Object.assign({},...r);return t?function(e){const t=Object.keys(e);return new as({type:"type",schema:e,*entries(r){if(Xa(r))for(const n of t)yield[n,r[n],e[n]]},validator:e=>es(e)||`Expected an object, but received: ${ts(e)}`,coercer:e=>es(e)?{...e}:e})}(n):gs(n)}(ks,gs({entities:ps(ds(ys())),name:ps(ys()),layout:ps(vs([ms("horizontal"),ms("vertical"),ms("default")])),fill_container:ps(us()),filter_events:ps(us()),full_size:ps(us()),use_summary:ps(us()),hide_time_range:ps(us()),next_days:ps(hs()),items_per_row:ps(hs()),refresh_rate:ps(hs()),drop_todayevents_from:ps(ys()),event_grouping:ps(us()),day_style:ps(vs([ms(Ss[0]),ms(Ss[1]),ms(Ss[2]),ms(Ss[3])])),day_style_format:ps(ys()),card_style:ps(vs([ms($s[0]),ms($s[1]),ms($s[2])])),alignment_style:ps(vs([ms(zs[0]),ms(zs[1]),ms(zs[2]),ms(zs[3])])),color_mode:ps(vs([ms(Ts[0]),ms(Ts[1])])),debug:ps(us()),icon_size:ps(hs()),with_label:ps(us()),pattern:ps(ds(gs({color:ps(ys()),icon:ps(ys()),label:ps(ys()),pattern:ps(ys()),picture:ps(ys()),type:ys()})))})),xs=e=>[{name:"icon",label:e("ui.panel.lovelace.editor.card.generic.icon"),selector:{icon:{}},context:{icon_entity:"entity"}},{name:"color",label:e("ui.panel.lovelace.editor.card.tile.color"),selector:{ui_color:{}}}],As=(e,t,r)=>{const n=[{type:"grid",name:"",schema:[{name:"filter_events",label:e("editor.card.generic.filter_events"),selector:{boolean:{}}},{name:"drop_todayevents_from",label:e("editor.card.generic.drop_todayevents_from"),default:{hours:11,minutes:0,seconds:0},selector:{time:{}}},{name:"next_days",label:e("editor.card.generic.next_days"),selector:{number:{min:1,max:365,step:1,mode:"box"}}},{name:"refresh_rate",label:e("editor.form.refresh_rate.title"),helper:e("editor.form.refresh_rate.helper"),selector:{number:{min:5,max:1440,step:5,mode:"box"}}}]}],i=[{name:"card_style",label:e("editor.form.card_style.title"),selector:{select:{options:[...$s].map((t=>({value:t,label:e(`editor.form.card_style.values.${t}`)}))),mode:"dropdown"}}},{type:"grid",name:"",schema:[..."icon"===t.card_style?[{name:"icon_size",label:e("editor.card.generic.icon_size"),selector:{number:{min:10,max:160,step:1,mode:"box"}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"day_style",label:e("editor.form.day_style.title"),selector:{select:{options:[...Ss].map((t=>({value:t,label:e(`editor.form.day_style.values.${t}`)}))),mode:"dropdown"}}}]:[],..."card"!==t.card_style&&"chip"!==t.card_style||"custom"!==t.day_style?[]:[{name:"day_style_format",label:e("editor.form.day_style_format.title"),helper:e("editor.form.day_style_format.helper"),selector:{text:{}}}],..."card"===t.card_style||"chip"===t.card_style?[{name:"hide_time_range",label:e("editor.card.generic.hide_time_range"),selector:{boolean:{}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"with_label",label:e("editor.card.generic.with_label"),selector:{boolean:{}}}]:[],...!t.with_label||"card"!==t.card_style&&"chip"!==t.card_style?[]:[{name:"use_summary",label:e("editor.card.generic.use_summary"),selector:{boolean:{}}}],..."card"===t.card_style||"chip"===t.card_style?[{name:"event_grouping",label:e("editor.card.generic.event_grouping"),selector:{boolean:{default:!0}}}]:[],..."card"===t.card_style||"chip"===t.card_style?[{name:"color_mode",label:e("editor.form.color_mode.title"),selector:{select:{options:[...Ts].map((t=>({value:t,label:e(`editor.form.color_mode.values.${t}`)}))),mode:"dropdown"}}}]:[]]},..."card"===t.card_style?[{type:"grid",name:"",schema:[{name:"layout",label:e("editor.card.generic.layout"),selector:{mush_layout:{}}}]},{type:"grid",name:"",schema:[{name:"full_size",label:e("editor.card.generic.full_size"),selector:{boolean:{}}},{name:"items_per_row",label:r("ui.panel.lovelace.editor.card.grid.columns"),selector:{number:{min:1,max:6,step:1,mode:"box"}}}]}]:[],..."chip"===t.card_style?[{type:"grid",name:"",schema:[{name:"alignment_style",label:e("editor.form.alignment_style.title"),selector:{select:{options:[...zs].map((t=>({value:t,label:e(`editor.form.alignment_style.values.${t}`)}))),mode:"dropdown"}}}]}]:[]];return[{name:"entities",selector:{entity:{domain:"calendar",multiple:!0}}},{type:"expandable",name:"",title:e("editor.form.tabs.settings"),icon:"mdi:cog",schema:n},{type:"expandable",name:"",title:e("editor.form.tabs.appearance"),icon:"mdi:palette",schema:i}]},Es=(e,t,r,n)=>{n=n??{},r=r||{};const i=new Event(t,{bubbles:n.bubbles??!0,cancelable:Boolean(n.cancelable),composed:n.composed??!0});return i.detail=r,e.dispatchEvent(i),i},Ns={},Ms=Te(class extends De{constructor(){super(...arguments),this.ot=Ns}render(e,t){return t()}update(e,[t,r]){if(Array.isArray(t)){if(Array.isArray(this.ot)&&this.ot.length===t.length&&t.every(((e,t)=>e===this.ot[t])))return Z}else if(this.ot===t)return Z;return this.ot=Array.isArray(t)?Array.from(t):t,this.render(t,r)}});let Os=class extends se{constructor(){super(...arguments),this.attached=!1}connectedCallback(){super.connectedCallback(),this.attached=!0}disconnectedCallback(){super.disconnectedCallback(),this.attached=!1}updated(e){super.updated(e);const t=e.has("attached"),r=e.has("pattern");(r||t)&&r&&this.handleSettingsChanged()}async handleSettingsChanged(){await this.updateComplete}render(){if(!this.hass||!this.pattern)return H;const e=gt(this.hass);return Y`
      <div class="settings">
      ${Ms([this.pattern],(()=>this.pattern.map(((t,r)=>Y`
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
    </div>`}editItem(e){const{index:t}=e.currentTarget;Es(this,"edit-pattern-item",{subElementConfig:{index:t,key:t,elementConfig:this.pattern[t]}})}deleteItem(e){const{index:t}=e.currentTarget;Es(this,"delete-pattern-item",{index:t})}createItem(e){const{index:t}=e.currentTarget;Es(this,"create-pattern-item",{index:t})}static get styles(){return[l`
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
        `]}};t([ue({attribute:!1})],Os.prototype,"hass",void 0),t([he()],Os.prototype,"pattern",void 0),t([he()],Os.prototype,"attached",void 0),Os=t([le("trash-card-pattern-editor")],Os);const Is={event_grouping:!0,drop_todayevents_from:"10:00:00",next_days:2,pattern:[{icon:"mdi:flower",color:"lime",type:"organic"},{icon:"mdi:newspaper",color:"blue",type:"paper"},{icon:"mdi:recycle-variant",color:"amber",type:"recycle"},{icon:"mdi:trash-can-outline",color:"grey",type:"waste"},{icon:"mdi:dump-truck",color:"purple",type:"others"}],day_style:"default",day_style_format:"yyyy.MM.dd",card_style:"card",alignment_style:"left",color_mode:"background",items_per_row:1,refresh_rate:60,with_label:!0};let Cs=class extends se{constructor(){super(...arguments),this.schema=function(e,t){void 0===t&&(t=ws);var r=null;function n(){for(var n=[],i=0;i<arguments.length;i++)n[i]=arguments[i];if(r&&r.lastThis===this&&t(n,r.lastArgs))return r.lastResult;var a=e.apply(this,n);return r={lastResult:a,lastArgs:n,lastThis:this},a}return n.clear=function(){r=null},n}(As),this.computeLabel=e=>this.hass?e.label??"":e.label,this.computeHelper=e=>this.hass?e.helper??"":e.name}setConfig(e){Se(e)?Es(this,"config-changed",{config:{...Is,...$e(e)}}):(ss(e,Ds),this.config={...Is,...e})}updated(e){if(super.updated(e),e.has("hass")&&this.hass){const t=bs(e.get("hass")),r=bs(this.hass);t!==r&&this.toggleAttribute("dark-mode",r)}}renderFormPatternsEditor(){if(!this.hass)return H;const e=gt(this.hass);if(this.subElementEditorConfig){const t="others"===this.subElementEditorConfig.elementConfig?.type?xs(this.hass.localize):((e,t)=>[{label:e("editor.card.trash.pattern.fields.label"),name:"label",selector:{text:{}}},...xs(t),{label:e("editor.card.trash.pattern.fields.pattern"),name:"pattern",selector:{text:{}}},{label:e("editor.card.trash.pattern.fields.picture_url"),helper:e("editor.card.trash.pattern.fields.picture_url_description"),name:"picture",selector:{text:{}},context:{icon_entity:"entity"}}])(e,this.hass.localize);return Y`
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
      `}return Y`
      <trash-card-pattern-editor
        .hass=${this.hass}
          .pattern=${this.config.pattern}
          @delete-pattern-item=${this.deletePatternItem}  
          @create-pattern-item=${this.createPatternItem}  
          @edit-pattern-item=${this.editPatternItem}
          @settings-changed=${this.valueChanged}
      ></trash-card-pattern-editor>`}goBack(){this.subElementEditorConfig=void 0}handleSubElementChanged(e){if(e.stopPropagation(),!this.config||!this.hass||!this.subElementEditorConfig)return;const t=this.subElementEditorConfig.key,{value:r}=e.detail,n={...this.config,pattern:[...this.config.pattern??[]]};n.pattern[t]=r,this.subElementEditorConfig={...this.subElementEditorConfig,elementConfig:r},Es(this,"config-changed",{config:n})}editPatternItem(e){this.subElementEditorConfig=e.detail.subElementConfig}createPatternItem(e){if(e.stopPropagation(),!this.config||!this.hass)return;const t=gt(this.hass),r={...this.config,pattern:[...this.config.pattern??[]]},n=r.pattern.filter((e=>"custom"===e.type)).length+1;r.pattern.push({label:`${t("editor.card.trash.pattern.new_custom_label")} ${n}`,icon:"mdi:calendar",color:"pink",type:"custom"}),Es(this,"config-changed",{config:r})}deletePatternItem(e){if(e.stopPropagation(),!this.config||!this.hass)return;const t={...this.config,pattern:[...this.config.pattern??[]]};t.pattern.splice(e.detail.index,1),Es(this,"config-changed",{config:t})}render(){if(!this.hass||!this.config)return H;const e=gt(this.hass),t=this.schema(e,this.config,this.hass.localize);return Y`
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

    `}valueChanged(e){const t={...e.detail.value};"background"===t.color_mode&&delete t.color_mode,"default"===t.day_style&&delete t.day_style,"custom"!==t.day_style&&delete t.day_style_format,"card"===t.card_style&&delete t.card_style,Es(this,"config-changed",{config:t})}static get styles(){return[l`
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
      `]}};t([ue({attribute:!1})],Cs.prototype,"hass",void 0),t([he()],Cs.prototype,"config",void 0),t([he()],Cs.prototype,"subElementEditorConfig",void 0),t([he()],Cs.prototype,"schema",void 0),Cs=t([le(fe)],Cs);var js=Object.freeze({__proto__:null,get TrashCardEditor(){return Cs}});export{Ka as TrashCard};
