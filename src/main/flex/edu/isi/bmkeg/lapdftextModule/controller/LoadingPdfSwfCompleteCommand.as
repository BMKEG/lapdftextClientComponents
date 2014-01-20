package edu.isi.bmkeg.lapdftextModule.controller
{	
	import edu.isi.bmkeg.digitalLibrary.events.*;
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.ListArticleCitationPagedEvent;
	import edu.isi.bmkeg.digitalLibrary.services.*;
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadingPdfSwfCompleteCommand extends Command
	{
		
		[Inject]
		public var event:LoadingPdfSwfCompleteEvent;
		
		[Inject]
		public var model:LapdftextModel;
		
		override public function execute():void
		{
			model.swf = event.swf;
		}
		
	}
	
}