window.customCards = window.customCards || [];
window.customCards.push({
  type: "cover-position-preset-row",
  name: "cover position preset row",
  description: "A plugin to display your cover controls in a button row.",
  preview: false,
});

const LitElement = customElements.get("ha-panel-lovelace") ? Object.getPrototypeOf(customElements.get("ha-panel-lovelace")) : Object.getPrototypeOf(customElements.get("hc-lovelace"));
const html = LitElement.prototype.html;
const css = LitElement.prototype.css;

class CustomCoverPositionRow extends LitElement {


	constructor() {
		super();
		this._config = {
			customTheme: false,
			customSetpoints: false,
			customText: false,
			reverseButtons: false,
			allowDisablingButtons: true,
			openPosition: 99,
			midOpenPosition: 66,
			midClosePosition: 33,
			closePosition: 0,
			width: '30px',
			height: '30px',
			isOpenedColor: '#f44c09',
			isMidOpenedColor: '#f44c09',
			isMidClosedColor: '#f44c09',
			isClosedColor: '#43A047',
			buttonInactiveColor: '#759aaa',
			customOpenText: '99%',
			customMidOpenText: '66%',
			customMidClosedText: '33%',
			customClosedText: '0%',
		};
	}

	static get properties() {
		return {
			hass: Object,
			_config: Object,
			_stateObj: Object,
			_leftColor: String,
			_midLeftColor: String,
			_midRighthColor: String,
			_rightColor: String,
			_width: String,
			_height: String,
			_leftText: String,
			_midLeftText: String,
			_midRightText: String,
			_rightText: String,
			_leftName: String,
			_midLeftName: String,
			_midRightName: String,
			_rightName: String,
			_leftPosition: Boolean,
			_midLeftPosition: Boolean,
			_midRightPosition: Boolean,
			_rightPosition: Boolean,
			_leftSP: Number,
			_midLeftSP: Number,
			_midRightSP: Number,
			_rightSP: Number,
		};
	}

	static get styles() {
		return css`
			:host {
				line-height: inherit;
			}
			.box {
				display: flex;
				flex-direction: row;
			}
			.position {
				margin-left: 2px;
				margin-right: 2px;
				background-color: #759aaa;
				border: 1px solid lightgrey; 
				border-radius: 4px;
				font-size: 10px !important;
				color: inherit;
				text-align: center;
				float: left !important;
				padding: 1px;
				cursor: pointer;
			}
		`;
	}
	
	render() {
		return html`
			<hui-generic-entity-row .hass="${this.hass}" .config="${this._config}">
				<div id='button-container' class='box'>
					<button
						class='position'
						style='${this._leftColor};min-width:${this._width};max-width:${this._width};height:${this._height}'
						toggles name="${this._leftName}"
						@click=${this.setPosition}
						.disabled=${this._leftState}>${this._leftText}</button>
					<button
						class='position'
						style='${this._midLeftColor};min-width:${this._width};max-width:${this._width};height:${this._height};${this._hideMidLeft}'
						toggles name="${this._midLeftName}"
						@click=${this.setPosition}
						.disabled=${this._midLeftState}>${this._midLeftText}</button>
					<button
						class='position'
						style='${this._midRightColor};min-width:${this._width};max-width:${this._width};height:${this._height};${this._hideMidRight}'
						toggles name="${this._midRightName}"
						@click=${this.setPosition}
						.disabled=${this._midRightState}>${this._midRightText}</button>
					<button
						class='position'
						style='${this._rightColor};min-width:${this._width};max-width:${this._width};height:${this._height}'
						toggles name="${this._rightName}"
						@click=${this.setPosition}
						.disabled=${this._rightState}>${this._rightText}</button>
				</div>
			</hui-generic-entity-row>
		`;
	}
	
	firstUpdated() {
		super.firstUpdated();
		this.shadowRoot.getElementById('button-container').addEventListener('click', (ev) => ev.stopPropagation());
	}

	setConfig(config) {
		this._config = { ...this._config, ...config };
	}

	updated(changedProperties) {
		if (changedProperties.has("hass")) {
			this.hassChanged();
		}
	}
	
	hassChanged(hass) {

		const config = this._config;
		const stateObj = this.hass.states[config.entity];
		const custTheme = config.customTheme;
		const custSetpoint = config.customSetpoints;
		const custTxt = config.customText;
		const revButtons = config.reverseButtons;
		const allowDisable = config.allowDisablingButtons;
		const buttonWidth = config.width;
		const buttonHeight = config.height;
		const openedClr = config.isOpenedColor;
		const midOpenedClr = config.isMidOpenedColor;
		const midClosedClr = config.isMidClosedColor;
		const closedClr = config.isClosedColor;
		const buttonOffClr = config.buttonInactiveColor;
		const openSetpoint = config.openPosition;
		const midOpenSetpoint = config.midOpenPosition;
		const midCloseSetpoint = config.midClosePosition;
		const closeSetpoint = config.closePosition;
		const custOpenTxt = config.customOpenText;
		const custMidOpenTxt = config.customMidOpenText;
		const custMidClosedTxt = config.customMidClosedText;
		const custClosedTxt = config.customClosedText;
						
				
		let openSP;
		let midOpenSP;
		let midCloseSP;
		let closeSP;
		let opened;
		let midOpened;
		let midClosed;
		let closed;
				
		if (custSetpoint) {
			midOpenSP = parseInt(midOpenSetpoint);
			midCloseSP = parseInt(midCloseSetpoint);
			if (parseInt(openSetpoint) < 1) {
				openSP = 1;
			} else {
				openSP =  parseInt(openSetpoint);
			}
			if (parseInt(closeSetpoint) > 100) {	
				closeSP = 100;
			} else {
				closeSP = parseInt(closeSetpoint);
			}
			if (stateObj && stateObj.attributes) {
				if (stateObj.state == 'open' && stateObj.attributes.current_position <= 100 && stateObj.attributes.current_position >= ((openSP + midOpenSP)/2 ) ) {
					opened = 'on';
				} else if (stateObj.state == 'open' && stateObj.attributes.current_position < ((openSP + midOpenSP)/2 ) && stateObj.attributes.current_position >= ((midCloseSP + midOpenSP)/2)) {
					midOpened = 'on';
				} else if (stateObj.state == 'open' && stateObj.attributes.current_position < ((midOpenSP + midCloseSP)/2) && stateObj.attributes.current_position >= ((midCloseSP + closeSP)/2)) {
					midClosed = 'on';
				} else {
					closed = 'on';
				}	
			}
			
		} else {
			openSP =  99;
			midOpenSP = 66;
			midCloseSP = 33;
			closeSP = 0;
			if (stateObj && stateObj.attributes) {
				if (stateObj.state == 'open' && stateObj.attributes.current_position <= 100 && stateObj.attributes.current_position >= 83) {
					opened = 'on';
				} else if (stateObj.state == 'open' && stateObj.attributes.current_position <= 82 && stateObj.attributes.current_position >= 50) {
					midOpened= 'on';
				} else if (stateObj.state == 'open' && stateObj.attributes.current_position <= 49 && stateObj.attributes.current_position >= 17) {
					midClosed = 'on';
				} else {
					closed = 'on';
				}
			}
		}
		
		let openedcolor;
		let midopenedcolor;
		let midclosedcolor;
		let closedcolor;

				
		if (custTheme) {
			if (opened == 'on') {
				openedcolor = 'background-color:' + openedClr;
			} else {
				openedcolor = 'background-color:' + buttonOffClr;
			}
			if (midOpened == 'on') {
				midopenedcolor = 'background-color:'  + midOpenedClr;
			} else {
				midopenedcolor = 'background-color:' + buttonOffClr;
			}
			if (midClosed == 'on') {
				midclosedcolor = 'background-color:'  + midClosedClr;
			} else {
				midclosedcolor = 'background-color:' + buttonOffClr;
			}
			if (closed == 'on') {
				closedcolor = 'background-color:'  + closedClr;
			} else {
				closedcolor = 'background-color:' + buttonOffClr;
			}
		} else {
			if (opened == 'on') {
				openedcolor = 'background-color: var(--switch-checked-color)';
			} else {
				openedcolor = 'background-color: var(--switch-unchecked-color)';
			}
			if (midOpened == 'on') {
				midopenedcolor = 'background-color: var(--switch-checked-color)';
			} else {
				midopenedcolor = 'background-color: var(--switch-unchecked-color)';
			}
			if (midClosed == 'on') {
				midclosedcolor = 'background-color: var(--switch-checked-color)';
			} else {
				midclosedcolor = 'background-color: var(--switch-unchecked-color)';
			}
			if (closed == 'on') {
				closedcolor = 'background-color: var(--switch-checked-color)';
			} else {
				closedcolor = 'background-color: var(--switch-unchecked-color)';
			}
		}

		let opentext;
		let midopentext;
		let midclosedtext;
		let closedtext;
		
		if (custTxt) {
			opentext = custOpenTxt;
			midopentext = custMidOpenTxt;
			midclosedtext = custMidClosedTxt;
			closedtext = custClosedTxt;
		} else if (custSetpoint) {
			//if custom setpoints but no custom text assigned
			opentext = openSetpoint.toString(10) + '%';
			midopentext = midOpenSetpoint.toString(10) + '%';
			midclosedtext = midCloseSetpoint.toString(10) + '%';
			closedtext = closeSetpoint.toString(10) + '%';
		} else {
			opentext = '99%';
			midopentext = '66%';
			midclosedtext = '33%';
			closedtext = '0%';
			
		}
		
		let buttonwidth = buttonWidth;
		let buttonheight = buttonHeight;
		
		let openName = 'open';
		let midOpenName = 'midopen';
		let midCloseName = 'midclose';
		let closeName = 'close';
		
		if (revButtons) {
				this._stateObj = stateObj;
				this._leftPosition = (opened === 'on' && allowDisable);
				this._midLeftPosition = (midOpened === 'on' && allowDisable);
				this._midRightPosition = (midClosed === 'on' && allowDisable);
				this._rightPosition = (closed === 'on' && allowDisable);
				this._width = buttonwidth;
				this._height = buttonheight;
				this._leftColor = openedcolor;
				this._midLeftColor = midopenedcolor;
				this._midRightColor = midclosedcolor;
				this._rightColor = closedcolor;
				this._openSP = openSP;
				this._midOpenSP = midOpenSP;
				this._midCloseSP = midCloseSP;
				this._closeSP = closeSP;
				this._leftText = opentext;
				this._midLeftText = midopentext;
				this._midRightText = midclosedtext;
				this._rightText = closedtext;
				this._leftName = openName;
				this._midLeftName = midOpenName;
				this._midRightName = midCloseName;
				this._rightName = closeName;
		} else {
				this._stateObj = stateObj;
				this._leftPosition = (closed === 'on' && allowDisable);
				this._midLeftPosition = (midClosed === 'on' && allowDisable);
				this._midRightPosition = (midOpened === 'on' && allowDisable);
				this._rightPosition = (opened === 'on' && allowDisable);
				this._width = buttonwidth;
				this._height = buttonheight;
				this._leftColor = closedcolor;
				this._midLeftColor=  midclosedcolor;
				this._midRightColor = midopenedcolor;
				this._rightColor = openedcolor;
				this._closeSP = closeSP;
				this._midCloseSP = midCloseSP;
				this._midOpenSP = midOpenSP;
				this._openSP = openSP;
				this._leftText = closedtext;
				this._midLeftText = midclosedtext;
				this._midRightText = midopentext;
				this._rightText = opentext;
				this._leftName = closeName;
				this._midLeftName = midCloseName;
				this._midRightName = midOpenName;
				this._rightName = openName;
		}
	}
	
	setPosition(e) {
		const position = e.currentTarget.getAttribute('name');
		const param = {entity_id: this._config.entity};
		if( position == 'open' ){
			param.position = this._openSP
			this.hass.callService('cover', 'set_cover_position', param);
		} else if (position == 'midopen') {
			param.position = this._midOpenSP
			this.hass.callService('cover', 'set_cover_position', param);
		} else if (position == 'midclose') {
			param.position = this._midCloseSP
			this.hass.callService('cover', 'set_cover_position', param);
		} else if (position == 'close') {
			param.position = this._closeSP
			this.hass.callService('cover', 'set_cover_position', param);
		}
	}
}
	
customElements.define('cover-position-preset-row', CustomCoverPositionRow);
