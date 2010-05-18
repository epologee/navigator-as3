package com.epologee.ui.mouse {	import flash.display.Sprite;	import flash.events.Event;	import flash.utils.getQualifiedClassName;		/**	 * @author Eric-Paul Lecluse | epologee.com (c) 2008	 * 	 * Use with linkage for sprites that should always block mouse interactivity.	 */	public class MouseAutoBlocker extends Sprite {		public var blocker:MouseBlocker;		public function MouseAutoBlocker() {			blocker = new MouseBlocker(this);			addEventListener(Event.ADDED_TO_STAGE, autoBlock);		}				private function autoBlock(event:Event):void {			blocker.block();		}		override public function toString():String {			// com.epologee.ui.mouse.MouseAutoBlocker			var s:String = "";			// s = "[ " + name + " ]:";			return s+getQualifiedClassName(this);		}	}}