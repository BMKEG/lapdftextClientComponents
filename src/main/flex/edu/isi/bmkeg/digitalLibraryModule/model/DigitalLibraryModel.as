package edu.isi.bmkeg.digitalLibraryModule.model
{
	
	import edu.isi.bmkeg.digitalLibrary.model.citations.*;
	import edu.isi.bmkeg.digitalLibrary.model.qo.citations.*;
	import edu.isi.bmkeg.ftd.model.FTD;
	import edu.isi.bmkeg.ftd.model.qo.FTD_qo;
	import edu.isi.bmkeg.vpdmf.model.instances.LightViewInstance;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	import mx.utils.UIDUtil;
	
	import org.robotlegs.mvcs.Actor;

	[Bindable]
	public class DigitalLibraryModel extends Actor
	{
		public var listPageSize:int = 200;
		
		public var corpora:ArrayCollection = new ArrayCollection();

		public var currentCorpus:Corpus;

		public var articles:ArrayCollection = new ArrayCollection();
				
		public var currentArticle:ArticleCitation;

		public var queryArticle:ArticleCitation_qo;

		public var documents:ArrayCollection = new ArrayCollection();

		public var currentDocument:FTD;

		public var nDoc:Number;
		
	}

}