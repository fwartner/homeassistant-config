import {
  LitElement,
  html,
  css,
} from "https://cdn.jsdelivr.net/npm/lit-element@4.1.1/+esm";
import { fireEvent } from "./utils.js";

const SCHEMA = [
  { name: "title", selector: { text: {} } },
  { name: "url", selector: { text: {} } },
  { name: "fallback_image", selector: { text: {} } },
  {
    name: "",
    type: "grid",
    schema: [
      { name: "entity", selector: { entity: {} } },
      {
        name: "attribute",
        selector: { attribute: { entity_id: "" } },
        context: { filter_entity: "entity" },
      },
    ],
  },
  {
    name: "",
    type: "grid",
    schema: [{ name: "tap_action", selector: { "ui-action": {} } }],
  },
  {
    name: "refresh_interval",
    required: true,
    selector: { number: { min: 1, mode: "box"} },
  },
  { name: "noMargin", selector: { boolean: {} } },
];

class ResfeshablePictureCardEditor extends LitElement {
  static properties = {
    hass: {},
    _config: {},
  };

  setConfig(config) {
    this._config = config;
  }

  render() {
    if (!this.hass || !this._config) {
      return html``;
    }

    return html`
      <ha-form
        .hass=${this.hass}
        .data=${this._config}
        .schema=${SCHEMA}
        .computeLabel=${this._computeLabelCallback}
        @value-changed=${this._valueChanged}
      />
      <!-- Explicit fallback_image field: some HA versions or themes may hide custom
           ha-form fields — render a dedicated input so users always can set it. -->
      <div style="margin-top:12px;">
        <label style="display:block; font-size:14px; margin-bottom:6px;">${this._computeLabelCallback({name: 'fallback_image'})}</label>
        <ha-textfield
          .value=${this._config.fallback_image || ''}
          @input=${this._fallbackInput}
          placeholder="/local/placeholder.jpg or https://..."
        ></ha-textfield>
      </div>
    `;
  }

  _valueChanged = (ev) =>
    fireEvent(this, "config-changed", { config: ev.detail.value });

  _computeLabelCallback = (schema) => {
    const { name } = schema;
    switch (name) {
      case "fallback_image":
        return "Fallback image (optional)";
      case "noMargin":
        return "Remove margin";
      // return this.hass.localize(
      //   `refreshable-picture-card.${name}`
      // );
      case "refresh_interval":
        return this.hass.localize(
          `ui.panel.lovelace.editor.card.generic.${name}`
        );
      default:
        return `${this.hass.localize(
          `ui.panel.lovelace.editor.card.generic.${name}`
        )} (${this.hass.localize(
          "ui.panel.lovelace.editor.card.config.optional"
        )})`;
    }
  };

  _fallbackInput = (ev) => {
    const value = ev.target.value;
    const cfg = { ...(this._config || {}) };
    if (value === '') {
      // remove the key when empty
      delete cfg.fallback_image;
    } else {
      cfg.fallback_image = value;
    }
    fireEvent(this, 'config-changed', { config: cfg });
  };

  static styles = css`
    .card-config {
      /* Cancels overlapping Margins for HAForm + Card Config options */
      overflow: auto;
    }
    ha-switch {
      padding: 16px 6px;
    }
    .side-by-side {
      display: flex;
      align-items: flex-end;
    }
    .side-by-side > * {
      flex: 1;
      padding-right: 8px;
    }
    .side-by-side > *:last-child {
      flex: 1;
      padding-right: 0;
    }
    .suffix {
      margin: 0 8px;
    }
    hui-action-editor,
    ha-select,
    ha-textfield,
    ha-icon-picker {
      margin-top: 8px;
      display: block;
    }
  `;
}

customElements.define(
  "refreshable-picture-card-editor",
  ResfeshablePictureCardEditor
);
