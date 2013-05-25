package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListArticleDocumentResultCommand extends Command
	{
		
		[Inject]
		public var event:ListArticleDocumentResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
	
		override public function execute():void
		{
			
			if( event.list.length != 1 ) {
				trace("Error: list update returned more than one element");
				return;
			}
							
			model.documents = event.list;
			
		}
		
	}
	
}