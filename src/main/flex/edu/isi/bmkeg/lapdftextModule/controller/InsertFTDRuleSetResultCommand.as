package edu.isi.bmkeg.lapdftextModule.controller
{
	
	import edu.isi.bmkeg.ftd.model.qo.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.lapdftextModule.model.LapdftextModel;
	
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	
	public class InsertFTDRuleSetResultCommand extends Command
	{
		[Inject]
		public var event:InsertFTDRuleSetResultEvent;
		
		[Inject]
		public var model:LapdftextModel;

		override public function execute():void
		{	
			this.dispatch(new ListFTDRuleSetEvent(new FTDRuleSet_qo()));				
		}

	}

}