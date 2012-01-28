/**
 * (c) 2010 - mozartpetter.com
 */
package app
{
	import app.navigation.NavItem;
	
	import com.asual.*;
	
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.*;
	
	/**
	 * ApplicationContent Class
	 *
	 * @author Mozart Petter (contato@mozartpetter.com)
	 */
	public class ApplicationContent extends Sprite
	{
		
		//----------------------------------------------
		//	Private Properties
		//----------------------------------------------
		
		/**
		 * @private
		 * Seção exibida atualmente.
		 */
		private var _currentContent:DisplayObject;
		
		/**
		 * @private
		 * Itens do menu.
		 */
		private var _menuItems:Array;
		
		/**

		
		/**
		 * @private
		 * XML contendo as seções existentes.
		 */
/**
 * @private
 * XML contendo as seções existentes.
 */
public  var _sections:XML=new XML();
public var infoXML:URLLoader = new URLLoader();		
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
		/**
		 * Cria uma nova instancia de <code>ApplicationContent</code>.
		 */
		public function ApplicationContent()
		{
			super();
			this.carrega_xml();
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE, this.handleSWFAddressChange);
			// Criando o menu de navegação.
			
		}
		
		public function carrega_xml()
		{
			trace("entrou na função");
		 
var meuURL:URLRequest = new URLRequest("http://localhost/www.radioglobo.com.br/wordpress/xml/");
this.infoXML.load( meuURL );
this.infoXML.addEventListener( Event.COMPLETE, this.leiaXML );
		}
		
 
private function leiaXML( evento:Event ):void {
    /*criamos o objeto XML contendo a informações
    do arquivo externo usando a propriedade URLLoader.data*/
    var meuXML:XML = new XML( this.infoXML.data );
 	//trace(meuXML);
	this._sections=meuXML;
    this.createMenu();
}

		
	//---------------------------------------------------------------------------------------------------
	//
	//  Private Methods
	//  
	//---------------------------------------------------------------------------------------------------
		
	/**
 * @private
 * Cria o menu de navegação.
 */
private function createMenu():void
{
    this._menuItems = [];
    var xIni:int = 20;
   
    for each (var section:XML in this._sections.children())
    {
        var navItem:NavItem = new NavItem();
        navItem.file = section.@file;
        navItem.label = section.@label;
        navItem.tag = section.@tag;
       
        navItem.x = xIni;
        navItem.y = 20;
        xIni += navItem.width + 10;
       
        this._menuItems.push(navItem);
        this.addChild(navItem);
    }
}





/**
 * @private
 * Handler do evento CHANGE, disparado quando o valor do SWFAddress é alterado.
 *
 * @param event SWFAddressEvent
 */
private function handleSWFAddressChange(event:SWFAddressEvent):void
{
	//if(event==null)return;
    var pathNames:Array = event.pathNames;
   
    if (event.pathNames.length == 0)
        pathNames = ['home'];
   
    var navItem:NavItem = this.getNavItemFromPath(pathNames[0]);
   
    if (!navItem)
        navItem = this.getNavItemFromPath('home');
       
    this.loadContent(navItem.file);
}

/**
 *  @private
 *  Obtém o NavItem de acordo com a tag passada.
 */
private function getNavItemFromPath(tag:String):NavItem
{
    for each (var item:NavItem in this._menuItems)
    {
        if (item.tag == tag)
            return item;
    }
   
    return null;
}
		
		/**
		 * @private
		 * Carrega um arquivo de seção.
		 * 
		 * @param filePath String Caminho para o arquivo da seção.
		 */
		private function loadContent(filePath:String):void
		{
			var request:URLRequest = new URLRequest(filePath);
			var loader:Loader = new Loader();
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.handleLoaderComplete);
			
			loader.load(request);
		}
		
		//----------------------------------------------
		//	Event Handlers
		//----------------------------------------------
		
		/**
		 * @private
		 * Handler do evento COMPLETE, disparado quando o arquivo foi carregado.
		 * 
		 * @param event Event 
		 */
		private function handleLoaderComplete(event:Event):void
		{
			var loaderInfo:LoaderInfo = event.target as LoaderInfo;
			var content:DisplayObject = loaderInfo.content as DisplayObject;
			
			if (this._currentContent)
				this.removeChild(this._currentContent);
			
			//this.addChildAt(content, 0);
			content.y=350;
			this.addChild(content);
			this._currentContent = content;
		}
		
		/**
		 * @private
		 * Handler do evento CLICK, disparado quando um botão é clicado.
		 * 
		 * @param event MouseEvent 
		 */
		private function handleNavItemClick(event:MouseEvent):void
		{
			var target:NavItem = event.target as NavItem;
			
			this.loadContent(target.file);
		}
	}
	
}