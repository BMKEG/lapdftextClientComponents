package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import org.robotlegs.mvcs.Command;

	import edu.isi.bmkeg.pagedList.model.*;

	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	
	import flash.events.Event;
	
	public class CountArticleDocumentResultCommand extends Command
	{
	
		[Inject]
		public var event:CountArticleCitationResultEvent;

		[Inject]
		public var model:DigitalLibraryModel;
				
		override public function execute():void
		{
			model.nDoc = event.count;
		}
		
	}
	
}