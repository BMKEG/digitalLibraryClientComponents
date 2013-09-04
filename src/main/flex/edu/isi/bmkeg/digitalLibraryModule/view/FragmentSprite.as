package edu.isi.bmkeg.digitalLibraryModule.view
{
	import edu.isi.bmkeg.ftd.model.FTDFragmentBlock;
	
	import flash.display.Sprite;
	import flash.text.*;
	
	public class FragmentSprite extends Sprite
	{
		
		public var ftdAnn:FTDFragmentBlock;
		public var sf:Number;
		public var frgId:int;
		
		public var dismissControl:Sprite;
		
		public var idControl:Sprite;
		
		
		public function FragmentSprite(id:int, ftdAnn:FTDFragmentBlock, sf:Number, fill:uint=0xffff00)
		{
			super();
			this.ftdAnn = ftdAnn;
			this.sf = sf;
			this.frgId = id;
			
			this.graphics.lineStyle(1, 0xff0000, 0.2)
			this.graphics.moveTo(ftdAnn.x1 * sf,ftdAnn.y1 * sf);
			this.graphics.beginFill(fill, 0.2);
			//
			// this is what happens if the fragment is on the same line
			//
			if( ftdAnn.y2 == ftdAnn.y3 ) {
				this.graphics.lineTo(ftdAnn.x1*sf, ftdAnn.y3*sf);
				this.graphics.lineTo(ftdAnn.x3*sf, ftdAnn.y3*sf);
				this.graphics.lineTo(ftdAnn.x3*sf, ftdAnn.y1*sf);
				this.graphics.lineTo(ftdAnn.x1*sf, ftdAnn.y1*sf);
				this.dismissControl = this.generateDismissControl(ftdAnn.x3*sf, ftdAnn.y3*sf);
			} 
			// 
			// multi-line
			// 
			else {
				this.graphics.lineTo(ftdAnn.x1*sf, ftdAnn.y2*sf);
				this.graphics.lineTo(ftdAnn.x2*sf, ftdAnn.y2*sf);
				this.graphics.lineTo(ftdAnn.x2*sf, ftdAnn.y3*sf);
				this.graphics.lineTo(ftdAnn.x3*sf, ftdAnn.y3*sf);
				this.graphics.lineTo(ftdAnn.x3*sf, ftdAnn.y4*sf);
				this.graphics.lineTo(ftdAnn.x4*sf, ftdAnn.y4*sf);
				this.graphics.lineTo(ftdAnn.x4*sf, ftdAnn.y1*sf);
				this.graphics.lineTo(ftdAnn.x1*sf, ftdAnn.y1*sf);
				this.dismissControl = this.generateDismissControl(ftdAnn.x2 * this.sf, ftdAnn.y2 * this.sf);
			}
			this.graphics.endFill();
			
			this.idControl = this.generateIdControl(this.frgId);
			this.addChild(this.idControl);
			
		}
	
		public function generateDismissControl(x:Number, y:Number):Sprite {
						
			var dismissControl:Sprite = new Sprite();
			var r:Number = 4.0;
			
			dismissControl.graphics.lineStyle(1, 0x000000, 1.0)
			dismissControl.graphics.beginFill(0xff0000, 1.0);
			dismissControl.graphics.drawCircle(x,y,r+2);
			dismissControl.graphics.lineStyle(2, 0xffffff, 1.0)
			dismissControl.graphics.endFill();
			dismissControl.graphics.moveTo(x,y);
			dismissControl.graphics.lineTo(x - r * Math.cos(45), y + r * Math.cos(45) );
			dismissControl.graphics.moveTo(x,y);
			dismissControl.graphics.lineTo(x + r * Math.cos(45), y - r * Math.cos(45) );
			dismissControl.graphics.moveTo(x,y);
			dismissControl.graphics.lineTo(x + r * Math.cos(45), y + r * Math.cos(45) );
			dismissControl.graphics.moveTo(x,y);
			dismissControl.graphics.lineTo(x - r * Math.cos(45), y - r * Math.cos(45) );
			
			return dismissControl;
			
		}
		
		public function generateIdControl(id:int):Sprite {

			
			var idControl:Sprite = new Sprite();
			
			var t:TextField = new TextField();
			t.selectable = false;
			var tf:TextFormat = new TextFormat(); 
			tf.size = 10; 
			tf.font = "Courier"; 
			t.setTextFormat(tf);
			var s:String = String(id);
			t.text = s;
			t.textColor = 0xff0000;			
			t.height = t.textHeight + 4;
			t.width = t.textWidth + 4;
			
			var r:Number = (Math.max(t.textHeight, t.textWidth) / 2 ) + 2;
			var x:Number = (ftdAnn.x1 - r*Math.cos(45) ) * this.sf;
			var y:Number = (ftdAnn.y2 - r*Math.sin(45) ) * this.sf;
			
			idControl.graphics.lineStyle(1, 0xff0000)
			idControl.graphics.beginFill(0xffff00);
			idControl.graphics.drawCircle(x,y,r);
			idControl.graphics.endFill();
			
			idControl.addChild(t);
			t.x = x - (t.width/2.0);
			t.y = y - (t.height/2.0);
			
			return idControl;
			
		}
		
		
	}
	
}