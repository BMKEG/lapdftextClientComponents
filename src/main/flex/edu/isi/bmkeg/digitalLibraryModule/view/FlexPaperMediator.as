package edu.isi.bmkeg.digitalLibraryModule.view
{
	
	import com.devaldi.controls.flexpaper.FlexPaperViewer;
	import com.devaldi.events.DocumentLoadedEvent;
	import com.devaldi.streaming.SwfDocument;
	
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.ftd.model.*;
	import edu.isi.bmkeg.ftd.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.events.*;
	import edu.isi.bmkeg.digitalLibrary.rl.services.*;
	import edu.isi.bmkeg.digitalLibraryModule.events.*;
	import edu.isi.bmkeg.digitalLibraryModule.model.*;
	import edu.isi.bmkeg.utils.dao.Utils;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.utils.ByteArray;
	import flash.events.ErrorEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class FlexPaperMediator extends Mediator
	{
		[Inject]
		public var view:FlexPaperViewer;
		
		[Inject]
		public var model:DigitalLibraryModel;
		
		override public function onRegister():void {
			
			addContextListener(RetrieveArticleDocumentEvent.RETRIEVE_ARTICLEDOCUMENT, 
				findArticleDocumentByIdResultHandler);

			addContextListener(ClearCorpusEvent.CLEAR_CORPUS, 
					clearCorpusHandler);
			
			addViewListener(DocumentLoadedEvent.DOCUMENT_LOADED, documentLoadedHandler);
			
			addViewListener(ErrorEvent.ERROR, errorHandler);
								
		}
		
//		private function findTriageScoreByIdResultHandler(event:FindTriageScoreByIdResultEvent):void {
//			
//			var url:String = Utils.getAppUrl();
//			
//			var cit:LiteratureCitation = event.object.citation as LiteratureCitation;
//					
//			url = url.substr(0, url.lastIndexOf("/clientApp")) + "/rest/load?swfFile=" + cit.vpdmfId + ".swf";
//			
//			try {
//
//				this.view.loadSwf(url);
//			
//			} catch(e:Error){
//			
//				trace("Error loading SWF file: " + e);
//			
//			}
//			
//		}

		private function findArticleDocumentByIdResultHandler(event:FindArticleDocumentByIdResultEvent):void {
			
			var url:String = "/" + Utils.getWebAppContext();
			
			var cit:LiteratureCitation = event.object.citation as LiteratureCitation;
			
			url = url + "/rest/load?swfFile=" + cit.vpdmfId + ".swf";
			
			try {
				
				this.view.loadSwf(url);
				
			} catch(e:Error){
				
				trace("Error loading SWF file: " + e);
				
			}
			
		}

		
		// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
		// Reset everything
		//
		public function clearCorpusHandler(event:ClearCorpusEvent):void {

			var url:String = Utils.getAppUrl();
			url = url.substr(0, url.lastIndexOf("/clientApp")) + "/rest/load?swfFile=blank.swf";

			try {
				
//				this.view.loadSwf(url);
				
			} catch(e:Error){
				
				trace("Error loading SWF file: " + e);
				
			}
			
		}
		
		public function documentLoadedHandler(event:DocumentLoadedEvent):void {
			
			var i:int = 0;
			 i = i+1;
			
			trace("Document Loaded");
				
		}

		public function errorHandler(event:DocumentLoadedEvent):void {
			
			trace("Error");
			
		}

				
	}
	
}