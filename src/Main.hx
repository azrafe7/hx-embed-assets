import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.media.Sound;
import flash.system.System;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.ByteArray;
import haxe.rtti.XmlParser;


/**
 * Example on how to embed and use assets via metatags.
 * 
 * @author azrafe7
 */
class Main
{
	public function new() {
		main();
	}
	
	public static function main()
	{
		var stage:Stage = Lib.current.stage;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		// font
		Font.registerFont(MyEmbeddedFont);
		var font = new MyEmbeddedFont();
		var textField:TextField = new TextField();
		var textFormat:TextFormat = new TextFormat();
		textFormat.color = 0xFFFFFF;
		textField.embedFonts = true;
		textField.textColor = 0xFFFFFF;
		textFormat.font = font.fontName;
		textFormat.size = 16;
		textField.defaultTextFormat = textFormat;
		textField.setTextFormat(textFormat);
		textField.text = "embedded font: " + font.fontName;
		textField.autoSize = TextFieldAutoSize.LEFT;
		stage.addChild(textField);
		trace(Font.enumerateFonts());
		trace(font.fontName);
		
		// bitmapdata
		var bitmapData:BitmapData = new MyEmbeddedBitmapData(0, 0);
		var bitmap:Bitmap = new Bitmap(bitmapData);
		bitmap.x = 20;
		bitmap.y = 30;
		stage.addChild(bitmap);
		
		// sound
		var sound:Sound = new MyEmbeddedSound();
		sound.play(0, 999);
		
		// file
		var file:ByteArray = new MyEmbeddedFile();
		var fileTextField:TextField = new TextField();
		fileTextField.autoSize = TextFieldAutoSize.LEFT;
		fileTextField.x = 100;
		fileTextField.y = 50;
		fileTextField.text = file.toString();
		stage.addChild(fileTextField);
		trace(file.toString());

		// xml file
		var xmlFile:ByteArray = new MyEmbeddedXML();
		var xml:Xml = Xml.parse(xmlFile.toString());
		var xmlTextField:TextField = new TextField();
		var xmlTextFormat:TextFormat = new TextFormat("_typewriter");
		xmlTextField.autoSize = TextFieldAutoSize.LEFT;
		xmlTextField.multiline = true;
		xmlTextField.defaultTextFormat = xmlTextFormat;
		xmlTextField.setTextFormat(xmlTextFormat);
		xmlTextField.y = 100;
		var metaNode:Xml;
		for (n in xml.firstElement().elementsNamed("meta")) metaNode = n;
		xmlTextField.text = "Info extracted from embedded xml file:\n";
		for (att in metaNode.attributes()) xmlTextField.text += "  " + att + " : " + metaNode.get(att) + "\n";
		stage.addChild(xmlTextField);
		trace(xml);
	}
	
	public static function onKeyDown(evt:KeyboardEvent):Void 
	{
		// ESC
		if (evt.keyCode == 27) {
		#if web
			System.exit(0);
		#else
			Sys.exit(0);
		#end
		}
	}
}

@:font("../assets/04B_03__.ttf") class MyEmbeddedFont extends Font { }

@:bitmap("../assets/ball.png") class MyEmbeddedBitmapData extends BitmapData { }

@:sound("../assets/guitar-loop.wav") class MyEmbeddedSound extends Sound { }

@:file("../assets/file.txt") class MyEmbeddedFile extends ByteArray { }

@:file("../application.xml") class MyEmbeddedXML extends ByteArray { }