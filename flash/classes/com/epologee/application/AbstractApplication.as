package com.epologee.application {	import com.epologee.development.logging.warn;	import flash.display.MovieClip;	import flash.display.Stage;	import flash.events.ContextMenuEvent;	import flash.events.Event;	import flash.net.URLRequest;	import flash.net.navigateToURL;	import flash.ui.ContextMenu;	import flash.ui.ContextMenuItem;	import flash.utils.getQualifiedClassName;	/**	 * @author epologee.com � 2008	 */	public class AbstractApplication extends MovieClip implements IApplication {		public static var globalStage : Stage;		private var _isRoot:Boolean = false;		public function AbstractApplication() {			if (stage) {				warn("AbstractApplication: not using frame factory class");				_isRoot = true;				setGlobalStage(stage);			} else {				addEventListener(Event.ADDED_TO_STAGE, handleAddedToStage);			}			var cm : ContextMenu = new ContextMenu();			cm.hideBuiltInItems();						var madeBy : ContextMenuItem = new ContextMenuItem("made by epologee.com");			madeBy.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, handleMadeBy);			cm.customItems.push(madeBy);			contextMenu = cm;		}		private function handleMadeBy(event : ContextMenuEvent) : void {			navigateToURL(new URLRequest("http://epologee.com"), "_blank");		}		public function setGlobalStage(inStage : Stage) : void {			globalStage = inStage;						if (_isRoot) {				startApplication();			}		}		/**		 * Override this method.		 */ 		public function startApplication() : void {			//override this method			throw new Error("override startApplication");		}		protected function handleAddedToStage(event : Event) : void {			setGlobalStage(stage);		}				override public function toString():String {			var s:String = "";			// s = "[ " + name + " ]:";			return s+getQualifiedClassName(this);		}	}}