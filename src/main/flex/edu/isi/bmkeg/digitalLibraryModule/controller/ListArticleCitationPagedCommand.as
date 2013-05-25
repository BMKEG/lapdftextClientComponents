package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.ArticleCitation_qo;
	import edu.isi.bmkeg.digitalLibrary.rl.events.ListArticleCitationPagedEvent;
	import edu.isi.bmkeg.digitalLibrary.rl.services.IDigitalLibraryService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListArticleCitationPagedCommand extends Command
	{
	
		[Inject]
		public var event:ListArticleCitationPagedEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		[Inject]
		public var service:IDigitalLibraryService;
				
		override public function execute():void
		{	
			service.listArticleCitationPaged(event.object, event.offset, event.cnt);
		}
		
	}
	
}