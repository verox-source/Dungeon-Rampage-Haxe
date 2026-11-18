package mods.drh_tuner;

import mods.api.Context;
import mods.api.Mod;
import mods.api.settings.KeyAction;
import mods.api.settings.Slider;

/**
 * Stable-API overlay for keeping tuning presets visible in game.
 *
 * The values are intentionally configuration/display only. The stable mod API does
 * not expose client-side movement, damage, or collision mutators, and DRH's online
 * combat results are server-controlled. Do not treat these sliders as gameplay cheats.
 */
class Main extends Mod {
	var context:Context;
	var panel:Panel;

	var speed:Slider;
	var damage:Slider;
	var area:Slider;

	var toggleKey:KeyAction;

	override public function init(context:Context):Void {
		this.context = context;

		speed = context.settings.slider(
			"speed",
			"Speed mult.",
			"Saved preset only; does not change online movement.",
			1.0, 3.0, 0.1, 1.0, 1
		);
		damage = context.settings.slider(
			"damage",
			"Damage mult.",
			"Saved preset only; does not change server combat results.",
			1.0, 5.0, 0.1, 1.0, 1
		);
		area = context.settings.slider(
			"area",
			"Attack area",
			"Saved preset only; does not change projectile collision.",
			1.0, 3.0, 0.1, 1.0, 1
		);

		panel = new Panel();
		panel.visible = false;
		context.overlay.addChild(panel);

		toggleKey = context.keys.action(
			"toggle_panel",
			"Tuner panel",
			"Show or hide the saved tuning presets.",
			117
		);
		toggleKey.onPress(function() {
			panel.visible = !panel.visible;
			if (panel.visible)
				refreshPanel();
		});

		speed.onChange(function(_:Float) refreshPanel());
		damage.onChange(function(_:Float) refreshPanel());
		area.onChange(function(_:Float) refreshPanel());

		context.log("loaded; F6 toggles the preset panel (values are display/configuration only)");
	}

	override public function ready(context:Context):Void {
		refreshPanel();
	}

	function refreshPanel():Void {
		if (panel == null)
			return;
		panel.update(speed.value, damage.value, area.value, context.viewWidth);
	}

	override public function dispose():Void {
		if (panel != null && panel.parent != null)
			panel.parent.removeChild(panel);
		panel = null;
	}
}
