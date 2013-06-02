package edu.isi.bmkeg.digitalLibraryModule.controller
{	
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;

	import edu.isi.bmkeg.digitalLibraryModule.model.DigitalLibraryModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class FindFTDByIdResultCommand extends Command
	{
		
		[Inject]
		public var event:FindFTDByIdResultEvent;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		
		override public function execute():void
		{
			
			model.currentFtd = event.object;
			model.ruleSet = model.currentFtd.ruleSet;
			
		}
		
	}
	
}