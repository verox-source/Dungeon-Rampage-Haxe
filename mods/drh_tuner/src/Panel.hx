package mods.drh_tuner;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;

/** Small, non-interactive overlay showing the mod's saved tuning presets. */
class Panel extends Sprite {
	static inline final WIDTH:Float = 330;

	var text:TextField;
	var drawnHeight:Float = -1;

	public function new() {
		super();
		mouseEnabled = false;
		mouseChildren = false;

		text = new TextField();
		text.defaultTextFormat = new TextFormat("_sans", 13, 0xE8EDF5);
		text.selectable = false;
		text.multiline = true;
		text.wordWrap = true;
		text.width = WIDTH - 24;
		text.x = 12;
		text.y = 10;
		text.height = 180;
		addChild(text);
	}

	public function update(speed:Float, damage:Float, area:Float, viewWidth:Float):Void {
		text.text = "DRH TUNER\n"
			+ "SAVED PRESETS\n\n"
			+ "Movement speed     " + format(speed) + "x\n"
			+ "Damage             " + format(damage) + "x\n"
			+ "Attack area        " + format(area) + "x\n\n"
			+ "F6  Hide panel\n"
			+ "Change values in the game's MODS settings.\n\n"
			+ "DISPLAY ONLY: these presets do not modify\n"
			+ "server-controlled movement, damage or collision.";

		var height = text.textHeight + 22;
		if (height != drawnHeight) {
			drawnHeight = height;
			text.height = height;
			graphics.clear();
			graphics.beginFill(0x101722, 0.94);
			graphics.drawRoundRect(0, 0, WIDTH, height + 8, 10, 10);
			graphics.endFill();
			graphics.lineStyle(1, 0x53647A, 0.9);
			graphics.drawRoundRect(0, 0, WIDTH, height + 8, 10, 10);
		}

		x = Math.max(8, viewWidth - WIDTH - 12);
		y = 12;
	}

	static function format(value:Float):String {
		return Std.string(Math.round(value * 10) / 10);
	}
}
