import {
  LitElement,
  html,
  css,
} from "https://cdn.jsdelivr.net/npm/lit-element@4.1.1/+esm";
import "./refreshable-picture-card-editor.js";
import { handleAction } from "./utils.js";

class ResfeshablePictureCard extends LitElement {
  static properties = {
    hass: {},
    config: {},
    pictureUrl: {},
  };

  _refreshInterval;

  constructor() {
    super();
    this.pictureUrl = "";
    this.hasError = false;
  }

  static getConfigElement() {
    return document.createElement("refreshable-picture-card-editor");
  }

  static getStubConfig() {
    return {
      type: "custom:refreshable-picture-card",
      title: "", // Default to empty title
      refresh_interval: 30,
      url: "",
      entity: "",
      attribute: "",
      noMargin: true,
      tap_action: { action: "none" },
    };
  }

  setConfig(config) {
    if (!config.url && !config.entity) {
      throw new Error("You need to define either a url or an entity");
    }
    if (config.url && config.entity) {
      throw new Error("You need to define only one of url or entity");
    }
    this.config = config;
  }

  connectedCallback() {
    super.connectedCallback?.();
    const refreshTime = (this.config.refresh_interval || 30) * 1000;

    if (this._refreshInterval) {
      clearInterval(this._refreshInterval);
    }
    this._refreshInterval = setInterval(
      () => (this.pictureUrl = this._getTimestampedUrl()),
      refreshTime
    );

    // calling it after 10 ms ensures this.hass will be set
    setTimeout(() => (this.pictureUrl = this._getTimestampedUrl()), 10);
  }

  disconnectedCallback() {
    super.disconnectedCallback?.();
    if (this._refreshInterval) {
      clearInterval(this._refreshInterval);
      this._refreshInterval = undefined;
    }
  }

  onError() {
    if (!this.hasError) {
      this.hasError = true;
      this.pictureUrl = this._getTimestampedUrl();
    }
  }

  onLoad() {
    this.hasError = false;
  }

  render() {
    const { noMargin, title = '', tap_action } = this.config; // Default empty title
    const navigationPath = tap_action?.navigation_path || ""; // Extract navigation_path

    return html`
	  <!-- Tooltip with navigation path -->
      <ha-card 
        header=${title} 
        @click="${this._onClick}" 
        title="${navigationPath}"
      >
        <div class=${noMargin ? "withoutMargin" : "withMargin"}>
          ${this.pictureUrl != ''
            ? html`<img class="center" @error="${this.onError}" @load="${this.onLoad}" src="${this.pictureUrl}" />`
            : ''}
        </div>
      </ha-card>
    `;
  }

  _onClick() {
    const { config, hass } = this;
    const { tap_action } = config;
    if (!tap_action) {
      return;
    }
    handleAction(this, hass, config, tap_action);
  }

  static styles = css`
    .center {
      display: block;
      margin-top: auto;
      margin-bottom: auto;
      margin-left: auto;
      margin-right: auto;
      background: var(
        --ha-card-background,
        var(--card-background-color, white)
      );
      box-shadow: var(--ha-card-box-shadow, none);
      box-sizing: border-box;
      border-width: var(--ha-card-border-width, 1px);
      border-style: solid;
      border-color: var(--ha-card-border-color, var(--divider-color, #e0e0e0));
      color: var(--primary-text-color);
      transition: all 0.3s ease-out 0s;
      position: relative;
      border-radius: var(--ha-card-border-radius, 12px);
      width: 100%;
    }
    .withMargin {
      margin: 5%;
    }
    .withoutMargin {
      margin: 0;
    }
    .txt {
      color: var(--ha-card-header-color, --primary-text-color);
      font-family: var(--ha-card-header-font-family, inherit);
      font-size: var(--ha-card-header-font-size, 24px);
      letter-spacing: -0.012em;
      line-height: 32px;
    }
    ha-card {
      cursor: pointer; /* Changes the cursor to a pointer to indicate clickability */
      transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
    }
    ha-card:hover {
      transform: scale(1.02); /* Slightly enlarges the card on hover */
      box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2); /* Adds a shadow effect on hover */
    }
  `;

  _getPictureUrl() {
    const { url, entity, attribute } = this.config;
    if (!entity) {
      return url;
    }
    const pictStates = this.hass.states[entity];
    return attribute ? pictStates["attributes"][attribute] : pictStates.state;
  }

  _getTimestampedUrl() {
    let url = this._getPictureUrl();

    if (url.indexOf("?") > -1) {
      url = url + "&currentTimeCache=" + new Date().getTime();
    } else {
      url = url + "?currentTimeCache=" + new Date().getTime();
    }

    return url || "";
  }

  getCardSize() {
    return 3;
  }
}

const cardDef = {
  type: "refreshable-picture-card",
  name: "Refreshable Picture Card",
  description:
    "A picture that can be loaded from url or entity attribute and refreshed every N seconds",
  preview: true,
  documentationURL: "https://github.com/dimagoltsman/refreshable-picture-card",
  configurable: true,
};
window.customCards = window.customCards || [];
window.customCards.push(cardDef);

customElements.define("refreshable-picture-card", ResfeshablePictureCard);