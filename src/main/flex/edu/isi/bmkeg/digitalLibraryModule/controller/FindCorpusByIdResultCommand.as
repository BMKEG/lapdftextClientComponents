package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.digitalLibrary.model.citations.Corpus;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;

	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class FindCorpusByIdResultCommand extends Command
	{
		
		[Inject]
		public var event:FindCorpusByIdResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		
		override public function execute():void
		{
			
			model.currentCorpus = event.object;
			
		}
		
	}
	
}