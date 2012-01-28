/**
 * (c) 2010 - mozartpetter.com
 */
package app.navigation
{
	import flash.display.Sprite;
	import flash.text.*;
	import flash.text.TextFieldAutoSize;
	import flash.events.*;
	import com.asual.*;
	/**
	 * NavItem Class
	 * Esta classe representa um botão de navegação.
	 *
	 * @author Mozart Petter (contato@mozartpetter.com)
	 */
	public class NavItem extends Sprite
	{
		
		//----------------------------------------------
		//	Public Properties
		//----------------------------------------------
		
		/**
		 * Fundo do botão.
		 */
		public var background:Sprite;
		
		/**
		 * TextField contendo o label do botão.
		 */
		public var labelText:TextField;
		
		//----------------------------------------------
		//	Private Properties
		//----------------------------------------------
		
		/**
		 * @private
		 * Caminho do arquivo da seção relacionada com o botão.
		 */
		private var _file:String;
		 /* @private
 * Tag da seção.
 */
private var _tag:String;
		//----------------------------------------------
		//	Constructor
		//----------------------------------------------
		
/**
 * Cria uma instancia de <code>NavItem</code>.
 */
public function NavItem()
{
    super();
   
    this.buttonMode = true;
    this.mouseChildren = false;
   
    // Adicionando evento CLICK.
    this.addEventListener(MouseEvent.CLICK, this.handleClick);
}

/**
 * @private
 * Handler do evento CLICK, disparado quando o botão é clicado.
 *
 * @param event MouseEvent
 */
private function handleClick(event:MouseEvent):void
{
    SWFAddress.setValue('/' + this.tag);
}
		
	//---------------------------------------------------------------------------------------------------
	//
	//  Getter/Setter Methods
	//  
	//---------------------------------------------------------------------------------------------------
		
		/**
		 * Caminho para o arquivo da seção.
		 */
		public function get file():String
		{
			return this._file;
		}
		
		public function set file(value:String):void
		{
			this._file = value;
		}
		
		/**
		 * Rótulo do botão.
		 */
		public function get label():String
		{
			return this.labelText.text;
		}
		
		public function set label(value:String):void
		{
			this.labelText.autoSize = TextFieldAutoSize.LEFT;
			
			this.labelText.text = value;
			
			this.updateDisplay();
		}
	/**
 * Tag da seção.
 */
public function get tag():String
{
    return this._tag;
}

public function set tag(value:String):void
{
    this._tag = value;
}	
	//---------------------------------------------------------------------------------------------------
	//
	//  Private Methods
	//  
	//---------------------------------------------------------------------------------------------------
		
		/**
		 * @private
		 * Atualiza os elementos do botão.
		 */
		private function updateDisplay():void
		{
			this.background.width = this.labelText.width + 30;
		}
		
	}
	
}