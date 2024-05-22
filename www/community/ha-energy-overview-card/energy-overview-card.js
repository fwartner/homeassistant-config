function t(t,e,i,n){var s,o=arguments.length,r=o<3?e:null===n?n=Object.getOwnPropertyDescriptor(e,i):n;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)r=Reflect.decorate(t,e,i,n);else for(var a=t.length-1;a>=0;a--)(s=t[a])&&(r=(o<3?s(r):o>3?s(e,i,r):s(e,i))||r);return o>3&&r&&Object.defineProperty(e,i,r),r}const e=window,i=e.ShadowRoot&&(void 0===e.ShadyCSS||e.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,n=Symbol(),s=new WeakMap;let o=class{constructor(t,e,i){if(this._$cssResult$=!0,i!==n)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=t,this.t=e}get styleSheet(){let t=this.o;const e=this.t;if(i&&void 0===t){const i=void 0!==e&&1===e.length;i&&(t=s.get(e)),void 0===t&&((this.o=t=new CSSStyleSheet).replaceSync(this.cssText),i&&s.set(e,t))}return t}toString(){return this.cssText}};const r=(t,...e)=>{const i=1===t.length?t[0]:e.reduce((e,i,n)=>e+(t=>{if(!0===t._$cssResult$)return t.cssText;if("number"==typeof t)return t;throw Error("Value passed to 'css' function must be a 'css' function result: "+t+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(i)+t[n+1],t[0]);return new o(i,t,n)},a=i?t=>t:t=>t instanceof CSSStyleSheet?(t=>{let e="";for(const i of t.cssRules)e+=i.cssText;return(t=>new o("string"==typeof t?t:t+"",void 0,n))(e)})(t):t;var l;const c=window,h=c.trustedTypes,d=h?h.emptyScript:"",u=c.reactiveElementPolyfillSupport,p={toAttribute(t,e){switch(e){case Boolean:t=t?d:null;break;case Object:case Array:t=null==t?t:JSON.stringify(t)}return t},fromAttribute(t,e){let i=t;switch(e){case Boolean:i=null!==t;break;case Number:i=null===t?null:Number(t);break;case Object:case Array:try{i=JSON.parse(t)}catch(t){i=null}}return i}},v=(t,e)=>e!==t&&(e==e||t==t),m={attribute:!0,type:String,converter:p,reflect:!1,hasChanged:v};let g=class extends HTMLElement{constructor(){super(),this._$Ei=new Map,this.isUpdatePending=!1,this.hasUpdated=!1,this._$El=null,this.u()}static addInitializer(t){var e;this.finalize(),(null!==(e=this.h)&&void 0!==e?e:this.h=[]).push(t)}static get observedAttributes(){this.finalize();const t=[];return this.elementProperties.forEach((e,i)=>{const n=this._$Ep(i,e);void 0!==n&&(this._$Ev.set(n,i),t.push(n))}),t}static createProperty(t,e=m){if(e.state&&(e.attribute=!1),this.finalize(),this.elementProperties.set(t,e),!e.noAccessor&&!this.prototype.hasOwnProperty(t)){const i="symbol"==typeof t?Symbol():"__"+t,n=this.getPropertyDescriptor(t,i,e);void 0!==n&&Object.defineProperty(this.prototype,t,n)}}static getPropertyDescriptor(t,e,i){return{get(){return this[e]},set(n){const s=this[t];this[e]=n,this.requestUpdate(t,s,i)},configurable:!0,enumerable:!0}}static getPropertyOptions(t){return this.elementProperties.get(t)||m}static finalize(){if(this.hasOwnProperty("finalized"))return!1;this.finalized=!0;const t=Object.getPrototypeOf(this);if(t.finalize(),void 0!==t.h&&(this.h=[...t.h]),this.elementProperties=new Map(t.elementProperties),this._$Ev=new Map,this.hasOwnProperty("properties")){const t=this.properties,e=[...Object.getOwnPropertyNames(t),...Object.getOwnPropertySymbols(t)];for(const i of e)this.createProperty(i,t[i])}return this.elementStyles=this.finalizeStyles(this.styles),!0}static finalizeStyles(t){const e=[];if(Array.isArray(t)){const i=new Set(t.flat(1/0).reverse());for(const t of i)e.unshift(a(t))}else void 0!==t&&e.push(a(t));return e}static _$Ep(t,e){const i=e.attribute;return!1===i?void 0:"string"==typeof i?i:"string"==typeof t?t.toLowerCase():void 0}u(){var t;this._$E_=new Promise(t=>this.enableUpdating=t),this._$AL=new Map,this._$Eg(),this.requestUpdate(),null===(t=this.constructor.h)||void 0===t||t.forEach(t=>t(this))}addController(t){var e,i;(null!==(e=this._$ES)&&void 0!==e?e:this._$ES=[]).push(t),void 0!==this.renderRoot&&this.isConnected&&(null===(i=t.hostConnected)||void 0===i||i.call(t))}removeController(t){var e;null===(e=this._$ES)||void 0===e||e.splice(this._$ES.indexOf(t)>>>0,1)}_$Eg(){this.constructor.elementProperties.forEach((t,e)=>{this.hasOwnProperty(e)&&(this._$Ei.set(e,this[e]),delete this[e])})}createRenderRoot(){var t;const n=null!==(t=this.shadowRoot)&&void 0!==t?t:this.attachShadow(this.constructor.shadowRootOptions);return((t,n)=>{i?t.adoptedStyleSheets=n.map(t=>t instanceof CSSStyleSheet?t:t.styleSheet):n.forEach(i=>{const n=document.createElement("style"),s=e.litNonce;void 0!==s&&n.setAttribute("nonce",s),n.textContent=i.cssText,t.appendChild(n)})})(n,this.constructor.elementStyles),n}connectedCallback(){var t;void 0===this.renderRoot&&(this.renderRoot=this.createRenderRoot()),this.enableUpdating(!0),null===(t=this._$ES)||void 0===t||t.forEach(t=>{var e;return null===(e=t.hostConnected)||void 0===e?void 0:e.call(t)})}enableUpdating(t){}disconnectedCallback(){var t;null===(t=this._$ES)||void 0===t||t.forEach(t=>{var e;return null===(e=t.hostDisconnected)||void 0===e?void 0:e.call(t)})}attributeChangedCallback(t,e,i){this._$AK(t,i)}_$EO(t,e,i=m){var n;const s=this.constructor._$Ep(t,i);if(void 0!==s&&!0===i.reflect){const o=(void 0!==(null===(n=i.converter)||void 0===n?void 0:n.toAttribute)?i.converter:p).toAttribute(e,i.type);this._$El=t,null==o?this.removeAttribute(s):this.setAttribute(s,o),this._$El=null}}_$AK(t,e){var i;const n=this.constructor,s=n._$Ev.get(t);if(void 0!==s&&this._$El!==s){const t=n.getPropertyOptions(s),o="function"==typeof t.converter?{fromAttribute:t.converter}:void 0!==(null===(i=t.converter)||void 0===i?void 0:i.fromAttribute)?t.converter:p;this._$El=s,this[s]=o.fromAttribute(e,t.type),this._$El=null}}requestUpdate(t,e,i){let n=!0;void 0!==t&&(((i=i||this.constructor.getPropertyOptions(t)).hasChanged||v)(this[t],e)?(this._$AL.has(t)||this._$AL.set(t,e),!0===i.reflect&&this._$El!==t&&(void 0===this._$EC&&(this._$EC=new Map),this._$EC.set(t,i))):n=!1),!this.isUpdatePending&&n&&(this._$E_=this._$Ej())}async _$Ej(){this.isUpdatePending=!0;try{await this._$E_}catch(t){Promise.reject(t)}const t=this.scheduleUpdate();return null!=t&&await t,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){var t;if(!this.isUpdatePending)return;this.hasUpdated,this._$Ei&&(this._$Ei.forEach((t,e)=>this[e]=t),this._$Ei=void 0);let e=!1;const i=this._$AL;try{(e=this.shouldUpdate(i))?(this.willUpdate(i),null===(t=this._$ES)||void 0===t||t.forEach(t=>{var e;return null===(e=t.hostUpdate)||void 0===e?void 0:e.call(t)}),this.update(i)):this._$Ek()}catch(t){throw e=!1,this._$Ek(),t}e&&this._$AE(i)}willUpdate(t){}_$AE(t){var e;null===(e=this._$ES)||void 0===e||e.forEach(t=>{var e;return null===(e=t.hostUpdated)||void 0===e?void 0:e.call(t)}),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(t)),this.updated(t)}_$Ek(){this._$AL=new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$E_}shouldUpdate(t){return!0}update(t){void 0!==this._$EC&&(this._$EC.forEach((t,e)=>this._$EO(e,this[e],t)),this._$EC=void 0),this._$Ek()}updated(t){}firstUpdated(t){}};var f;g.finalized=!0,g.elementProperties=new Map,g.elementStyles=[],g.shadowRootOptions={mode:"open"},null==u||u({ReactiveElement:g}),(null!==(l=c.reactiveElementVersions)&&void 0!==l?l:c.reactiveElementVersions=[]).push("1.6.1");const _=window,$=_.trustedTypes,y=$?$.createPolicy("lit-html",{createHTML:t=>t}):void 0,b=`lit$${(Math.random()+"").slice(9)}$`,A="?"+b,w=`<${A}>`,E=document,x=(t="")=>E.createComment(t),C=t=>null===t||"object"!=typeof t&&"function"!=typeof t,S=Array.isArray,O=t=>S(t)||"function"==typeof(null==t?void 0:t[Symbol.iterator]),T=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,H=/-->/g,N=/>/g,L=RegExp(">|[ \t\n\f\r](?:([^\\s\"'>=/]+)([ \t\n\f\r]*=[ \t\n\f\r]*(?:[^ \t\n\f\r\"'`<>=]|(\"|')|))|$)","g"),P=/'/g,M=/"/g,U=/^(?:script|style|textarea|title)$/i,k=(t=>(e,...i)=>({_$litType$:t,strings:e,values:i}))(1),R=Symbol.for("lit-noChange"),j=Symbol.for("lit-nothing"),I=new WeakMap,D=E.createTreeWalker(E,129,null,!1),z=(t,e)=>{const i=t.length-1,n=[];let s,o=2===e?"<svg>":"",r=T;for(let e=0;e<i;e++){const i=t[e];let a,l,c=-1,h=0;for(;h<i.length&&(r.lastIndex=h,null!==(l=r.exec(i)));)h=r.lastIndex,r===T?"!--"===l[1]?r=H:void 0!==l[1]?r=N:void 0!==l[2]?(U.test(l[2])&&(s=RegExp("</"+l[2],"g")),r=L):void 0!==l[3]&&(r=L):r===L?">"===l[0]?(r=null!=s?s:T,c=-1):void 0===l[1]?c=-2:(c=r.lastIndex-l[2].length,a=l[1],r=void 0===l[3]?L:'"'===l[3]?M:P):r===M||r===P?r=L:r===H||r===N?r=T:(r=L,s=void 0);const d=r===L&&t[e+1].startsWith("/>")?" ":"";o+=r===T?i+w:c>=0?(n.push(a),i.slice(0,c)+"$lit$"+i.slice(c)+b+d):i+b+(-2===c?(n.push(void 0),e):d)}const a=o+(t[i]||"<?>")+(2===e?"</svg>":"");if(!Array.isArray(t)||!t.hasOwnProperty("raw"))throw Error("invalid template strings array");return[void 0!==y?y.createHTML(a):a,n]};class V{constructor({strings:t,_$litType$:e},i){let n;this.parts=[];let s=0,o=0;const r=t.length-1,a=this.parts,[l,c]=z(t,e);if(this.el=V.createElement(l,i),D.currentNode=this.el.content,2===e){const t=this.el.content,e=t.firstChild;e.remove(),t.append(...e.childNodes)}for(;null!==(n=D.nextNode())&&a.length<r;){if(1===n.nodeType){if(n.hasAttributes()){const t=[];for(const e of n.getAttributeNames())if(e.endsWith("$lit$")||e.startsWith(b)){const i=c[o++];if(t.push(e),void 0!==i){const t=n.getAttribute(i.toLowerCase()+"$lit$").split(b),e=/([.?@])?(.*)/.exec(i);a.push({type:1,index:s,name:e[2],strings:t,ctor:"."===e[1]?Z:"?"===e[1]?G:"@"===e[1]?J:W})}else a.push({type:6,index:s})}for(const e of t)n.removeAttribute(e)}if(U.test(n.tagName)){const t=n.textContent.split(b),e=t.length-1;if(e>0){n.textContent=$?$.emptyScript:"";for(let i=0;i<e;i++)n.append(t[i],x()),D.nextNode(),a.push({type:2,index:++s});n.append(t[e],x())}}}else if(8===n.nodeType)if(n.data===A)a.push({type:2,index:s});else{let t=-1;for(;-1!==(t=n.data.indexOf(b,t+1));)a.push({type:7,index:s}),t+=b.length-1}s++}}static createElement(t,e){const i=E.createElement("template");return i.innerHTML=t,i}}function B(t,e,i=t,n){var s,o,r,a;if(e===R)return e;let l=void 0!==n?null===(s=i._$Co)||void 0===s?void 0:s[n]:i._$Cl;const c=C(e)?void 0:e._$litDirective$;return(null==l?void 0:l.constructor)!==c&&(null===(o=null==l?void 0:l._$AO)||void 0===o||o.call(l,!1),void 0===c?l=void 0:(l=new c(t))._$AT(t,i,n),void 0!==n?(null!==(r=(a=i)._$Co)&&void 0!==r?r:a._$Co=[])[n]=l:i._$Cl=l),void 0!==l&&(e=B(t,l._$AS(t,e.values),l,n)),e}class F{constructor(t,e){this.u=[],this._$AN=void 0,this._$AD=t,this._$AM=e}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}v(t){var e;const{el:{content:i},parts:n}=this._$AD,s=(null!==(e=null==t?void 0:t.creationScope)&&void 0!==e?e:E).importNode(i,!0);D.currentNode=s;let o=D.nextNode(),r=0,a=0,l=n[0];for(;void 0!==l;){if(r===l.index){let e;2===l.type?e=new q(o,o.nextSibling,this,t):1===l.type?e=new l.ctor(o,l.name,l.strings,this,t):6===l.type&&(e=new Y(o,this,t)),this.u.push(e),l=n[++a]}r!==(null==l?void 0:l.index)&&(o=D.nextNode(),r++)}return s}p(t){let e=0;for(const i of this.u)void 0!==i&&(void 0!==i.strings?(i._$AI(t,i,e),e+=i.strings.length-2):i._$AI(t[e])),e++}}class q{constructor(t,e,i,n){var s;this.type=2,this._$AH=j,this._$AN=void 0,this._$AA=t,this._$AB=e,this._$AM=i,this.options=n,this._$Cm=null===(s=null==n?void 0:n.isConnected)||void 0===s||s}get _$AU(){var t,e;return null!==(e=null===(t=this._$AM)||void 0===t?void 0:t._$AU)&&void 0!==e?e:this._$Cm}get parentNode(){let t=this._$AA.parentNode;const e=this._$AM;return void 0!==e&&11===t.nodeType&&(t=e.parentNode),t}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(t,e=this){t=B(this,t,e),C(t)?t===j||null==t||""===t?(this._$AH!==j&&this._$AR(),this._$AH=j):t!==this._$AH&&t!==R&&this.g(t):void 0!==t._$litType$?this.$(t):void 0!==t.nodeType?this.T(t):O(t)?this.k(t):this.g(t)}O(t,e=this._$AB){return this._$AA.parentNode.insertBefore(t,e)}T(t){this._$AH!==t&&(this._$AR(),this._$AH=this.O(t))}g(t){this._$AH!==j&&C(this._$AH)?this._$AA.nextSibling.data=t:this.T(E.createTextNode(t)),this._$AH=t}$(t){var e;const{values:i,_$litType$:n}=t,s="number"==typeof n?this._$AC(t):(void 0===n.el&&(n.el=V.createElement(n.h,this.options)),n);if((null===(e=this._$AH)||void 0===e?void 0:e._$AD)===s)this._$AH.p(i);else{const t=new F(s,this),e=t.v(this.options);t.p(i),this.T(e),this._$AH=t}}_$AC(t){let e=I.get(t.strings);return void 0===e&&I.set(t.strings,e=new V(t)),e}k(t){S(this._$AH)||(this._$AH=[],this._$AR());const e=this._$AH;let i,n=0;for(const s of t)n===e.length?e.push(i=new q(this.O(x()),this.O(x()),this,this.options)):i=e[n],i._$AI(s),n++;n<e.length&&(this._$AR(i&&i._$AB.nextSibling,n),e.length=n)}_$AR(t=this._$AA.nextSibling,e){var i;for(null===(i=this._$AP)||void 0===i||i.call(this,!1,!0,e);t&&t!==this._$AB;){const e=t.nextSibling;t.remove(),t=e}}setConnected(t){var e;void 0===this._$AM&&(this._$Cm=t,null===(e=this._$AP)||void 0===e||e.call(this,t))}}class W{constructor(t,e,i,n,s){this.type=1,this._$AH=j,this._$AN=void 0,this.element=t,this.name=e,this._$AM=n,this.options=s,i.length>2||""!==i[0]||""!==i[1]?(this._$AH=Array(i.length-1).fill(new String),this.strings=i):this._$AH=j}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(t,e=this,i,n){const s=this.strings;let o=!1;if(void 0===s)t=B(this,t,e,0),(o=!C(t)||t!==this._$AH&&t!==R)&&(this._$AH=t);else{const n=t;let r,a;for(t=s[0],r=0;r<s.length-1;r++)(a=B(this,n[i+r],e,r))===R&&(a=this._$AH[r]),o||(o=!C(a)||a!==this._$AH[r]),a===j?t=j:t!==j&&(t+=(null!=a?a:"")+s[r+1]),this._$AH[r]=a}o&&!n&&this.j(t)}j(t){t===j?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=t?t:"")}}class Z extends W{constructor(){super(...arguments),this.type=3}j(t){this.element[this.name]=t===j?void 0:t}}const K=$?$.emptyScript:"";class G extends W{constructor(){super(...arguments),this.type=4}j(t){t&&t!==j?this.element.setAttribute(this.name,K):this.element.removeAttribute(this.name)}}class J extends W{constructor(t,e,i,n,s){super(t,e,i,n,s),this.type=5}_$AI(t,e=this){var i;if((t=null!==(i=B(this,t,e,0))&&void 0!==i?i:j)===R)return;const n=this._$AH,s=t===j&&n!==j||t.capture!==n.capture||t.once!==n.once||t.passive!==n.passive,o=t!==j&&(n===j||s);s&&this.element.removeEventListener(this.name,this,n),o&&this.element.addEventListener(this.name,this,t),this._$AH=t}handleEvent(t){var e,i;"function"==typeof this._$AH?this._$AH.call(null!==(i=null===(e=this.options)||void 0===e?void 0:e.host)&&void 0!==i?i:this.element,t):this._$AH.handleEvent(t)}}class Y{constructor(t,e,i){this.element=t,this.type=6,this._$AN=void 0,this._$AM=e,this.options=i}get _$AU(){return this._$AM._$AU}_$AI(t){B(this,t)}}const Q=_.litHtmlPolyfillSupport;null==Q||Q(V,q),(null!==(f=_.litHtmlVersions)&&void 0!==f?f:_.litHtmlVersions=[]).push("2.6.1");const X=(t,e,i)=>{var n,s;const o=null!==(n=null==i?void 0:i.renderBefore)&&void 0!==n?n:e;let r=o._$litPart$;if(void 0===r){const t=null!==(s=null==i?void 0:i.renderBefore)&&void 0!==s?s:null;o._$litPart$=r=new q(e.insertBefore(x(),t),t,void 0,null!=i?i:{})}return r._$AI(t),r};var tt,et;class it extends g{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){var t,e;const i=super.createRenderRoot();return null!==(t=(e=this.renderOptions).renderBefore)&&void 0!==t||(e.renderBefore=i.firstChild),i}update(t){const e=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(t),this._$Do=X(e,this.renderRoot,this.renderOptions)}connectedCallback(){var t;super.connectedCallback(),null===(t=this._$Do)||void 0===t||t.setConnected(!0)}disconnectedCallback(){var t;super.disconnectedCallback(),null===(t=this._$Do)||void 0===t||t.setConnected(!1)}render(){return R}}it.finalized=!0,it._$litElement$=!0,null===(tt=globalThis.litElementHydrateSupport)||void 0===tt||tt.call(globalThis,{LitElement:it});const nt=globalThis.litElementPolyfillSupport;null==nt||nt({LitElement:it}),(null!==(et=globalThis.litElementVersions)&&void 0!==et?et:globalThis.litElementVersions=[]).push("3.2.2");const st=t=>e=>"function"==typeof e?((t,e)=>(customElements.define(t,e),e))(t,e):((t,e)=>{const{kind:i,elements:n}=e;return{kind:i,elements:n,finisher(e){customElements.define(t,e)}}})(t,e),ot=(t,e)=>"method"!==e.kind||!e.descriptor||"value"in e.descriptor?{kind:"field",key:Symbol(),placement:"own",descriptor:{},originalKey:e.key,initializer(){"function"==typeof e.initializer&&(this[e.key]=e.initializer.call(this))},finisher(i){i.createProperty(e.key,t)}}:{...e,finisher(i){i.createProperty(e.key,t)}};function rt(t){return(e,i)=>void 0!==i?((t,e,i)=>{e.constructor.createProperty(i,t)})(t,e,i):ot(t,e)}function at(t){return rt({...t,state:!0})}const lt=({finisher:t,descriptor:e})=>(i,n)=>{var s;if(void 0===n){const n=null!==(s=i.originalKey)&&void 0!==s?s:i.key,o=null!=e?{kind:"method",placement:"prototype",key:n,descriptor:e(i.key)}:{...i,key:n};return null!=t&&(o.finisher=function(e){t(e,n)}),o}{const s=i.constructor;void 0!==e&&Object.defineProperty(i,n,e(n)),null==t||t(s,n)}};var ct;null===(ct=window.HTMLSlotElement)||void 0===ct||ct.prototype.assignedElements;const ht={ATTRIBUTE:1,CHILD:2,PROPERTY:3,BOOLEAN_ATTRIBUTE:4,EVENT:5,ELEMENT:6};class dt{constructor(t){}get _$AU(){return this._$AM._$AU}_$AT(t,e,i){this._$Ct=t,this._$AM=e,this._$Ci=i}_$AS(t,e){return this.update(t,e)}update(t,e){return this.render(...e)}}class ut extends dt{constructor(t){if(super(t),this.it=j,t.type!==ht.CHILD)throw Error(this.constructor.directiveName+"() can only be used in child bindings")}render(t){if(t===j||null==t)return this._t=void 0,this.it=t;if(t===R)return t;if("string"!=typeof t)throw Error(this.constructor.directiveName+"() called with a non-string value");if(t===this.it)return this._t;this.it=t;const e=[t];return e.raw=e,this._t={_$litType$:this.constructor.resultType,strings:e,values:[]}}}ut.directiveName="unsafeHTML",ut.resultType=1;const pt=(t=>(...e)=>({_$litDirective$:t,values:e}))(ut);function vt(t){return t&&t.replace(/(^\w{1})|(\s+\w{1})/g,t=>t.toUpperCase())}var mt,gt;!function(t){t.language="language",t.system="system",t.comma_decimal="comma_decimal",t.decimal_comma="decimal_comma",t.space_comma="space_comma",t.none="none"}(mt||(mt={})),function(t){t.language="language",t.system="system",t.am_pm="12",t.twenty_four="24"}(gt||(gt={}));var ft=function(t,e,i,n){n=n||{},i=null==i?{}:i;var s=new Event(e,{bubbles:void 0===n.bubbles||n.bubbles,cancelable:Boolean(n.cancelable),composed:void 0===n.composed||n.composed});return s.detail=i,t.dispatchEvent(s),s};const _t=(t,e)=>{const i=Object.assign({maximumFractionDigits:2},e);if("string"!=typeof t)return i;if(!e||void 0===e.minimumFractionDigits&&void 0===e.maximumFractionDigits){const e=t.indexOf(".")>-1?t.split(".")[1].length:0;i.minimumFractionDigits=e,i.maximumFractionDigits=e}return i},$t=(t,e,i)=>{const n=e?(t=>{switch(t.number_format){case mt.comma_decimal:return["en-US","en"];case mt.decimal_comma:return["de","es","it"];case mt.space_comma:return["fr","sv","cs"];case mt.system:return;default:return t.language}})(e):void 0;if(Number.isNaN=Number.isNaN||function t(e){return"number"==typeof e&&t(e)},(null==e?void 0:e.number_format)!==mt.none&&!Number.isNaN(Number(t))&&Intl)try{return new Intl.NumberFormat(n,_t(t,i)).format(Number(t))}catch(e){return console.error(e),new Intl.NumberFormat(void 0,_t(t,i)).format(Number(t))}return!Number.isNaN(Number(t))&&""!==t&&(null==e?void 0:e.number_format)===mt.none&&Intl?new Intl.NumberFormat("en-US",_t(t,Object.assign(Object.assign({},i),{useGrouping:!1}))).format(Number(t)):"string"==typeof t?t:`${((t,e=2)=>Math.round(t*10**e)/10**e)(t,null==i?void 0:i.maximumFractionDigits).toString()}${"currency"===(null==i?void 0:i.style)?` ${i.currency}`:""}`},yt="energy-overview-card",bt=`${yt}-editor`;var At,wt,Et,xt;!function(t){t.WATT="W",t.KILO_WATT="kW",t.BTU_PER_HOUR="BTU/h"}(At||(At={})),function(t){t.MILLIAMPERE="mA",t.AMPERE="A"}(wt||(wt={})),function(t){t.MILLIVOLT="mV",t.VOLT="V"}(Et||(Et={})),function(t){t.HERTZ="Hz",t.KILOHERTZ="kHz",t.MEGAHERTZ="MHz",t.GIGAHERTZ="GHz"}(xt||(xt={}));let Ct=class extends it{static get styles(){return r`
      .primary {
        font-weight: bold;
        font-size: 14px;
        color: var(--primary-text-color);
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }

      .secondary {
        font-weight: bolder;
        font-size: 12px;
        color: var(--secondary-text-color);
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
      }

      .entity {
        max-width: 492px;
        padding: 8px;
        margin: 0 auto;
      }

      .metadata {
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        margin-bottom: -8px;
      }

      .metadata-left {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .divider {
        width: 12px;
      }

      .main {
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .label-leading {
        margin-right: 4px;
      }

      .label-trailing {
        margin-left: 4px;
      }

      .icon {
        width: 24px;
        height: 24px;
      }

      .line {
        flex: 1;
        height: 10px;
        box-sizing: border-box;
        margin: 0 8px;
      }

      .line svg {
        width: 100%;
        height: 15px;
      }

      .line svg path {
        stroke-width: 1;
        fill: none;
        stroke: var(--energy-line-color);
      }

      .line svg circle {
        stroke-width: 4;
        stroke: var(--energy-line-color);
        fill: var(--energy-line-color);
      }
    `}static getStubConfig(){return{type:`custom:${yt}`,entities:[{}]}}static async getConfigElement(){return await Promise.resolve().then(function(){return Ut}),window.document.createElement(bt)}setConfig(t){if(!t)throw new Error("Invalid configuration");if(!t.entities)throw new Error("At least one entity is required.");this._config=t}render(){if(!this._config||!this.hass)return j;const t=[];if(this._config.entities.forEach(e=>{var i;t.push({power:this._getState(e.power,At.WATT,"0"),current:this._getState(e.current,wt.AMPERE),voltage:this._getState(e.voltage,Et.VOLT),frequency:this._getState(e.frequency,xt.HERTZ),power_factor:this._getState(e.power_factor,""),name:e.name?e.name:"",color:e.color?e.color:"var(--energy-grid-consumption-color)",label_trailing:e.label_trailing?e.label_trailing:"",label_leading:e.label_leading?e.label_leading:"",icon_trailing:e.icon_trailing?e.icon_trailing:"mdi:home-lightning-bolt",icon_leading:e.icon_leading?e.icon_leading:"mdi:transmission-tower",animation:Object.assign(Object.assign({},null===(i=this._config)||void 0===i?void 0:i.animation),e.animation)})}),this._config.order_by){const e=this._config.order_by;t.sort((t,i)=>{const n=t[e]?parseFloat(t[e].value):0;return(i[e]?parseFloat(i[e].value):0)-n})}return k`
      <ha-card .header=${this._config.title}>
        ${t.map((t,e)=>{var i,n;const s=t.power.value;let o,r;switch(t.power.unit){case At.KILO_WATT:o=1e3*s;break;case At.BTU_PER_HOUR:o=.29307107*s;break;case At.WATT:default:o=s}if(t.power_factor){const e=t.power_factor.value;if(e<-1||e>1||"%"===t.power_factor.unit)r=t.power_factor.display;else{let n=(null!==(i=t.power_factor.precision)&&void 0!==i?i:0)-2;n=n>=0?n:0,r=$t(100*e,this.hass.locale,{maximumFractionDigits:n,minimumFractionDigits:n})}}const{animation:a}=t,l=(null==a?void 0:a.min_duration)?a.min_duration:1,c=(null==a?void 0:a.max_duration)?a.max_duration:10,h=o;let d;(d=function(t,e,i){return Math.max(e,Math.min(t,i))}(-(c-l)/((null==a?void 0:a.power)?a.power:1e3)*Math.abs(h)+c,l,c))===c&&(d=0);const u=d>0&&(null!==(n=null==a?void 0:a.inverted)&&void 0!==n&&n)!==h<0;return k`
        <!--suppress CssUnresolvedCustomProperty -->
        <div class="entity entity-${e}"
              style="--energy-line-color: ${t.color};">
          ${t.name?k`<span class="primary name">${t.name}</span>`:""}
          <div class="metadata">
            ${t.current||t.voltage||t.frequency?k`
            <div class="metadata-left">
                  ${pt((()=>{const e=[];return t.voltage&&e.push(`<span class="secondary voltage">${t.voltage.display}</span>&nbsp;<span class="secondary voltage-unit">${t.voltage.unit}</span>`),t.current&&e.push(`<span class="secondary current">${t.current.display}</span>&nbsp;<span class="secondary current-unit">${t.current.unit}</span>`),t.frequency&&e.push(`<span class="secondary frequency">${t.frequency.display}</span>&nbsp;<span class="secondary frequency-unit">${t.frequency.unit}</span>`),((t,e)=>t.reduce((t,i)=>[...t,i,e],[]).slice(0,-1))(e,'<div class="divider"></div>')})().join(""))}
            </div>`:""}
            <div class="metadata-center">
              <span class="secondary power">${t.power.display}</span>&nbsp;<span
              class="secondary power-unit">${t.power.unit}</span>
            </div>
            ${r?k`
              <div class="metadata-right">
                <span class="secondary power-factor">${r}</span>&nbsp;<span
                class="secondary power-factor-unit">${"%"}</span></div>`:""}
          </div>
          <div class="main">
            <div class="primary label label-leading">${t.label_leading}</div>
            <div class="icon icon-leading">
              <ha-icon icon="${t.icon_leading}"></ha-icon>
            </div>
            <div class="line">
              <svg overflow="visible" preserveAspectRatio="xMaxYMid slice"
                    viewBox="0 0 100 10" xmlns="http://www.w3.org/2000/svg">
                <path class="grid" d="M0,5 H100" id="grid"
                      vector-effect="non-scaling-stroke"></path>
                <circle class="grid" r="1"
                        vector-effect="non-scaling-stroke">
                  <animateMotion
                    calcMode="linear"
                    dur="${d}s"
                    keyPoints="${u?"1;0":"0;1"}"
                    keyTimes="0;1"
                    repeatCount="indefinite">
                    <mpath xlink:href="#grid"></mpath>
                  </animateMotion>
                </circle>
              </svg>
            </div>
            <div class="icon icon-trailing">
              <ha-icon icon="${t.icon_trailing}"></ha-icon>
            </div>
            <div class="primary label label-trailing">${t.label_trailing}</div>
          </div>
        </div>`})}
      </ha-card>
    `}_getState(t,e,i){var n;const s=t?this.hass.states[t]:void 0;if(s||i)return{value:parseFloat(s?s.state:i),unit:this._extractUnit(t,e),display:this._formatNumber(t,i),precision:t?null===(n=this.hass.entities[t])||void 0===n?void 0:n.display_precision:void 0}}_extractUnit(t,e){var i;return t&&null!==(i=this.hass.states[t].attributes.unit_of_measurement)&&void 0!==i?i:e}_formatNumber(t,e){const i=t?this.hass.states[t]:void 0;return i?$t(i.state,this.hass.locale,((t,e)=>{var i;const n=null==e?void 0:e.display_precision;return null!=n?{maximumFractionDigits:n,minimumFractionDigits:n}:Number.isInteger(Number(null===(i=t.attributes)||void 0===i?void 0:i.step))&&Number.isInteger(Number(t.state))?{maximumFractionDigits:0}:void 0})(i,this.hass.entities[t])):e}};t([rt()],Ct.prototype,"hass",void 0),t([at()],Ct.prototype,"_config",void 0),Ct=t([st(yt)],Ct),console.info(`%c${yt} (2.5.0) is installed`,"color: #33b4ff; font-weight: bold","");const St=["sensor","input_number"],Ot=[{type:"grid",name:"",schema:[{name:"power",label:"Animation Max Power",selector:{number:{mode:"box",unit_of_measurement:At.WATT}}},{name:"min_duration",label:"Animation Min Duration",selector:{number:{mode:"box",unit_of_measurement:"s"}}},{name:"max_duration",label:"Animation Max Duration",selector:{number:{mode:"box",unit_of_measurement:"s"}}}]},{name:"inverted",label:"Animation Direction Inverted",selector:{boolean:{}}}],Tt=[{name:"power",required:!0,selector:{entity:{domain:St}}},{type:"grid",name:"",schema:[{name:"voltage",selector:{entity:{domain:St}}},{name:"current",selector:{entity:{domain:St}}},{name:"frequency",selector:{entity:{domain:St}}},{name:"power_factor",selector:{entity:{domain:St}}}]}],Ht=[{name:"name",selector:{text:{}}},{type:"grid",name:"",schema:[{name:"icon_leading",label:"Leading Icon",selector:{icon:{placeholder:"mdi:transmission-tower"}}},{name:"icon_trailing",selector:{icon:{placeholder:"mdi:home-lightning-bolt"}}}]},{type:"grid",name:"",schema:[{name:"label_leading",selector:{text:{}}},{name:"label_trailing",selector:{text:{}}}]},{name:"color",selector:{text:{}}}],Nt=[{name:"title",label:"Title",selector:{text:{}}}],Lt=[{name:"order_by",label:"Order entities by",selector:{select:{mode:"dropdown",options:[{value:"",label:"None"},{value:"power",label:"Power"},{value:"voltage",label:"Voltage"},{value:"current",label:"Current"},{value:"frequency",label:"Frequency"},{value:"power_factor",label:"Power Factor"}]}}}];let Pt=class extends it{constructor(){super(...arguments),this._computeLabel=t=>{var e;if(t.label)return t.label;let i=`${vt(t.name.split("_").join(" "))}`;return(null===(e=t.selector)||void 0===e?void 0:e.entity)&&(i+=` ${this.hass.localize("ui.panel.lovelace.editor.card.generic.entity")}`),i}}_valueChanged(t){this.config&&ft(this,"config-changed",{config:t.detail.value})}_animationChanged(t){this.config&&ft(this,"config-changed",{config:Object.assign(Object.assign({},this.config),{animation:t.detail.value})})}render(){var t;return this.hass&&this.config?k`
      <h3>Data</h3>
      <ha-form
        .hass="${this.hass}"
        .data="${this.config}"
        .schema="${Tt}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._valueChanged}">
      </ha-form>
      <h3>Visuals</h3>
      <ha-form
        .hass="${this.hass}"
        .data="${this.config}"
        .schema="${Ht}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._valueChanged}">
      </ha-form>
      <h3>Animation Overwrite</h3>
      <ha-form
        .hass="${this.hass}"
        .data="${null!==(t=this.config.animation)&&void 0!==t?t:{}}"
        .schema="${Ot}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._animationChanged}">
      </ha-form>
    `:j}connectedCallback(){var t,e;super.connectedCallback(),customElements.get("ha-form")||null===(t=customElements.get("hui-button-card"))||void 0===t||t.getConfigElement(),customElements.get("ha-entity-picker")||null===(e=customElements.get("hui-entities-card"))||void 0===e||e.getConfigElement()}};t([rt()],Pt.prototype,"hass",void 0),t([rt()],Pt.prototype,"lovelace",void 0),t([rt()],Pt.prototype,"config",void 0),Pt=t([st("energy-overview-entity-editor")],Pt);let Mt=class extends it{constructor(){super(...arguments),this._selectedCard=0,this._computeLabel=t=>{var e;if(t.label)return t.label;let i=`${vt(t.name.split("_").join(" "))}`;return(null===(e=t.selector)||void 0===e?void 0:e.entity)&&(i+=` ${this.hass.localize("ui.panel.lovelace.editor.card.generic.entity")}`),i}}static get styles(){return r`
      .toolbar {
        display: flex;
        --paper-tabs-selection-bar-color: var(--primary-color);
        --paper-tab-ink: var(--primary-color);
      }

      .card-config {
        overflow: auto;
      }

      paper-tabs {
        display: flex;
        font-size: 14px;
        flex-grow: 1;
      }

      #add-card {
        max-width: 32px;
        padding: 0;
      }

      #card-options {
        display: flex;
        justify-content: flex-end;
        width: 100%;
      }

      #editor {
        border: 1px solid var(--divider-color);
        padding: 12px;
      }

      @media (max-width: 450px) {
        #editor {
          margin: 0 -12px;
        }
      }
    `}setConfig(t){this._config=t}_handleConfigChanged(t){if(t.stopPropagation(),!this._config)return;const e=[...this._config.entities];e[this._selectedCard]=t.detail.config,this._config=Object.assign(Object.assign({},this._config),{entities:e}),ft(this,"config-changed",{config:this._config})}_handleSelectedCard(t){if("add-card"===t.target.id){t.stopPropagation();const e=[...this._config.entities];return e.push({}),this._config=Object.assign(Object.assign({},this._config),{entities:e}),this._selectedCard=this._config.entities.length-1,void ft(this,"config-changed",{config:this._config})}this._selectedCard=parseInt(t.detail.selected,10)}_handleDeleteCard(){if(!this._config)return;const t=[...this._config.entities];t.splice(this._selectedCard,1),this._config=Object.assign(Object.assign({},this._config),{entities:t}),this._selectedCard=Math.max(0,this._selectedCard-1),ft(this,"config-changed",{config:this._config})}_handleMove(t){if(!this._config)return;const{move:e}=t.currentTarget,i=this._selectedCard+e,n=[...this._config.entities],s=n.splice(this._selectedCard,1)[0];n.splice(i,0,s),this._config=Object.assign(Object.assign({},this._config),{entities:n}),this._selectedCard=i,ft(this,"config-changed",{config:this._config})}_valueChanged(t){this._config&&ft(this,"config-changed",{config:Object.assign(Object.assign({},this._config),t.detail.value)})}_animationChanged(t){this._config&&ft(this,"config-changed",{config:Object.assign(Object.assign({},this._config),{animation:t.detail.value})})}render(){var t;if(!this.hass||!this._config)return j;const e=this._selectedCard,i=this._config.entities.length;return k`
      <h2>Entities</h2>
      <div class="card-config">
        <div class="toolbar">
          <paper-tabs
            .selected=${e}
            scrollable
            @iron-activate=${this._handleSelectedCard}>
            ${this._config.entities.map((t,e)=>k`
                <paper-tab> ${e+1}</paper-tab> `)}
          </paper-tabs>
          <paper-tabs
            id="add-card"
            .selected=${e===i?"0":void 0}
            @iron-activate=${this._handleSelectedCard}>
            <paper-tab>
              <ha-svg-icon .path=${"M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z"}></ha-svg-icon>
            </paper-tab>
          </paper-tabs>
        </div>
      </div>
      <div id="editor">
        <div id="card-options">
          <ha-icon-button
            .disabled=${0===e}
            .label=${this.hass.localize("ui.panel.lovelace.editor.edit_card.move_before")}
            .path=${"M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"}
            @click=${this._handleMove}
            .move=${-1}></ha-icon-button>
          <ha-icon-button
            .label=${this.hass.localize("ui.panel.lovelace.editor.edit_card.move_after")}
            .path=${"M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"}
            .disabled=${e===i-1}
            @click=${this._handleMove}
            .move=${1}></ha-icon-button>
          <ha-icon-button
            .label=${this.hass.localize("ui.panel.lovelace.editor.edit_card.delete")}
            .path=${"M19,4H15.5L14.5,3H9.5L8.5,4H5V6H19M6,19A2,2 0 0,0 8,21H16A2,2 0 0,0 18,19V7H6V19Z"}
            @click=${this._handleDeleteCard}></ha-icon-button>
        </div>

        <energy-overview-entity-editor
          .hass=${this.hass}
          .config=${this._config.entities[e]}
          .lovelace=${this.lovelace}
          @config-changed=${this._handleConfigChanged}
        </energy-overview-entity-editor>
      </div>
      <br />
      <ha-form
        .hass="${this.hass}"
        .data="${this._config}"
        .schema="${Nt}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._valueChanged}">
      </ha-form>
      <br />
      <ha-form
        .hass="${this.hass}"
        .data="${this._config}"
        .schema="${Lt}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._valueChanged}">
      </ha-form>
      <h2>Animation</h2>
      <ha-form
        .hass="${this.hass}"
        .data="${null!==(t=this._config.animation)&&void 0!==t?t:{}}"
        .schema="${Ot}"
        .computeLabel="${this._computeLabel}"
        @value-changed="${this._animationChanged}">
      </ha-form>
    `}};t([rt()],Mt.prototype,"hass",void 0),t([rt()],Mt.prototype,"lovelace",void 0),t([at()],Mt.prototype,"_config",void 0),t([at()],Mt.prototype,"_selectedCard",void 0),t([function(t,e){return lt({descriptor:i=>{const n={get(){var e,i;return null!==(i=null===(e=this.renderRoot)||void 0===e?void 0:e.querySelector(t))&&void 0!==i?i:null},enumerable:!0,configurable:!0};if(e){const e="symbol"==typeof i?Symbol():"__"+i;n.get=function(){var i,n;return void 0===this[e]&&(this[e]=null!==(n=null===(i=this.renderRoot)||void 0===i?void 0:i.querySelector(t))&&void 0!==n?n:null),this[e]}}return n}})}("energy-overview-entity-editor")],Mt.prototype,"_entityEditorEl",void 0),Mt=t([st(bt)],Mt),window.customCards=window.customCards||[],window.customCards.push({type:yt,name:"Energy Overview",preview:!0,documentationURL:"https://github.com/Sese-Schneider/ha-energy-overview-card",description:"Card to displays energy usage details of one or multiple entities."});var Ut=Object.freeze({__proto__:null,get EnergyOverviewCardEditor(){return Mt}});export{Ct as EnergyOverviewCard};
