package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	import edu.isi.bmkeg.ftd.rl.events.ListFTDPagedEvent;
	import edu.isi.bmkeg.ftd.rl.services.IFtdService;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class ListFTDPagedCommand extends Command
	{
	
		[Inject]
		public var event:ListFTDPagedEvent;

		[Inject]
		public var model:DigitalLibraryModel;
		
		[Inject]
		public var service:IFtdService;
				
		override public function execute():void
		{	
			service.listFTDPaged(event.object, event.offset, event.cnt);
		}
		
	}
	
}