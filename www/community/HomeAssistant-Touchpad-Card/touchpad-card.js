/**
 * @license
 * Copyright 2019 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
const t$1=window,e$2=t$1.ShadowRoot&&(void 0===t$1.ShadyCSS||t$1.ShadyCSS.nativeShadow)&&"adoptedStyleSheets"in Document.prototype&&"replace"in CSSStyleSheet.prototype,s$3=Symbol(),n$3=new WeakMap;let o$3 = class o{constructor(t,e,n){if(this._$cssResult$=!0,n!==s$3)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=t,this.t=e;}get styleSheet(){let t=this.o;const s=this.t;if(e$2&&void 0===t){const e=void 0!==s&&1===s.length;e&&(t=n$3.get(s)),void 0===t&&((this.o=t=new CSSStyleSheet).replaceSync(this.cssText),e&&n$3.set(s,t));}return t}toString(){return this.cssText}};const r$2=t=>new o$3("string"==typeof t?t:t+"",void 0,s$3),i$1=(t,...e)=>{const n=1===t.length?t[0]:e.reduce(((e,s,n)=>e+(t=>{if(!0===t._$cssResult$)return t.cssText;if("number"==typeof t)return t;throw Error("Value passed to 'css' function must be a 'css' function result: "+t+". Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.")})(s)+t[n+1]),t[0]);return new o$3(n,t,s$3)},S$1=(s,n)=>{e$2?s.adoptedStyleSheets=n.map((t=>t instanceof CSSStyleSheet?t:t.styleSheet)):n.forEach((e=>{const n=document.createElement("style"),o=t$1.litNonce;void 0!==o&&n.setAttribute("nonce",o),n.textContent=e.cssText,s.appendChild(n);}));},c$1=e$2?t=>t:t=>t instanceof CSSStyleSheet?(t=>{let e="";for(const s of t.cssRules)e+=s.cssText;return r$2(e)})(t):t;

/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */var s$2;const e$1=window,r$1=e$1.trustedTypes,h$1=r$1?r$1.emptyScript:"",o$2=e$1.reactiveElementPolyfillSupport,n$2={toAttribute(t,i){switch(i){case Boolean:t=t?h$1:null;break;case Object:case Array:t=null==t?t:JSON.stringify(t);}return t},fromAttribute(t,i){let s=t;switch(i){case Boolean:s=null!==t;break;case Number:s=null===t?null:Number(t);break;case Object:case Array:try{s=JSON.parse(t);}catch(t){s=null;}}return s}},a$1=(t,i)=>i!==t&&(i==i||t==t),l$2={attribute:!0,type:String,converter:n$2,reflect:!1,hasChanged:a$1};let d$1 = class d extends HTMLElement{constructor(){super(),this._$Ei=new Map,this.isUpdatePending=!1,this.hasUpdated=!1,this._$El=null,this.u();}static addInitializer(t){var i;this.finalize(),(null!==(i=this.h)&&void 0!==i?i:this.h=[]).push(t);}static get observedAttributes(){this.finalize();const t=[];return this.elementProperties.forEach(((i,s)=>{const e=this._$Ep(s,i);void 0!==e&&(this._$Ev.set(e,s),t.push(e));})),t}static createProperty(t,i=l$2){if(i.state&&(i.attribute=!1),this.finalize(),this.elementProperties.set(t,i),!i.noAccessor&&!this.prototype.hasOwnProperty(t)){const s="symbol"==typeof t?Symbol():"__"+t,e=this.getPropertyDescriptor(t,s,i);void 0!==e&&Object.defineProperty(this.prototype,t,e);}}static getPropertyDescriptor(t,i,s){return {get(){return this[i]},set(e){const r=this[t];this[i]=e,this.requestUpdate(t,r,s);},configurable:!0,enumerable:!0}}static getPropertyactions(t){return this.elementProperties.get(t)||l$2}static finalize(){if(this.hasOwnProperty("finalized"))return !1;this.finalized=!0;const t=Object.getPrototypeOf(this);if(t.finalize(),void 0!==t.h&&(this.h=[...t.h]),this.elementProperties=new Map(t.elementProperties),this._$Ev=new Map,this.hasOwnProperty("properties")){const t=this.properties,i=[...Object.getOwnPropertyNames(t),...Object.getOwnPropertySymbols(t)];for(const s of i)this.createProperty(s,t[s]);}return this.elementStyles=this.finalizeStyles(this.styles),!0}static finalizeStyles(i){const s=[];if(Array.isArray(i)){const e=new Set(i.flat(1/0).reverse());for(const i of e)s.unshift(c$1(i));}else void 0!==i&&s.push(c$1(i));return s}static _$Ep(t,i){const s=i.attribute;return !1===s?void 0:"string"==typeof s?s:"string"==typeof t?t.toLowerCase():void 0}u(){var t;this._$E_=new Promise((t=>this.enableUpdating=t)),this._$AL=new Map,this._$Eg(),this.requestUpdate(),null===(t=this.constructor.h)||void 0===t||t.forEach((t=>t(this)));}addController(t){var i,s;(null!==(i=this._$ES)&&void 0!==i?i:this._$ES=[]).push(t),void 0!==this.renderRoot&&this.isConnected&&(null===(s=t.hostConnected)||void 0===s||s.call(t));}removeController(t){var i;null===(i=this._$ES)||void 0===i||i.splice(this._$ES.indexOf(t)>>>0,1);}_$Eg(){this.constructor.elementProperties.forEach(((t,i)=>{this.hasOwnProperty(i)&&(this._$Ei.set(i,this[i]),delete this[i]);}));}createRenderRoot(){var t;const s=null!==(t=this.shadowRoot)&&void 0!==t?t:this.attachShadow(this.constructor.shadowRootactions);return S$1(s,this.constructor.elementStyles),s}connectedCallback(){var t;void 0===this.renderRoot&&(this.renderRoot=this.createRenderRoot()),this.enableUpdating(!0),null===(t=this._$ES)||void 0===t||t.forEach((t=>{var i;return null===(i=t.hostConnected)||void 0===i?void 0:i.call(t)}));}enableUpdating(t){}disconnectedCallback(){var t;null===(t=this._$ES)||void 0===t||t.forEach((t=>{var i;return null===(i=t.hostDisconnected)||void 0===i?void 0:i.call(t)}));}attributeChangedCallback(t,i,s){this._$AK(t,s);}_$EO(t,i,s=l$2){var e;const r=this.constructor._$Ep(t,s);if(void 0!==r&&!0===s.reflect){const h=(void 0!==(null===(e=s.converter)||void 0===e?void 0:e.toAttribute)?s.converter:n$2).toAttribute(i,s.type);this._$El=t,null==h?this.removeAttribute(r):this.setAttribute(r,h),this._$El=null;}}_$AK(t,i){var s;const e=this.constructor,r=e._$Ev.get(t);if(void 0!==r&&this._$El!==r){const t=e.getPropertyactions(r),h="function"==typeof t.converter?{fromAttribute:t.converter}:void 0!==(null===(s=t.converter)||void 0===s?void 0:s.fromAttribute)?t.converter:n$2;this._$El=r,this[r]=h.fromAttribute(i,t.type),this._$El=null;}}requestUpdate(t,i,s){let e=!0;void 0!==t&&(((s=s||this.constructor.getPropertyactions(t)).hasChanged||a$1)(this[t],i)?(this._$AL.has(t)||this._$AL.set(t,i),!0===s.reflect&&this._$El!==t&&(void 0===this._$EC&&(this._$EC=new Map),this._$EC.set(t,s))):e=!1),!this.isUpdatePending&&e&&(this._$E_=this._$Ej());}async _$Ej(){this.isUpdatePending=!0;try{await this._$E_;}catch(t){Promise.reject(t);}const t=this.scheduleUpdate();return null!=t&&await t,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){var t;if(!this.isUpdatePending)return;this.hasUpdated,this._$Ei&&(this._$Ei.forEach(((t,i)=>this[i]=t)),this._$Ei=void 0);let i=!1;const s=this._$AL;try{i=this.shouldUpdate(s),i?(this.willUpdate(s),null===(t=this._$ES)||void 0===t||t.forEach((t=>{var i;return null===(i=t.hostUpdate)||void 0===i?void 0:i.call(t)})),this.update(s)):this._$Ek();}catch(t){throw i=!1,this._$Ek(),t}i&&this._$AE(s);}willUpdate(t){}_$AE(t){var i;null===(i=this._$ES)||void 0===i||i.forEach((t=>{var i;return null===(i=t.hostUpdated)||void 0===i?void 0:i.call(t)})),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(t)),this.updated(t);}_$Ek(){this._$AL=new Map,this.isUpdatePending=!1;}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$E_}shouldUpdate(t){return !0}update(t){void 0!==this._$EC&&(this._$EC.forEach(((t,i)=>this._$EO(i,this[i],t))),this._$EC=void 0),this._$Ek();}updated(t){}firstUpdated(t){}};d$1.finalized=!0,d$1.elementProperties=new Map,d$1.elementStyles=[],d$1.shadowRootactions={mode:"open"},null==o$2||o$2({ReactiveElement:d$1}),(null!==(s$2=e$1.reactiveElementVersions)&&void 0!==s$2?s$2:e$1.reactiveElementVersions=[]).push("1.5.0");

/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */
var t;const i=window,s$1=i.trustedTypes,e=s$1?s$1.createPolicy("lit-html",{createHTML:t=>t}):void 0,o$1=`lit$${(Math.random()+"").slice(9)}$`,n$1="?"+o$1,l$1=`<${n$1}>`,h=document,r=(t="")=>h.createComment(t),d=t=>null===t||"object"!=typeof t&&"function"!=typeof t,u=Array.isArray,c=t=>u(t)||"function"==typeof(null==t?void 0:t[Symbol.iterator]),v=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,a=/-->/g,f=/>/g,_=RegExp(">|[ \t\n\f\r](?:([^\\s\"'>=/]+)([ \t\n\f\r]*=[ \t\n\f\r]*(?:[^ \t\n\f\r\"'`<>=]|(\"|')|))|$)","g"),m=/'/g,p=/"/g,$=/^(?:script|style|textarea|title)$/i,g=t=>(i,...s)=>({_$litType$:t,strings:i,values:s}),y=g(1),x=Symbol.for("lit-noChange"),b=Symbol.for("lit-nothing"),T=new WeakMap,A=h.createTreeWalker(h,129,null,!1),E=(t,i)=>{const s=t.length-1,n=[];let h,r=2===i?"<svg>":"",d=v;for(let i=0;i<s;i++){const s=t[i];let e,u,c=-1,g=0;for(;g<s.length&&(d.lastIndex=g,u=d.exec(s),null!==u);)g=d.lastIndex,d===v?"!--"===u[1]?d=a:void 0!==u[1]?d=f:void 0!==u[2]?($.test(u[2])&&(h=RegExp("</"+u[2],"g")),d=_):void 0!==u[3]&&(d=_):d===_?">"===u[0]?(d=null!=h?h:v,c=-1):void 0===u[1]?c=-2:(c=d.lastIndex-u[2].length,e=u[1],d=void 0===u[3]?_:'"'===u[3]?p:m):d===p||d===m?d=_:d===a||d===f?d=v:(d=_,h=void 0);const y=d===_&&t[i+1].startsWith("/>")?" ":"";r+=d===v?s+l$1:c>=0?(n.push(e),s.slice(0,c)+"$lit$"+s.slice(c)+o$1+y):s+o$1+(-2===c?(n.push(void 0),i):y);}const u=r+(t[s]||"<?>")+(2===i?"</svg>":"");if(!Array.isArray(t)||!t.hasOwnProperty("raw"))throw Error("invalid template strings array");return [void 0!==e?e.createHTML(u):u,n]};class C{constructor({strings:t,_$litType$:i},e){let l;this.parts=[];let h=0,d=0;const u=t.length-1,c=this.parts,[v,a]=E(t,i);if(this.el=C.createElement(v,e),A.currentNode=this.el.content,2===i){const t=this.el.content,i=t.firstChild;i.remove(),t.append(...i.childNodes);}for(;null!==(l=A.nextNode())&&c.length<u;){if(1===l.nodeType){if(l.hasAttributes()){const t=[];for(const i of l.getAttributeNames())if(i.endsWith("$lit$")||i.startsWith(o$1)){const s=a[d++];if(t.push(i),void 0!==s){const t=l.getAttribute(s.toLowerCase()+"$lit$").split(o$1),i=/([.?@])?(.*)/.exec(s);c.push({type:1,index:h,name:i[2],strings:t,ctor:"."===i[1]?M:"?"===i[1]?k:"@"===i[1]?H:S});}else c.push({type:6,index:h});}for(const i of t)l.removeAttribute(i);}if($.test(l.tagName)){const t=l.textContent.split(o$1),i=t.length-1;if(i>0){l.textContent=s$1?s$1.emptyScript:"";for(let s=0;s<i;s++)l.append(t[s],r()),A.nextNode(),c.push({type:2,index:++h});l.append(t[i],r());}}}else if(8===l.nodeType)if(l.data===n$1)c.push({type:2,index:h});else {let t=-1;for(;-1!==(t=l.data.indexOf(o$1,t+1));)c.push({type:7,index:h}),t+=o$1.length-1;}h++;}}static createElement(t,i){const s=h.createElement("template");return s.innerHTML=t,s}}function P(t,i,s=t,e){var o,n,l,h;if(i===x)return i;let r=void 0!==e?null===(o=s._$Co)||void 0===o?void 0:o[e]:s._$Cl;const u=d(i)?void 0:i._$litDirective$;return (null==r?void 0:r.constructor)!==u&&(null===(n=null==r?void 0:r._$AO)||void 0===n||n.call(r,!1),void 0===u?r=void 0:(r=new u(t),r._$AT(t,s,e)),void 0!==e?(null!==(l=(h=s)._$Co)&&void 0!==l?l:h._$Co=[])[e]=r:s._$Cl=r),void 0!==r&&(i=P(t,r._$AS(t,i.values),r,e)),i}class V{constructor(t,i){this.u=[],this._$AN=void 0,this._$AD=t,this._$AM=i;}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}v(t){var i;const{el:{content:s},parts:e}=this._$AD,o=(null!==(i=null==t?void 0:t.creationScope)&&void 0!==i?i:h).importNode(s,!0);A.currentNode=o;let n=A.nextNode(),l=0,r=0,d=e[0];for(;void 0!==d;){if(l===d.index){let i;2===d.type?i=new N(n,n.nextSibling,this,t):1===d.type?i=new d.ctor(n,d.name,d.strings,this,t):6===d.type&&(i=new I(n,this,t)),this.u.push(i),d=e[++r];}l!==(null==d?void 0:d.index)&&(n=A.nextNode(),l++);}return o}p(t){let i=0;for(const s of this.u)void 0!==s&&(void 0!==s.strings?(s._$AI(t,s,i),i+=s.strings.length-2):s._$AI(t[i])),i++;}}class N{constructor(t,i,s,e){var o;this.type=2,this._$AH=b,this._$AN=void 0,this._$AA=t,this._$AB=i,this._$AM=s,this.actions=e,this._$Cm=null===(o=null==e?void 0:e.isConnected)||void 0===o||o;}get _$AU(){var t,i;return null!==(i=null===(t=this._$AM)||void 0===t?void 0:t._$AU)&&void 0!==i?i:this._$Cm}get parentNode(){let t=this._$AA.parentNode;const i=this._$AM;return void 0!==i&&11===t.nodeType&&(t=i.parentNode),t}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(t,i=this){t=P(this,t,i),d(t)?t===b||null==t||""===t?(this._$AH!==b&&this._$AR(),this._$AH=b):t!==this._$AH&&t!==x&&this.g(t):void 0!==t._$litType$?this.$(t):void 0!==t.nodeType?this.T(t):c(t)?this.k(t):this.g(t);}O(t,i=this._$AB){return this._$AA.parentNode.insertBefore(t,i)}T(t){this._$AH!==t&&(this._$AR(),this._$AH=this.O(t));}g(t){this._$AH!==b&&d(this._$AH)?this._$AA.nextSibling.data=t:this.T(h.createTextNode(t)),this._$AH=t;}$(t){var i;const{values:s,_$litType$:e}=t,o="number"==typeof e?this._$AC(t):(void 0===e.el&&(e.el=C.createElement(e.h,this.actions)),e);if((null===(i=this._$AH)||void 0===i?void 0:i._$AD)===o)this._$AH.p(s);else {const t=new V(o,this),i=t.v(this.actions);t.p(s),this.T(i),this._$AH=t;}}_$AC(t){let i=T.get(t.strings);return void 0===i&&T.set(t.strings,i=new C(t)),i}k(t){u(this._$AH)||(this._$AH=[],this._$AR());const i=this._$AH;let s,e=0;for(const o of t)e===i.length?i.push(s=new N(this.O(r()),this.O(r()),this,this.actions)):s=i[e],s._$AI(o),e++;e<i.length&&(this._$AR(s&&s._$AB.nextSibling,e),i.length=e);}_$AR(t=this._$AA.nextSibling,i){var s;for(null===(s=this._$AP)||void 0===s||s.call(this,!1,!0,i);t&&t!==this._$AB;){const i=t.nextSibling;t.remove(),t=i;}}setConnected(t){var i;void 0===this._$AM&&(this._$Cm=t,null===(i=this._$AP)||void 0===i||i.call(this,t));}}class S{constructor(t,i,s,e,o){this.type=1,this._$AH=b,this._$AN=void 0,this.element=t,this.name=i,this._$AM=e,this.actions=o,s.length>2||""!==s[0]||""!==s[1]?(this._$AH=Array(s.length-1).fill(new String),this.strings=s):this._$AH=b;}get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}_$AI(t,i=this,s,e){const o=this.strings;let n=!1;if(void 0===o)t=P(this,t,i,0),n=!d(t)||t!==this._$AH&&t!==x,n&&(this._$AH=t);else {const e=t;let l,h;for(t=o[0],l=0;l<o.length-1;l++)h=P(this,e[s+l],i,l),h===x&&(h=this._$AH[l]),n||(n=!d(h)||h!==this._$AH[l]),h===b?t=b:t!==b&&(t+=(null!=h?h:"")+o[l+1]),this._$AH[l]=h;}n&&!e&&this.j(t);}j(t){t===b?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,null!=t?t:"");}}class M extends S{constructor(){super(...arguments),this.type=3;}j(t){this.element[this.name]=t===b?void 0:t;}}const R=s$1?s$1.emptyScript:"";class k extends S{constructor(){super(...arguments),this.type=4;}j(t){t&&t!==b?this.element.setAttribute(this.name,R):this.element.removeAttribute(this.name);}}class H extends S{constructor(t,i,s,e,o){super(t,i,s,e,o),this.type=5;}_$AI(t,i=this){var s;if((t=null!==(s=P(this,t,i,0))&&void 0!==s?s:b)===x)return;const e=this._$AH,o=t===b&&e!==b||t.capture!==e.capture||t.once!==e.once||t.passive!==e.passive,n=t!==b&&(e===b||o);o&&this.element.removeEventListener(this.name,this,e),n&&this.element.addEventListener(this.name,this,t),this._$AH=t;}handleEvent(t){var i,s;"function"==typeof this._$AH?this._$AH.call(null!==(s=null===(i=this.actions)||void 0===i?void 0:i.host)&&void 0!==s?s:this.element,t):this._$AH.handleEvent(t);}}class I{constructor(t,i,s){this.element=t,this.type=6,this._$AN=void 0,this._$AM=i,this.actions=s;}get _$AU(){return this._$AM._$AU}_$AI(t){P(this,t);}}const z=i.litHtmlPolyfillSupport;null==z||z(C,N),(null!==(t=i.litHtmlVersions)&&void 0!==t?t:i.litHtmlVersions=[]).push("2.5.0");const Z=(t,i,s)=>{var e,o;const n=null!==(e=null==s?void 0:s.renderBefore)&&void 0!==e?e:i;let l=n._$litPart$;if(void 0===l){const t=null!==(o=null==s?void 0:s.renderBefore)&&void 0!==o?o:null;n._$litPart$=l=new N(i.insertBefore(r(),t),t,void 0,null!=s?s:{});}return l._$AI(t),l};

/**
 * @license
 * Copyright 2017 Google LLC
 * SPDX-License-Identifier: BSD-3-Clause
 */var l,o;class s extends d$1{constructor(){super(...arguments),this.renderactions={host:this},this._$Do=void 0;}createRenderRoot(){var t,e;const i=super.createRenderRoot();return null!==(t=(e=this.renderactions).renderBefore)&&void 0!==t||(e.renderBefore=i.firstChild),i}update(t){const i=this.render();this.hasUpdated||(this.renderactions.isConnected=this.isConnected),super.update(t),this._$Do=Z(i,this.renderRoot,this.renderactions);}connectedCallback(){var t;super.connectedCallback(),null===(t=this._$Do)||void 0===t||t.setConnected(!0);}disconnectedCallback(){var t;super.disconnectedCallback(),null===(t=this._$Do)||void 0===t||t.setConnected(!1);}render(){return x}}s.finalized=!0,s._$litElement$=!0,null===(l=globalThis.litElementHydrateSupport)||void 0===l||l.call(globalThis,{LitElement:s});const n=globalThis.litElementPolyfillSupport;null==n||n({LitElement:s});(null!==(o=globalThis.litElementVersions)&&void 0!==o?o:globalThis.litElementVersions=[]).push("3.2.2");

const chgConfig = new Event("config-changed", { bubbles: true, composed: true});
const vibrate = new Event('haptic', {bubbles: false});
const moreInfo = new Event('hass-more-info', { composed: true });
var clickTimer,holdTimer,holdInterval,holdRemove,msg,falseCheck = true;

class MyElement extends s {
    static get properties() {
        return {
          hass: {},
          config: {}
        };
    }

  static get styles() {
    return i$1`
        img{
          background-size: contain;
          border-radius: 15px;
          height: 40px;
          width: 40px;
          touch-action: none;
          margin: 20px 0px 20px 20px;
          float: left;
        }
        ha-icon{
          pointer-events: none;
          touch-action: none;
        }
        #entity-area > ha-icon {
          color: white;
          float:left;
          margin:17px 0px 0px 20px;
          --mdc-icon-size: 45px ;
        }
        .touch-area{
          display: block;
          width: 93%;
          margin: 9vh auto 0px;
          border-radius: 30px;
          margin-bottom: 10px;
          height: 55%;
          background: #6d767e;
          border: 1px solid black;
          touch-action:none;
        }
        #entity-area{
          height : 10vh;
          width: 100%;
          margin : 0;
        }

        the-tv {
          position: relative;
          background-color: #343a40;
          overflow: hidden;
          display: flex;
          flex-flow: column;
          margin:0 auto 0;
          max-height: 750px ;
          max-width: 458px;
          border: double 4px transparent;
          border-radius: 30px;
        }
        .fancy-borders{
          background-image: linear-gradient(#343a40, #343a40), radial-gradient(circle at top left, #f00,#3020ff);
          background-origin: border-box;
          background-clip: padding-box, border-box;
        }

        #buttons{
          color: white;
          display: grid;
          grid-template-columns: auto auto auto;
          grid-template-rows: auto auto;
          gap: 0px auto;
          width: 96%;
          margin: 8vh 0 2vh ;
          height: 58%;
          --mdc-icon-size: 30px;
          padding-left: 13px;
          padding-right: 13px;
          grid-template-areas:
              "a b c"
              "d e f";
        }
        #buttons  button {
          color: white;
          border: 0.5px;
          border-top: solid grey  ;
          border-left: solid grey;
          border-bottom: solid black;
          border-right: solid black;
        }
        b {
          margin: 30px auto auto 20px;
          color: white;
          display: inline-block;
          font-size: 23px;
          text-shadow: rgba(0, 0, 0, 0.2) 3px 3px 0px;
        }
        .power{
          border: 2px;
          border-top: solid grey  ;
          border-left: solid grey;
          border-bottom: solid black;
          border-right: solid black;
          background-color: transparent;
          box-shadow: none;
          border-radius: 3rem;
          float: right;
          margin: 20px;
          --mdc-icon-size: 35px;
        }
        .channel_up{
          grid-area: a;
          border-radius: 3rem 3rem 0rem 0rem;
          height: 100%;
          width: 24vw;
          max-width: 118px;
          margin-left: auto;
          margin-right: auto;
          box-shadow: none;
          background-color: #6d767e;
        }
        .channel_down{
          grid-area: d;
          border-radius: 0rem 0rem 3rem 3rem;
          height: 100%;
          width: 24vw;
          max-width: 118px;
          box-shadow: none;
          margin-left: auto;
          margin-right: auto;
          background-color: #6d767e;
        }
        .source{
          grid-area: b;
          border-radius: 1.5rem;
          box-shadow: none;
          background-color: #6d767e;
          margin: auto;
          padding: 10px;
          height: fit-content;
        }
        .mute{
          grid-area: e;
          border-radius: 1.5rem;
          box-shadow: none;
          background-color: #6d767e;
          margin: auto;
          padding: 10px;
          height: fit-content;
        }
        .volume_up{
          grid-area: c;
          border-radius: 3rem 3rem 0rem 0rem;
          height: 100%;
          width: 24vw;
          max-width: 118px;
          box-shadow: none;
          margin-left: auto;
          margin-right: auto;
          background-color: #6d767e;
        }
        .volume_down{
          grid-area: f;
          border-radius: 0rem 0rem 3rem 3rem;
          height: 100%;
          width: 24vw;
          max-width: 118px;
          margin-left: auto;
          margin-right: auto;
          box-shadow: none;
          background-color: #6d767e;
        }
        hr{
          height:2px;
          width: 97%;
          border-width:0;
          color:#6d767e;
          background-color:#6d767e;
        }
        `;
  }


static getConfigElement() {
  return document.createElement("contento-card-editor");
}

static properties = {
  _current_entity: { state: true },
};

constructor(){
  super();
  this.t = [];
}
set hass(hass) {
  this._hass = hass;
  this.requestUpdate();
}


  render() {
  this.t = Object.keys(this.config[this._current_entity].icons).slice(2);
  return y`
    <the-tv class="${this.config[this._current_entity].fancy_borders ? 'fancy-borders' : ''}"
      style=" height:${window.navigator.userAgent.includes("Home Assistant") ? '91vh' : window.navigator.brave != undefined ? '80vh' : '82vh' };">
      <div id="entity-area" @touchstart="${this.touchStart}" @touchmove="${this.changeCurrentEntity}" @dblclick="${()=>this.moreInfoAction(this)}">
        ${this.tvIconOrSource()}
        <b id="enitity-name" >${ this.config[this._current_entity].display_name }</b>
        ${this.baseButton('power')}
      <hr>
      </div>
      <div id="buttons">
        ${this.t.map(elm => this.baseButton(elm))}
      </div>
        ${this.touchpad()}
    </the-tv>
  `;
}

tvIconOrSource() {
  if(this._hass.states[this.config[this._current_entity].entity]?.attributes.entity_picture != undefined)
    return y`<img src="${this._hass.states[this.config[this._current_entity].entity].attributes.entity_picture}" style="margin-left:30px;">
    `;
  else
    return y`<ha-icon icon="${this.config[this._current_entity].icons.topicon}"></ha-icon>
    `;
}

baseButton(cssName){
  let button = document.createElement('button');
  button.classList.add(cssName);
  if(cssName === 'power')
    button.style.color = this._hass.states[this.config[this._current_entity].entity].state === 'on' ? 'green' : 'red';
  let icon = document.createElement('ha-icon');
  icon.setAttribute('icon',this.config[this._current_entity].icons[cssName]);
  button.appendChild(icon);
  button.addEventListener('click', e => {
    e.stopImmediatePropagation();
    clickTimer = setTimeout(() => {
      if(falseCheck){
        this.feedback('light');
        this.execute({type: 'click',src: cssName});
      }
      falseCheck=true;
    }, 210);
  });

  button.addEventListener('touchstart',e => {
    e.stopImmediatePropagation();
    holdTimer = setTimeout(() => {
      this.feedback('light');
      if(cssName.match(/^(channel_up|channel_down|volume_up|volume_down)$/))
        holdInterval = setInterval(() => {
          this.execute({type: 'hold',src: cssName});
          this.feedback('selection');
        }, 450);
      else
        this.execute({type: 'hold',src: cssName});
      }, 600);
    });

  button.addEventListener('dblclick',e => {
    e.stopImmediatePropagation();
    falseCheck = false;
    clearTimeout(clickTimer);
    clickTimer = null;
    this.execute({type: 'dblclick',src: cssName});
    this.feedback('success');
  });

  button.addEventListener('touchend',e=>{
    e.stopImmediatePropagation();
    clearInterval(holdInterval);
    clearTimeout(clickTimer);
    clearTimeout(holdTimer);
  });
  return button;
}

touchpad (){
  let touchpad = document.createElement('button');
  touchpad.setAttribute('id','touchpad');
  touchpad.classList.add('touch-area');
  touchpad.addEventListener('click', e => {
    e.stopImmediatePropagation();
    clickTimer = setTimeout(() => {
      if(falseCheck){
        this.execute({type: 'click',src: 'touchpad'});
        this.feedback('light');
      }
      falseCheck=true;
    }, 210);
  });
  touchpad.addEventListener('dblclick',e => {
    e.stopImmediatePropagation();
    this.feedback('success');
    falseCheck = false;
    clearTimeout(clickTimer);
    clickTimer = null;
    this.execute({type: 'dblclick',src: 'touchpad'});
  });
  touchpad.addEventListener('touchstart' ,e => {
    e.stopImmediatePropagation();
    this.touchStart(e);
    holdTimer = setTimeout(() => {
      this.feedback('medium');
      this.execute({type: 'hold',src: 'touchpad'});
    }, 700);
  });
  touchpad.addEventListener('touchmove',e => {
    e.stopImmediatePropagation();
    this.touchMove(e);
  });
  touchpad.addEventListener('touchend', e => {
    e.stopImmediatePropagation();
    clearTimeout(clickTimer);
    clearTimeout(holdTimer);
  });
  return touchpad;
  }

  execute(act) {
    if (this.config[this._current_entity].actions[act.src][act.type].type === "default") {
      switch (act.type) {
        case 'click':
          switch (act.src) {
            case 'power':
              this._hass.callService('homeassistant','toggle',{entity_id: this.config[this._current_entity].entity});
              break;
            case 'channel_up':
              if(this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player','play_media',{media_content_id: 'KEY_CHUP',media_content_type: 'send_key'},{entity_id: this.config[this._current_entity].entity});
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_CHUP' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
            case 'channel_down':
              if(this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player','play_media',{media_content_id: 'KEY_CHDOWN',media_content_type: 'send_key'},{entity_id: this.config[this._current_entity].entity});
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_CHDOWN' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
            case 'volume_up':
              this._hass.callService('media_player','volume_up',{entity_id: this.config[this._current_entity].entity});
              break;
            case 'volume_down':
              this._hass.callService('media_player','volume_down',{entity_id: this.config[this._current_entity].entity});
              break;
            case 'source':
              if (this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player','play_media',{media_content_id: 'KEY_SOURCE',media_content_type: 'send_key'},{entity_id: this.config[this._current_entity].entity});
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_SOURCE' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
            case 'mute':
              this._hass.callService('media_player','volume_mute',{is_volume_muted: !this._hass.states[this.config[this._current_entity].entity].attributes.is_volume_muted},{entity_id: this.config[this._current_entity].entity});
              break;
            case 'touchpad':
              if (this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player','play_media',{media_content_id: 'KEY_ENTER',media_content_type: 'send_key'},{entity_id: this.config[this._current_entity].entity});
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_ENTER' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
          }
          break;
        case 'dblclick':
          if (act.source === 'touchpad')
            if(this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
              this._hass.callService('media_player','play_media',{media_content_id: 'KEY_RETURN',media_content_type: 'send_key'},{entity_id: this.config[this._current_entity].entity});
            else
              this._hass.callService('remote','send_command', { command: 'KEY_RETURN' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
          break;
        case 'hold':
          switch (act.src) {
            case 'touchpad':
              if(this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player', 'play_media', { media_content_id: 'KEY_HOME', media_content_type: 'send_key' }, { entity_id: this.config[this._current_entity].entity });
              else
                this._hass.callService('remote','send_command',{command: 'KEY_HOME'},{entity_id: this.config[this._current_entity].entity.replace("media_player", "remote")});
              break;
            case 'channel_up':
              if (this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player', 'play_media', { media_content_id: 'KEY_CHUP', media_content_type: 'send_key' }, { entity_id: this.config[this._current_entity].entity });
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_CHUP' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
            case 'channel_down':
              if(this._hass.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
                this._hass.callService('media_player', 'play_media', { media_content_id: 'KEY_CHDOWN', media_content_type: 'send_key' }, { entity_id: this.config[this._current_entity].entity });
              else
                this._hass.callService('remote', 'send_command', { command: 'KEY_CHDOWN' }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
              break;
            case 'volume_up':
              this._hass.callService('media_player', 'volume_up', { entity_id: this.config[this._current_entity].entity });
              break;
            case 'volume_down':
              this._hass.callService('media_player', 'volume_down', { entity_id: this.config[this._current_entity].entity });
              break;
          }
          break;
      }
    } else {
      switch (this.config[this._current_entity].actions[act.src][act.type].type) {
        case 'script':
          this._hass.callService('script', this.config[this._current_entity].actions[act.src][act.type].entity.substring(this.config[this._current_entity].actions[act.src][act.type].entity.indexOf('.') + 1));
          break;
        case 'automation':
          this._hass.callService('automation', 'trigger', { entity_id: this.config[this._current_entity].actions[act.src][act.type].entity });
          break;
        case 'toggle':
          this._hass.callService('homeassistant', 'toggle', { entity_id: this.config[this._current_entity].actions[act.src][act.type].entity });
          break;
        case 'turn-on':
          this._hass.callService('homeassistant', 'turn_on', { entity_id: this.config[this._current_entity].actions[act.src][act.type].entity });
          break;
        case 'turn-off':
          this._hass.callService('homeassistant', 'turn_off', { entity_id: this.config[this._current_entity].actions[act.src][act.type].entity });
          break;
      }
    }
  }

  moreInfoAction(node){
    moreInfo.detail = {entityId: this.config[this._current_entity].entity};
    node.dispatchEvent(moreInfo);
  }
  feedback(type){
    vibrate.detail = type;
    window.dispatchEvent(vibrate);
  }
  touchStart(e) {
    window.initialX = e.touches[0].clientX;
    window.initialY = e.touches[0].clientY;
  }

  changeCurrentEntity(e) {


    if( ! initialX || ! initialY){
      return;
    }

    var currentX = e.touches[0].clientX;
    var currentY = e.touches[0].clientY;

    var diffX = initialX - currentX;
    var diffY = initialY - currentY;

    if (Math.abs(diffX) > Math.abs(diffY)) {
      if (diffX > 0) {
        if (!(Object.keys(this.config).indexOf(this._current_entity) === Object.keys(this.config).length - 1))
          this._current_entity = Object.keys(this.config)[Object.keys(this.config).indexOf(this._current_entity) + 1];
      } else {
        if (!(Object.keys(this.config).indexOf(this._current_entity) === 1))
          this._current_entity = Object.keys(this.config)[Object.keys(this.config).indexOf(this._current_entity) - 1];
      }
    }
    initialX = null;
    initialY = null;
    this.requestUpdate();
  }

  touchMove(e, ha = this._hass) {
    if( ! initialX || ! initialY){
      return;
    }

    var currentX = e.touches[0].clientX;
    var currentY = e.touches[0].clientY;

    var diffX = initialX - currentX;
    var diffY = initialY - currentY;

    if (Math.abs(diffX) > Math.abs(diffY)) {
      if (diffX > 0) {
        if(ha.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
          ha.callService("media_player", "play_media", { media_content_id: "KEY_LEFT", media_content_type: "send_key" }, { entity_id: this.config[this._current_entity].entity });
        else
          ha.callService("remote", "send_command", { command: "KEY_LEFT" }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
        this.feedback('selection');
      } else {
        if(ha.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
          ha.callService("media_player", "play_media", { media_content_id: "KEY_RIGHT", media_content_type: "send_key" }, { entity_id: this.config[this._current_entity].entity });
        else
          ha.callService("remote", "send_command", { command: "KEY_RIGHT" }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
        this.feedback('selection');
      }
    } else {
      if (diffY > 0) {
        if(ha.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
          ha.callService("media_player", "play_media", { media_content_id: "KEY_UP", media_content_type: "send_key" }, { entity_id: this.config[this._current_entity].entity });
        else
          ha.callService("remote", "send_command", { command: "KEY_UP" }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
        this.feedback('selection');
      } else {
        if (ha.entities[this.config[this._current_entity].entity].platform.includes('samsungtv_smart'))
          ha.callService("media_player", "play_media", { media_content_id: "KEY_DOWN", media_content_type: "send_key" }, { entity_id: this.config[this._current_entity].entity });
        else
          ha.callService("remote", "send_command", { command: "KEY_DOWN" }, { entity_id: this.config[this._current_entity].entity.replace("media_player", "remote") });
        this.feedback('selection');
      }
    }
    initialX = null;
    initialY = null;
  }
  setConfig(config) {
    if (Object.keys(config).length < 2)
        throw new Error('You need to define an entity');
    this.config = config;
    if (this._current_entity === undefined || this.config[this._current_entity] === undefined)
      if( !Object.keys(this.config).slice(1).find(item => this.config[item].position === 1))
        this._current_entity = Object.keys(this.config)[1];
      else
        this._current_entity = Object.keys(this.config).slice(1).find(item => this.config[item].position === 1);
    this.requestUpdate();
  }
  }
class ContentCardEditor extends s {

  static get properties() {
    return {
      hass: {},
      _config: {},
    };
  }
  static properties = {
    tabs: { state: true },
    entityTabs: { state: true },
    displayMessage: { state: true },
    newEnt: { state: true },
    message: { state: true },
  };

  constructor (){
    super();
    this.updateIt();
    this.tabs = { power: false, source: false, mute: false, otherIcon: false, settings: true, icon: false, click: false, dblclick: false, hold: false, volume: false, channel: false };
    this.entityTabs = {};
    this.newEnt = true;
    this.moveHint = true;
    this.displayMessage = false;
    this.setMessage('Thank you');
    this.tmpName = '';
  }

  render() {
    return y`
      ${this.makeMeEntityTabMenu()}
    `;
  }

  makeMeEntityTabMenu() {
    return y`
        ${this.alert()}
        <div class="ent-tab-row " >
          ${Object.keys(this.entityTabs).map(e => {
            return y` <div class="tab ${this.entityTabs[e] ? 'selected' : ''}" @touchstart="${this.entityTabs[e] ? this.touchStart : null}" @touchmove="${this.entityTabs[e] ? this.moveCurrentEntity : null}" @click="${()=>this.changeCurrentEntity(e)}">${e.slice(0,5)}</div> `;
          })}
          ${this.newEntityTab()}
        </div>
      <ha-select class="main" id="entity-selector"  .value="${ this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)]?.entity }"  label="Entity" @selected="${this.updateIt}" @closed="${ev => ev.stopPropagation()}"  >
      ${Object.keys(this.hass.states).filter(ent => ent.match('media_player[.]')).map((entity) => {
        if (this._config[entity.substring(13)] === undefined && !this.hass.entities[entity].platform.includes('cast'))
          return y` <mwc-list-item .value="${entity}">${entity}</mwc-list-item> `;
        else if (this._config[entity.substring(13)] !== undefined && entity.substring(13) === Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0] && !this.hass.entities[entity].platform.includes('cast'))
          return y` <mwc-list-item .value="${entity}" selected>${entity}</mwc-list-item> `;
                    })}
      </ha-select>
      ${this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)] != undefined ? this.makeMeTabMenu() : null}
      `;
  }


    makeMeTabMenu(){
      return y`
          <div class="tab-row" >
            <div class="power tab ${this.tabs.power ? 'selected' : ''}" @click="${()=>{this.changeTab('power')}}"><ha-icon icon="mdi:power"></ha-icon></div>
            <div class="source tab ${this.tabs.source ? 'selected' : ''}" @click="${()=>{this.changeTab('source')}}"><ha-icon icon="mdi:logout-variant"></ha-icon></div>
            <div class="mute tab ${this.tabs.mute ? 'selected' : ''}" @click="${()=>{this.changeTab('mute')}}"><ha-icon icon="mdi:volume-mute"></ha-icon></div>
            <div class="otherIcon tab ${this.tabs.otherIcon ? 'selected' : ''}" @click="${()=>{this.changeTab('otherIcon')}}"><ha-icon icon="mdi:plus-minus-variant"></ha-icon></div>
            <div class="settings tab ${this.tabs.settings ? 'selected' : ''}" @click="${()=>{this.changeTab('settings')}}"><ha-icon icon="mdi:tune"></ha-icon></div>
          </div>
          <div class="sub-tabs">
          ${this.subTabs()}
        </div>
      `;
    }

  subTabs(){
    let normalCase =  y`
          <div class="sub-tabs-row ${this.tabs.settings ? 'hide' : 'show'}" >
            <div class="click tab ${this.tabs.click ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('click')}}">Click</div>
            <div class="dblclick tab ${this.tabs.dblclick ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('dblclick')}}">Double click</div>
            <div class="hold tab ${this.tabs.hold ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('hold')}}">Hold</div>
            <div class="icon tab ${this.tabs.icon ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('icon')}}">Icon</div>
          </div>
          <div class="content">
            ${this.putUpConfig()}
          </div>`;

    let otherIcon = y`
        <div class="sub-tabs-row show" >
          <div class="volume tab ${this.tabs.volume ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('volume')}}">Volume</div>
          <div class="channel tab ${this.tabs.channel ? 'sub-selected' : ''}" @click="${()=>{this.changeTab('channel')}}">Channel</div>
        </div>
        <div class="content">
          ${this.putUpConfig()}
        </div>`;
    if(Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] !== 'otherIcon')
      return normalCase;
    else
      return otherIcon;
  }

  putUpConfig(){
    let currSelection = Object.keys(this.tabs).filter(e => this.tabs[e] === true);
    if(currSelection[0] === 'settings')
      return this.generalConfig();
    else
      switch (currSelection[1]) {
        case 'click':
          return this.clickConfig(currSelection[0]);
        case 'dblclick':
            return this.dblclickConfig(currSelection[0]);
        case 'hold':
            return this.holdConfig(currSelection[0]);
        case 'icon':
          return this.iconConfig(currSelection[0]);
        case 'volume':
          return this.doubleConfig(currSelection[1]);
        case 'channel':
          return this.doubleConfig(currSelection[1]);
      }
  }


  doubleConfig(a) {
    return y`
    ${this.iconConfig(a+'_up',true)}
    ${this.iconConfig(a + '_down',true)}
    ${this.clickConfig(a + '_up',true)}
    ${this.clickConfig(a+'_down',true)}`;
  }

iconConfig(a, double = false) {
    return y`
          <ha-icon-picker id="${double?a.replace('_','-')+'-':''}icon-selector" label="${a === 'topicon' ? 'Entity' : a.replace('_','-')+' button'} icon" @opened-changed="${this.updateIt}" @value-changed="${this.updateIt}" .value="${this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons[a]}" ></ha-icon-picker>
        `;
  }

clickConfig(a,double=false){
      let directSelector = y`
        <ha-select id="${double?a.replace('_','-')+'-':''}click-service-selector" allow-custom-value .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.type === 'default' ? 'default' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.entity }" label="What to do on ${a.replace('_','-')} click" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'default'}">Default</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
          ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
        </ha-select>`;
      let advancedSelector = y `
        <ha-select id="${double?a.replace('_','-')+'-':''}click-service-selector"  .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.type }" label="What to do on ${a} click" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'default'}">Default</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
        ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
        </ha-select>
        <ha-select id="${double?a.replace('_','-')+'-':''}click-entity-selector"  .value="${this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.entity !== undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.entity : null}"  label="Entity" @selected="${this.updateIt}" @closed="${ev => ev.stopPropagation()}"  >
            ${Object.keys(this.hass.states).filter(e => !e.match(/script|automation|sensor|device_tracker|binary_sensor|number|update|person|sun|zone|persistent_notification|weather|input|camera|counter|select/)).map(entity => {
                              return y` <mwc-list-item .value="${entity}">${entity}</mwc-list-item> `;
                          })}
          </ha-select>`;
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].click.type.match(/toggle|turn-on|turn-off/))
          return advancedSelector;
        else
          return directSelector;
  }

dblclickConfig(a){
    let directSelector = y`
      <ha-select id="dblclick-service-selector" allow-custom-value .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.type === 'no-action' ? 'no-action' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.entity }" label="What to do on ${a} double click" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'no-action'}">Nothing</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
          ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
      </ha-select>`;

    let advancedSelector = y `
      <ha-select id="dblclick-service-selector"  .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.type }" label="What to do on ${a} double click" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'no-action'}">Nothing</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
        ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
      </ha-select>
      <ha-select id="dblclick-entity-selector"  .value="${this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.entity !== undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.entity : null}"  label="Entity" @selected="${this.updateIt}" @closed="${ev => ev.stopPropagation()}"  >
          ${Object.keys(this.hass.states).filter(e => !e.match(/script|automation|sensor|device_tracker|binary_sensor|number|update|person|sun|zone|persistent_notification|weather|input|camera|counter|select/)).map(entity => {
                            return y` <mwc-list-item .value="${entity}">${entity}</mwc-list-item> `;
                        })}
          </ha-select>`;

      if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].dblclick.type.match(/toggle|turn-on|turn-off/))
        return advancedSelector;
      else
        return directSelector;

  }
holdConfig(a){
    let directSelector = y`
      <ha-select id="hold-service-selector"  .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.type === 'no-action' ? 'no-action' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.entity }" label="What to do on ${a} hold" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'no-action'}">Nothing</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
          ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
      </ha-select>`;

    let advancedSelector = y `
      <ha-select id="hold-service-selector"  .value="${ this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.type }" label="What to do on ${a} hold" @selected="${this.updateIt }" @closed="${ev => ev.stopPropagation()}"  >
        <mwc-list-item .value="${'no-action'}">Nothing</mwc-list-item>
        <mwc-list-item .value="${'toggle'}"> Toggle</mwc-list-item>
        <mwc-list-item .value="${'turn-on'}"> Turn on</mwc-list-item>
        <mwc-list-item .value="${'turn-off'}"> Turn off</mwc-list-item>
        ${Object.keys(this.hass.states).filter(ent => ent.match(/automation|script/)).map(action => {
                              return y` <mwc-list-item .value="${action}">${action}</mwc-list-item> `;
                          })}
      </ha-select>
      <ha-select id="hold-entity-selector"  .value="${this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.entity !== undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.entity : null}"  label="Entity" @selected="${this.updateIt}" @closed="${ev => ev.stopPropagation()}"  >
          ${Object.keys(this.hass.states).filter(e => !e.match(/script|automation|sensor|device_tracker|binary_sensor|number|update|person|sun|zone|persistent_notification|weather|input|camera|counter|select/)).map(entity => {
                            return y` <mwc-list-item .value="${entity}">${entity}</mwc-list-item> `;
                        })}
          </ha-select>`;

      if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[a].hold.type.match(/toggle|turn-on|turn-off/))
        return advancedSelector;
      else
        return directSelector;

  }
generalConfig() {
    if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].hasOwnProperty('icons') && this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].hasOwnProperty('entity')){
      return y`
      <ha-textfield label="displayed name(Empty for default)" id="name" .value="${this.tmpName}"  @input="${this.updateIt}" @focus="${this.tmpName = this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].display_name}" @blur="${this.updateIt}"></ha-textfield>
      ${this.iconConfig('topicon')}
      <ha-formfield style="padding:1rem;padding-left:0;" class="switch-wrapper" label="Fancy Borders"><ha-switch id="fancy-borders-selector" .checked="${this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].fancy_borders}" @change="${this.updateIt}"></ha-switch></ha-formfield>
    `;
    }
  }
changeTab(e) {
    if(Object.keys(this.tabs).filter(e => this.tabs[e] == true)[0].match(/power|source|mute/) )
      if(Object.keys(this.tabs).filter(e => this.tabs[e] == true)[1].match(/click|dblclick|hold/))
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] == true)[0]][Object.keys(this.tabs).filter(e => this.tabs[e] == true)[1]].type.match(/toggle|turn-on|turn-off/) && this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] == true)[0]][Object.keys(this.tabs).filter(e => this.tabs[e] == true)[1]].entity === null)
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] == true)[0]][Object.keys(this.tabs).filter(e => this.tabs[e] == true)[1]].type = 'no-action';
    if(e.match(/^(click|dblclick|hold|icon|volume|channel)$/))
        Object.keys(this.tabs).filter(val => val.match(/^(click|dblclick|hold|icon|volume|channel)$/)).forEach(va => this.tabs[va] = false);
      else if (e.match(/^(power|mute|source|otherIcon|settings)$/)){
        Object.keys(this.tabs).forEach(e => this.tabs[e] = false);
        if(e != 'settings' )
          if(e === 'otherIcon')
            this.tabs['volume'] = true;
          else
            this.tabs['click'] = true;
      }
      this.tabs[e] = true;

      this.requestUpdate();
}

setConfig(config) {
  this.orderConfig(config);
  if (Object.keys(this.entityTabs).length === 0)
    Object.keys(this._config).slice(1).forEach(e => {
      this.entityTabs[e] = false;
    });
  if (Object.keys(this._config).length > 1) {
    if (Object.values(this.entityTabs).every(element => element === false) || Object.values(this.entityTabs).every(element => element === true)) {
      this.entityTabs[Object.keys(this.entityTabs)[0]] = true;
    }
    if (Object.keys(this._config).length === 2)
      this.entityTabs[Object.keys(this.entityTabs)[0]] = true;
  }
}

orderConfig(config){
  let tempConfig = JSON.parse(JSON.stringify(config));
  if (Object.keys(tempConfig).length > 0) {
    let newOrder = Object.keys(tempConfig).slice(1).sort(
      (a, b) => {
        return tempConfig[a].position - tempConfig[b].position
      });
    delete this._config;
    this._config = {};
    this._config.type = tempConfig.type;

    newOrder.forEach((item) => {
      this._config[item] = JSON.parse(JSON.stringify(tempConfig[item]));
    });
    for (let i = 1; i < Object.keys(this._config).length; i++) {
      this._config[Object.keys(this._config)[i]].position = i;
    }
  }
  else
    this._config = JSON.parse(JSON.stringify(tempConfig));
  return this._config;
}

orderEntityTabs(){
  let tempEntityTabs = {};
  let newOrder = Object.keys(this.entityTabs).sort(
    (a, b) => {
      return this._config[a].position - this._config[b].position
    });
  delete this.entityTabs;
  newOrder.forEach((item) => {
    tempEntityTabs[item] = this.entityTabs[item];
  });
  this.entityTabs = tempEntityTabs;
}

alert() {;
  let alert = document.createElement('div');
  alert.classList.add('alerts', 'fade');
  alert.style.color = this.displayMessage ? 'var(--mdc-theme-primary)' : 'transparent';
  alert.innerHTML = this.message;
  alert.offsetWidth;
  return alert;
}


newEntityTab() {
  if(this.newEnt)
    return y`<div class="tab new selected" @click="${this.changeCurrentEntity}">New</div>`;
  else if (this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)] != undefined)
    return y`
    <div class="add tab" @click="${this.addEntity}"><ha-icon icon="mdi:plus"></ha-icon></div>
    <div class="remove action-tab"><ha-icon icon="mdi:delete" @touchstart="${()=> this.removeEnt('start')}" @touchend="${()=>this.removeEnt('stop')}" @click="${()=>this.setMessage('long press to remove')}"></ha-icon></div>
    `;
}

addEntity() {
  Object.keys(this.entityTabs).forEach(e => {
    this.entityTabs[e] = false;
  });
  this.newEnt = true;
}

removeEnt(what) {
  if (what === 'start')
    holdRemove = setTimeout(() => {
      let entToRemove = Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true);
      let i = Object.keys(this._config).indexOf(entToRemove[0]);
      delete this._config[entToRemove];
      delete this.entityTabs[entToRemove];
      if (Object.keys(this._config).length === 1)
        this.newEnt = true;
      else
        this.entityTabs[Object.keys(this.entityTabs)[0]] = true;
      for (i; i < Object.keys(this._config).length; i++){
        this._config[Object.keys(this._config)[i]].position = i;
      }
      this.setMessage('removed ' + entToRemove);

    }, 1000);
  else if (what === 'stop')
    clearTimeout(holdRemove);
}

setMessage(message) {
  this.message = message;
  this.displayMessage = false;
  this.displayMessage = true;
  clearTimeout(msg);
  msg = setTimeout(() => {
    this.displayMessage = false;
  }, 5000);

}

touchStart(e){
  window.initialX = e.touches[0].clientX;
  window.initialY = e.touches[0].clientY;
}

moveCurrentEntity(e) {
  if( ! initialX || ! initialY){
    return;
  }

  var currentX = e.touches[0].clientX;
  var currentY = e.touches[0].clientY;

  var diffX = initialX - currentX;
  var diffY = initialY - currentY;
  if (Math.abs(diffX) > Math.abs(diffY)) {
    if (diffX > 0) {
      if(Object.keys(this.entityTabs).indexOf(Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]) === 0){
        this.setMessage('first element');
      }
      else{
        this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].position--;
        this._config[Object.keys(this.entityTabs)[Object.keys(this.entityTabs).indexOf(Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0])-1]].position++;
        this.orderConfig(this._config);
        this.orderEntityTabs();
      }

    } else {
      if(Object.keys(this.entityTabs).indexOf(Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]) === Object.keys(this.entityTabs).length-1){
        this.setMessage('last element');
      }
      else{
        this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].position++;
        this._config[Object.keys(this.entityTabs)[Object.keys(this.entityTabs).indexOf(Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0])+1]].position--;
        this.orderConfig(this._config);
        this.orderEntityTabs();
      }
    }
  }
  initialX = null;
  initialY = null;
  chgConfig.detail = { config: this._config };
  this.dispatchEvent(chgConfig);
  this.requestUpdate();
}


changeCurrentEntity(caller) {
  if (this.moveHint) {
    this.setMessage('Swipe on selected entity tab to move it');
    this.moveHint = false;
  }
  Object.keys(this.entityTabs).forEach(e => {
    this.entityTabs[e] = false;
  });
  this.entityTabs[caller] = true;

  chgConfig.detail = { config: this._config };
  this.dispatchEvent(chgConfig);
  this.requestUpdate();
}


updateIt(e, ha = this.hass) {

  if (e?.target.id === 'entity-selector' && e.target.value !== undefined && e.target.value !== null && e.target.value.length !== 0) {
    if (this._config[e.target.value.substring(13)] === undefined) {

      if (!this.newEnt && this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)]?.entity !== undefined) {
        this._config[e.target.value.substring(13)] = JSON.parse(JSON.stringify(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)]));
        delete this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)];
        delete this.entityTabs[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)];
      }

      this.entityTabs[e.target.value.substring(13)] = true;
      this._config[e.target.value.substring(13)] = {};
      this._config[e.target.value.substring(13)].entity = e.target.value;
      this._config[e.target.value.substring(13)].display_name = this.hass.states[e.target.value].attributes.friendly_name.slice(0, 10);
      this.tmpName = this._config[e.target.value.substring(13)].display_name;
      if (!this._config[e.target.value.substring(13)].hasOwnProperty('position'))
        this._config[e.target.value.substring(13)].position = Object.keys(this._config).length - 1;
    }

    this.newEnt = false;
  }

  if (this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)]?.entity != undefined) {

      if(!this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].hasOwnProperty('display_name')){
        this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].display_name = this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].display_name.slice(0,10) || this.hass.states[this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]]?.entity].attributes.friendly_name.slice(0,10);
      }

    if(!this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].hasOwnProperty('fancy_borders'))
      this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].fancy_borders = true;

    if(!this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].hasOwnProperty('actions')){
      this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions = {
        power: {click: {type: 'default',entity: null}, dblclick: {type: 'no-action',entity: null},hold:  {type: 'no-action',entity: null}},
        source: {click: {type: 'default',entity: null}, dblclick: {type: 'no-action',entity: null},hold:  {type: 'no-action',entity: null}},
        mute: { click: { type: 'default', entity: null }, dblclick: { type: 'no-action', entity: null }, hold: { type: 'no-action', entity: null } },
        touchpad: { click: { type: 'default', entity: null }, dblclick: { type: 'default', entity: null }, hold: { type: 'default', entity: null } },
        volume_up: { click: { type: 'default', entity: null } , hold: { type: 'default', entity: null }},
        volume_down: { click: { type: 'default', entity: null } , hold: { type: 'default', entity: null }},
        channel_up: { click: { type: 'default', entity: null } , hold: { type: 'default', entity: null }},
        channel_down: { click: { type: 'default', entity: null } , hold: { type: 'default', entity: null }}
      };
    }

    if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].hasOwnProperty('icons')){
      this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons = {
        topicon: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.topicon === undefined ? 'mdi:youtube-tv' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.topicon,
        power: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.power === undefined ? 'mdi:power' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.power,
        channel_up: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.channel_up === undefined ? 'mdi:arrow-up-bold-circle' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.channel_up,
        channel_down: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.channel_down === undefined ? 'mdi:arrow-down-bold-circle' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.channel_down,
        source: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.source === undefined ? 'mdi:logout-variant' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.source,
        mute: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.mute === undefined ? 'mdi:volume-variant-off' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.mute,
        volume_up: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.volume_up === undefined ? 'mdi:volume-high' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.volume_up,
        volume_down: this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.volume_down === undefined ? 'mdi:volume-medium' : this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons.volume_down
      };

      }
    else {
      this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons = {
        topicon: 'mdi:youtube-tv',
        power: 'mdi:power',
        channel_up: 'mdi:arrow-up-bold-circle',
        channel_down: 'mdi:arrow-down-bold-circle',
        source: 'mdi:logout-variant',
        mute: 'mdi:volume-variant-off',
        volume_up: 'mdi:volume-high',
        volume_down: 'mdi:volume-medium'
      };
    }

    if (e?.target.id === 'click-service-selector' || e?.target.id === 'click-entity-selector') {
      if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.entity !== e.target.value)
        if(e?.target.id === 'click-service-selector')
          if(e.target.value.match(/toggle|turn-on|turn-off|default/)){
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.type = e.target.value;
            if(e.target.value === 'default'){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.type = 'default';
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.entity = null;}
            this.putUpConfig();
            this.requestUpdate();
          }
          else {
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.type = e.target.value.substring(0,e.target.value.indexOf('.'));
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.entity = e.target.value;
          }
        else if(e?.target.id === 'click-entity-selector' )
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].click.entity = e.target.value;
      else
        return;
    }
      if(e?.target.id === 'hold-service-selector' || e?.target.id === 'hold-entity-selector'){
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.entity !== e.target.value)
          if(e?.target.id === 'hold-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|no-action/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.type = e.target.value;
              if(e.target.value === 'no-action'){
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.type = 'no-action';
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.entity = null;}
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.entity = e.target.value;
            }
          else if(e?.target.id === 'hold-entity-selector' )
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].hold.entity = e.target.value;
        else
          return;
      }
      if(e?.target.id === 'dblclick-service-selector' || e?.target.id === 'dblclick-entity-selector'){
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.type != e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.entity !== e.target.value)
          if(e?.target.id === 'dblclick-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|no-action/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.type = e.target.value;
              if(e.target.value === 'no-action')
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.entity = null;
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.entity = e.target.value;
            }
          else if(e?.target.id === 'dblclick-entity-selector' ){
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]].dblclick.entity = e.target.value;}
        else
          return;
      }


      if (e?.target.id === 'volume-up-click-service-selector' || e?.target.id === 'volume-up-click-entity-selector') {
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.entity !== e.target.value)
          if(e?.target.id === 'volume-up-click-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|default/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.type = e.target.value;
              if(e.target.value === 'default'){
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.type = 'default';
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.entity = null;}
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.entity = e.target.value;
            }
          else if(e?.target.id === 'volume-up-click-entity-selector' )
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_up'].click.entity = e.target.value;
        else
          return;
      }


      if (e?.target.id === 'volume-down-click-service-selector' || e?.target.id === 'volume-down-click-entity-selector') {
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.entity !== e.target.value)
          if(e?.target.id === 'volume-down-click-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|default/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.type = e.target.value;
              if(e.target.value === 'default'){
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.type = 'default';
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.entity = null;}
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.entity = e.target.value;
            }
          else if(e?.target.id === 'volume-down-click-entity-selector' )
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['volume_down'].click.entity = e.target.value;
        else
          return;
      }



      if (e?.target.id === 'channel-up-click-service-selector' || e?.target.id === 'channel-up-click-entity-selector') {
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.entity !== e.target.value)
          if(e?.target.id === 'channel-up-click-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|default/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.type = e.target.value;
              if(e.target.value === 'default'){
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.type = 'default';
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.entity = null;}
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.entity = e.target.value;
            }
          else if(e?.target.id === 'channel-up-click-entity-selector' )
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_up'].click.entity = e.target.value;
        else
          return;
      }



      if (e?.target.id === 'channel-down-click-service-selector' || e?.target.id === 'channel-down-click-entity-selector') {
        if(this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.type !== e.target.value || this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.entity !== e.target.value)
          if(e?.target.id === 'channel-down-click-service-selector')
            if(e.target.value.match(/toggle|turn-on|turn-off|default/)){
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.type = e.target.value;
              if(e.target.value === 'default'){
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.type = 'default';
                this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.entity = null;}
              this.putUpConfig();
              this.requestUpdate();
            }
            else {
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.type = e.target.value.substring(0,e.target.value.indexOf('.'));
              this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.entity = e.target.value;
            }
          else if(e?.target.id === 'channel-down-click-entity-selector' )
            this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].actions['channel_down'].click.entity = e.target.value;
        else
          return;
      }

      if (e?.target.id === 'volume-up-icon-selector') {
        if(Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] === 'otherIcon')
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['volume_up'] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['volume_up'] : e?.target?.value;
      }

      if (e?.target.id === 'volume-down-icon-selector') {
        if(Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] === 'otherIcon')
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['volume_down'] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['volume_down'] : e?.target?.value;
      }

      if (e?.target.id === 'channel-up-icon-selector') {
        if(Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] === 'otherIcon')
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['channel_up'] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['channel_up'] : e?.target?.value;
      }

      if (e?.target.id === 'channel-down-icon-selector') {
        if(Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] === 'otherIcon')
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['channel_down'] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['channel_down'] : e?.target?.value;
      }

      if (e?.target.id === 'icon-selector') {
        if (Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0] === 'settings') {
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['topicon'] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons['topicon'] : e?.target?.value;
        }
        else {
          this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]] = e?.target?.value === undefined ? this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].icons[Object.keys(this.tabs).filter(e => this.tabs[e] === true)[0]] : e?.target?.value;
        }
      }

      if(e?.target.id === 'name'){
        this.tmpName = e?.target.value;
        this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].display_name = e?.target.value === '' ? this.hass.states[this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)[0]].entity].attributes.friendly_name.slice(0,10) : e?.target.value;
      }

      if(e?.target.id === 'fancy-borders-selector' )
        this._config[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].fancy_borders = !this._config?.[Object.keys(this.entityTabs).filter(e => this.entityTabs[e] === true)].fancy_borders ;
    }

    chgConfig.detail = { config: this._config };
    this.dispatchEvent(chgConfig);
    this.requestUpdate();
  }
  static get styles(){
    return i$1`
      ha-select.main{
        border-top: 3px solid var(--mdc-theme-primary);
        width: 100%;
        margin-bottom: 0.5rem;
      }

      .content > *{
        padding:0;
        width:100%;
      }

      .sub-selected {
        color: white;
        padding-bottom:0;
        border-bottom: 3px solid var(--mdc-theme-primary);
        border-top: 0;
      }
      .sub-tabs-row :not(.sub-selected){
        color: gray;
      }

      ha-icon {
        margin: 0;
        color: gray;
      }
      .selected ha-icon {
        color: white
      }

      .sub-tabs-row .tab{
        display: inline-block;
        padding-left: 1rem;
        padding-right: 1rem;
      }
      .sub-tabs-row{
        padding-top: 7px;
        padding-bottom: 2px;
        text-align: center;
        margin:0 auto auto auto;
      }
      .content{
        display:block;
      }
      .sub-tabs {
        border-top: 3px solid var(--mdc-theme-primary);
        border-radius: 0.2rem ;
        background-color: var(--card-background-color);
      }

      .ent-tab-row .tab{
        margin: 0 0.5rem;
        text-align: center;
      }
      div.add{
        float: right;
        display: inline-block;
        transform: translateY(5px);
        text-align: center;
        padding: 0 0.3rem;
        height: 100%;
      }
      div.remove{
        float: right;
        display: inline-block;
        transform: translateY(5px);
        text-align: center;
        padding: 0 0.3rem;
        height: 100%;      }

      .tab-row{
        text-align: center;
        display: flex;
        flex-direction: row;
      }

      .tab{
        display: inline-block;
        margin: auto;
      }

      .selected {
        border-radius: 0.9rem 0.9rem 0 0;
        padding: 0.5rem 1.7rem;
        background-color: var(--mdc-theme-primary);
      }



      .alerts{
        text-align: center;
        margin-bottom: 0.5rem;
      }
      .fade{
        animation: fadeOut 5s;
      }

      @keyframes fadeOut {
        0% { opacity: 1; }
        100% { opacity: 0; }
      }

      .hide{
        display: none;
      }
      .show{
        display: block;
      }
    `;
  }
}

customElements.define("contento-card-editor", ContentCardEditor);

customElements.define('my-tv-card', MyElement);
window.customCards = window.customCards || [];
window.customCards.push({
  type: "my-tv-card",
  name: "Touchpad remote for tv",
  preview: false,
  description: "A confortable tv remote with touchpad"
});
