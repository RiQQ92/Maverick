package
{
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.utils.Dictionary;
	
	import utility.Time;
	
	public class Assets
	{
		// Ohjeet
		//********************
		[Embed(source = "../Grafiikka/Muistipeli/MuistipeliOhje.png")]
		public static const OhjeMuistipeli:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/LabyrinttiOhje.png")]
		public static const OhjeLabyrintti:Class;
		
		[Embed(source = "../Grafiikka/Yhdistely/YhdistelyOhje.png")]
		public static const OhjeYhdistely:Class;
		
		[Embed(source = "../Grafiikka/Pilkkipeli/PilkkiOhje.png")]
		public static const OhjePilkki:Class;
		//*********************
		
		//Palapeli
		//*********************
		
		/*
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala1.png")]
		public static const kuva1pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala2.png")]
		public static const kuva1pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala3.png")]
		public static const kuva1pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala4.png")]
		public static const kuva1pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala5.png")]
		public static const kuva1pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala6.png")]
		public static const kuva1pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala7.png")]
		public static const kuva1pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala8.png")]
		public static const kuva1pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala9.png")]
		public static const kuva1pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala10.png")]
		public static const kuva1pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala11.png")]
		public static const kuva1pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala12.png")]
		public static const kuva1pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala13.png")]
		public static const kuva1pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala14.png")]
		public static const kuva1pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala15.png")]
		public static const kuva1pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala16.png")]
		public static const kuva1pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala17.png")]
		public static const kuva1pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala18.png")]
		public static const kuva1pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala19.png")]
		public static const kuva1pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala20.png")]
		public static const kuva1pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala21.png")]
		public static const kuva1pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala22.png")]
		public static const kuva1pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala23.png")]
		public static const kuva1pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala24.png")]
		public static const kuva1pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala25.png")]
		public static const kuva1pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala26.png")]
		public static const kuva1pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala27.png")]
		public static const kuva1pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala28.png")]
		public static const kuva1pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala29.png")]
		public static const kuva1pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala30.png")]
		public static const kuva1pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala31.png")]
		public static const kuva1pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala32.png")]
		public static const kuva1pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala33.png")]
		public static const kuva1pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala34.png")]
		public static const kuva1pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala35.png")]
		public static const kuva1pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala36.png")]
		public static const kuva1pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala37.png")]
		public static const kuva1pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala38.png")]
		public static const kuva1pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala39.png")]
		public static const kuva1pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala40.png")]
		public static const kuva1pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala41.png")]
		public static const kuva1pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala42.png")]
		public static const kuva1pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala43.png")]
		public static const kuva1pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala44.png")]
		public static const kuva1pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala45.png")]
		public static const kuva1pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala46.png")]
		public static const kuva1pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala47.png")]
		public static const kuva1pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 1 palat/pala48.png")]
		public static const kuva1pala48:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala1.png")]
		public static const kuva2pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala2.png")]
		public static const kuva2pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala3.png")]
		public static const kuva2pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala4.png")]
		public static const kuva2pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala5.png")]
		public static const kuva2pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala6.png")]
		public static const kuva2pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala7.png")]
		public static const kuva2pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala8.png")]
		public static const kuva2pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala9.png")]
		public static const kuva2pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala10.png")]
		public static const kuva2pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala11.png")]
		public static const kuva2pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala12.png")]
		public static const kuva2pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala13.png")]
		public static const kuva2pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala14.png")]
		public static const kuva2pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala15.png")]
		public static const kuva2pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala16.png")]
		public static const kuva2pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala17.png")]
		public static const kuva2pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala18.png")]
		public static const kuva2pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala19.png")]
		public static const kuva2pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala20.png")]
		public static const kuva2pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala21.png")]
		public static const kuva2pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala22.png")]
		public static const kuva2pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala23.png")]
		public static const kuva2pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala24.png")]
		public static const kuva2pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala25.png")]
		public static const kuva2pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala26.png")]
		public static const kuva2pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala27.png")]
		public static const kuva2pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala28.png")]
		public static const kuva2pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala29.png")]
		public static const kuva2pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala30.png")]
		public static const kuva2pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala31.png")]
		public static const kuva2pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala32.png")]
		public static const kuva2pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala33.png")]
		public static const kuva2pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala34.png")]
		public static const kuva2pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala35.png")]
		public static const kuva2pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala36.png")]
		public static const kuva2pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala37.png")]
		public static const kuva2pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala38.png")]
		public static const kuva2pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala39.png")]
		public static const kuva2pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala40.png")]
		public static const kuva2pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala41.png")]
		public static const kuva2pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala42.png")]
		public static const kuva2pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala43.png")]
		public static const kuva2pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala44.png")]
		public static const kuva2pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala45.png")]
		public static const kuva2pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala46.png")]
		public static const kuva2pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala47.png")]
		public static const kuva2pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 2 palat/pala48.png")]
		public static const kuva2pala48:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala1.png")]
		public static const kuva3pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala2.png")]
		public static const kuva3pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala3.png")]
		public static const kuva3pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala4.png")]
		public static const kuva3pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala5.png")]
		public static const kuva3pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala6.png")]
		public static const kuva3pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala7.png")]
		public static const kuva3pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala8.png")]
		public static const kuva3pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala9.png")]
		public static const kuva3pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala10.png")]
		public static const kuva3pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala11.png")]
		public static const kuva3pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala12.png")]
		public static const kuva3pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala13.png")]
		public static const kuva3pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala14.png")]
		public static const kuva3pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala15.png")]
		public static const kuva3pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala16.png")]
		public static const kuva3pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala17.png")]
		public static const kuva3pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala18.png")]
		public static const kuva3pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala19.png")]
		public static const kuva3pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala20.png")]
		public static const kuva3pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala21.png")]
		public static const kuva3pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala22.png")]
		public static const kuva3pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala23.png")]
		public static const kuva3pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala24.png")]
		public static const kuva3pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala25.png")]
		public static const kuva3pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala26.png")]
		public static const kuva3pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala27.png")]
		public static const kuva3pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala28.png")]
		public static const kuva3pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala29.png")]
		public static const kuva3pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala30.png")]
		public static const kuva3pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala31.png")]
		public static const kuva3pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala32.png")]
		public static const kuva3pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala33.png")]
		public static const kuva3pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala34.png")]
		public static const kuva3pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala35.png")]
		public static const kuva3pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala36.png")]
		public static const kuva3pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala37.png")]
		public static const kuva3pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala38.png")]
		public static const kuva3pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala39.png")]
		public static const kuva3pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala40.png")]
		public static const kuva3pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala41.png")]
		public static const kuva3pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala42.png")]
		public static const kuva3pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala43.png")]
		public static const kuva3pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala44.png")]
		public static const kuva3pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala45.png")]
		public static const kuva3pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala46.png")]
		public static const kuva3pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala47.png")]
		public static const kuva3pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 3 palat/pala48.png")]
		public static const kuva3pala48:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala1.png")]
		public static const kuva4pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala2.png")]
		public static const kuva4pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala3.png")]
		public static const kuva4pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala4.png")]
		public static const kuva4pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala5.png")]
		public static const kuva4pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala6.png")]
		public static const kuva4pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala7.png")]
		public static const kuva4pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala8.png")]
		public static const kuva4pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala9.png")]
		public static const kuva4pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala10.png")]
		public static const kuva4pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala11.png")]
		public static const kuva4pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala12.png")]
		public static const kuva4pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala13.png")]
		public static const kuva4pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala14.png")]
		public static const kuva4pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala15.png")]
		public static const kuva4pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala16.png")]
		public static const kuva4pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala17.png")]
		public static const kuva4pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala18.png")]
		public static const kuva4pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala19.png")]
		public static const kuva4pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala20.png")]
		public static const kuva4pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala21.png")]
		public static const kuva4pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala22.png")]
		public static const kuva4pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala23.png")]
		public static const kuva4pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala24.png")]
		public static const kuva4pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala25.png")]
		public static const kuva4pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala26.png")]
		public static const kuva4pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala27.png")]
		public static const kuva4pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala28.png")]
		public static const kuva4pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala29.png")]
		public static const kuva4pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala30.png")]
		public static const kuva4pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala31.png")]
		public static const kuva4pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala32.png")]
		public static const kuva4pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala33.png")]
		public static const kuva4pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala34.png")]
		public static const kuva4pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala35.png")]
		public static const kuva4pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala36.png")]
		public static const kuva4pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala37.png")]
		public static const kuva4pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala38.png")]
		public static const kuva4pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala39.png")]
		public static const kuva4pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala40.png")]
		public static const kuva4pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala41.png")]
		public static const kuva4pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala42.png")]
		public static const kuva4pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala43.png")]
		public static const kuva4pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala44.png")]
		public static const kuva4pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala45.png")]
		public static const kuva4pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala46.png")]
		public static const kuva4pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala47.png")]
		public static const kuva4pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 4 palat/pala48.png")]
		public static const kuva4pala48:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala1.png")]
		public static const kuva5pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala2.png")]
		public static const kuva5pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala3.png")]
		public static const kuva5pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala4.png")]
		public static const kuva5pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala5.png")]
		public static const kuva5pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala6.png")]
		public static const kuva5pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala7.png")]
		public static const kuva5pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala8.png")]
		public static const kuva5pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala9.png")]
		public static const kuva5pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala10.png")]
		public static const kuva5pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala11.png")]
		public static const kuva5pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala12.png")]
		public static const kuva5pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala13.png")]
		public static const kuva5pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala14.png")]
		public static const kuva5pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala15.png")]
		public static const kuva5pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala16.png")]
		public static const kuva5pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala17.png")]
		public static const kuva5pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala18.png")]
		public static const kuva5pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala19.png")]
		public static const kuva5pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala20.png")]
		public static const kuva5pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala21.png")]
		public static const kuva5pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala22.png")]
		public static const kuva5pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala23.png")]
		public static const kuva5pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala24.png")]
		public static const kuva5pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala25.png")]
		public static const kuva5pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala26.png")]
		public static const kuva5pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala27.png")]
		public static const kuva5pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala28.png")]
		public static const kuva5pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala29.png")]
		public static const kuva5pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala30.png")]
		public static const kuva5pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala31.png")]
		public static const kuva5pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala32.png")]
		public static const kuva5pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala33.png")]
		public static const kuva5pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala34.png")]
		public static const kuva5pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala35.png")]
		public static const kuva5pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala36.png")]
		public static const kuva5pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala37.png")]
		public static const kuva5pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala38.png")]
		public static const kuva5pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala39.png")]
		public static const kuva5pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala40.png")]
		public static const kuva5pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala41.png")]
		public static const kuva5pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala42.png")]
		public static const kuva5pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala43.png")]
		public static const kuva5pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala44.png")]
		public static const kuva5pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala45.png")]
		public static const kuva5pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala46.png")]
		public static const kuva5pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala47.png")]
		public static const kuva5pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 5 palat/pala48.png")]
		public static const kuva5pala48:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala1.png")]
		public static const kuva6pala1:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala2.png")]
		public static const kuva6pala2:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala3.png")]
		public static const kuva6pala3:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala4.png")]
		public static const kuva6pala4:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala5.png")]
		public static const kuva6pala5:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala6.png")]
		public static const kuva6pala6:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala7.png")]
		public static const kuva6pala7:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala8.png")]
		public static const kuva6pala8:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala9.png")]
		public static const kuva6pala9:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala10.png")]
		public static const kuva6pala10:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala11.png")]
		public static const kuva6pala11:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala12.png")]
		public static const kuva6pala12:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala13.png")]
		public static const kuva6pala13:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala14.png")]
		public static const kuva6pala14:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala15.png")]
		public static const kuva6pala15:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala16.png")]
		public static const kuva6pala16:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala17.png")]
		public static const kuva6pala17:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala18.png")]
		public static const kuva6pala18:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala19.png")]
		public static const kuva6pala19:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala20.png")]
		public static const kuva6pala20:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala21.png")]
		public static const kuva6pala21:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala22.png")]
		public static const kuva6pala22:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala23.png")]
		public static const kuva6pala23:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala24.png")]
		public static const kuva6pala24:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala25.png")]
		public static const kuva6pala25:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala26.png")]
		public static const kuva6pala26:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala27.png")]
		public static const kuva6pala27:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala28.png")]
		public static const kuva6pala28:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala29.png")]
		public static const kuva6pala29:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala30.png")]
		public static const kuva6pala30:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala31.png")]
		public static const kuva6pala31:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala32.png")]
		public static const kuva6pala32:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala33.png")]
		public static const kuva6pala33:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala34.png")]
		public static const kuva6pala34:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala35.png")]
		public static const kuva6pala35:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala36.png")]
		public static const kuva6pala36:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala37.png")]
		public static const kuva6pala37:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala38.png")]
		public static const kuva6pala38:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala39.png")]
		public static const kuva6pala39:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala40.png")]
		public static const kuva6pala40:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala41.png")]
		public static const kuva6pala41:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala42.png")]
		public static const kuva6pala42:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala43.png")]
		public static const kuva6pala43:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala44.png")]
		public static const kuva6pala44:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala45.png")]
		public static const kuva6pala45:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala46.png")]
		public static const kuva6pala46:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala47.png")]
		public static const kuva6pala47:Class;
		
		[Embed(source = "../Grafiikka/palapeli/kuva 6 palat/pala48.png")]
		public static const kuva6pala48:Class;
		*/
		
		//*********************
		
		// Pilkkipeli
		//********************
		[Embed(source = "../Grafiikka/pilkkipeli/pilkkipeli.png")]
		public static const BGpilkkipeli:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/Siima.png")]
		public static const Siima:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/koukku2.png")]
		public static const Koukku:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/nuoli.png")]
		public static const PilkkiNuoli:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/koukkuHitBox.png")]
		public static const HitBox:Class;
		
		[Embed(source = "../Grafiikka/pilkkipeli/kalatTip/KTipAhven.png")]
		public static const TAhven:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalatTip/KTipHauki.png")]
		public static const THauki:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalatTip/KTipKuha.png")]
		public static const TKuha:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalatTip/KTipLahna.png")]
		public static const TLahna:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalatTip/KTipLohi.png")]
		public static const TLohi:Class;
		
		[Embed(source = "../Grafiikka/pilkkipeli/kalat/lohi.png")]
		public static const Lohi:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalat/ahven.png")]
		public static const Ahven:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalat/hauki.png")]
		public static const Hauki:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalat/lahna.png")]
		public static const Lahna:Class;
		[Embed(source = "../Grafiikka/pilkkipeli/kalat/kuha.png")]
		public static const Kuha:Class;
		//*********************
		
		// Muistipeli
		//*********************
		[Embed(source = "../Grafiikka/Muistipeli/Muistipeli_UI.png")]
		public static const UiMuistipeli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Bg_Kanto.png")]
		public static const BgKanto:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Back.png")]
		public static const LehtiBack:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Back_Crop.png")]
		public static const LehtiBackCrop:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Lehti_Front.png")]
		public static const LehtiFront:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Kanttarelli.png")]
		public static const LehtiKanttarelli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Karvarousku.png")]
		public static const LehtiKarvarousku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Punakärpässieni.png")]
		public static const LehtiPunakarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Suppilovahvero.png")]
		public static const LehtiSuppilovahvero:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Tatti.png")]
		public static const LehtiTatti:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Valkokärpässieni.png")]
		public static const LehtiValkokarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Kanttarelli.png")]
		public static const LehtiTekstiKanttarelli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Karvarousku.png")]
		public static const LehtiTekstiKarvarousku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Kärpässieni.png")]
		public static const LehtiTekstiPunakarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Suppilovahvero.png")]
		public static const LehtiTekstiSuppilovahvero:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Tatti.png")]
		public static const LehtiTekstiTatti:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Sienet/Lehti_Teksti_Valkokärpässieni.png")]
		public static const LehtiTekstiValkokarpassieni:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Mansikka.png")]
		public static const LehtiMansikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Mansikka.png")]
		public static const LehtiTekstiMansikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Vadelma.png")]
		public static const LehtiVadelma:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Vadelma.png")]
		public static const LehtiTekstiVadelma:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Mustikka.png")]
		public static const LehtiMustikka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Marjat/Lehti_Teksti_Mustikka.png")]
		public static const LehtiTekstiMustikka:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Ampiainen.png")]
		public static const LehtiAmpiainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Heinäsirkka.png")]
		public static const LehtiHeinasirkka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Kimalainen.png")]
		public static const LehtiKimalainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Kärpänen.png")]
		public static const LehtiKarpanen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Leppäkerttu.png")]
		public static const LehtiLeppakerttu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Mehiläinen.png")]
		public static const LehtiMehilainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Nokkosperhonen.png")]
		public static const LehtiNokkosperhonen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Sitruunaperhonen.png")]
		public static const LehtiSitruunaperhonen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Sudenkorento.png")]
		public static const LehtiSudenkorento:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Muurahainen.png")]
		public static const LehtiMuurahainen:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Ampiainen.png")]
		public static const LehtiTekstiAmpiainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Heinäsirkka.png")]
		public static const LehtiTekstiHeinasirkka:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Kimalainen.png")]
		public static const LehtiTekstiKimalainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Kärpänen.png")]
		public static const LehtiTekstiKarpanen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Leppäkerttu.png")]
		public static const LehtiTekstiLeppakerttu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Mehiläinen.png")]
		public static const LehtiTekstiMehilainen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Nokkosperhonen.png")]
		public static const LehtiTekstiNokkosperhonen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Sitruunaperhonen.png")]
		public static const LehtiTekstiSitruunaperhonen:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Sudenkorento.png")]
		public static const LehtiTekstiSudenkorento:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Ötökät/Lehti_Teksti_Muurahainen.png")]
		public static const LehtiTekstiMuurahainen:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Chili.png")]
		public static const LehtiChili:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Herne.png")]
		public static const LehtiHerne:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Kaali.png")]
		public static const LehtiKaali:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Kukkakaali.png")]
		public static const LehtiKukkakaali:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Kurkku.png")]
		public static const LehtiKurkku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Lanttu.png")]
		public static const LehtiLanttu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Luumu.png")]
		public static const LehtiLuumu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Persilja.png")]
		public static const LehtiPersilja:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Peruna.png")]
		public static const LehtiPeruna:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Porkkana.png")]
		public static const LehtiPorkkana:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Punajuuri.png")]
		public static const LehtiPunajuuri:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Tilli.png")]
		public static const LehtiTilli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Tomaatti.png")]
		public static const LehtiTomaatti:Class;
		
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Chili.png")]
		public static const LehtiTekstiChili:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Herne.png")]
		public static const LehtiTekstiHerne:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Kaali.png")]
		public static const LehtiTekstiKaali:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Kukkakaali.png")]
		public static const LehtiTekstiKukkakaali:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Kurkku.png")]
		public static const LehtiTekstiKurkku:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Lanttu.png")]
		public static const LehtiTekstiLanttu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Luumu.png")]
		public static const LehtiTekstiLuumu:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Persilja.png")]
		public static const LehtiTekstiPersilja:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Peruna.png")]
		public static const LehtiTekstiPeruna:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Porkkana.png")]
		public static const LehtiTekstiPorkkana:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Punajuuri.png")]
		public static const LehtiTekstiPunajuuri:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Tilli.png")]
		public static const LehtiTekstiTilli:Class;
		[Embed(source = "../Grafiikka/Muistipeli/Vihannekset/Lehti_Teksti_Tomaatti.png")]
		public static const LehtiTekstiTomaatti:Class;
		//*********************
		
		// Alkumenu
		//********************
		[Embed(source = "../Grafiikka/alkuvalikko/napit/labyrintti_nappi.png")]
		public static const Labyrintti_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/labyrintti_kuva.png")]
		public static const Labyrintti_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/metsastys_nappi.png")]
		public static const Metsastys_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/metsastys_kuva.png")]
		public static const Metsastys_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/muistipeli_nappi.png")]
		public static const Muistipeli_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/muistipeli_kuva.png")]
		public static const Muistipeli_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/yhdistely_nappi.png")]
		public static const Yhdistely_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/yhdistely_kuva.png")]
		public static const Yhdistely_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/pilkkiminen_nappi.png")]
		public static const Pilkki_nappi:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/pilkkiminen_kuva.png")]
		public static const Pilkki_kuva:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/napit/ketju.png")]
		public static const Ketju:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/tausta_kuva.png")]
		public static const Tausta:Class;
		
		[Embed(source = "../Grafiikka/alkuvalikko/nuoli_vasemmalle.png")]
		public static const ArrowLeft:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/nuoli_oikealle.png")]
		public static const ArrowRight:Class;
		//********************
		
		// Labyrintti
		//********************
		//[Embed(source = "../Grafiikka/Labyrintti/lab_wall.png")]
		//public static const Labyrintti_seina:Class;
		
		
		[Embed(source = "../Grafiikka/Labyrintti/road/wall.png")]
		public static const Labyrintti_seina:Class;
		
		// tie
		[Embed(source = "../Grafiikka/Labyrintti/road/EndN.png")]
		public static const Labyrintti_tieN:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/EndE.png")]
		public static const Labyrintti_tieE:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/EndS.png")]
		public static const Labyrintti_tieS:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/EndW.png")]
		public static const Labyrintti_tieW:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/road/NE.png")]
		public static const Labyrintti_tieNE:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NES.png")]
		public static const Labyrintti_tieNES:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NESW.png")]
		public static const Labyrintti_tieNESW:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NEW.png")]
		public static const Labyrintti_tieNEW:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NS.png")]
		public static const Labyrintti_tieNS:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NSW.png")]
		public static const Labyrintti_tieNSW:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/NW.png")]
		public static const Labyrintti_tieNW:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/road/ES.png")]
		public static const Labyrintti_tieES:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/ESW.png")]
		public static const Labyrintti_tieESW:Class;
		[Embed(source = "../Grafiikka/Labyrintti/road/EW.png")]
		public static const Labyrintti_tieEW:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/road/SW.png")]
		public static const Labyrintti_tieSW:Class;
		// tie päättyy
		
		[Embed(source = "../Grafiikka/Labyrintti/lab_road.png")]
		public static const Labyrintti_tie:Class;
		[Embed(source = "../Grafiikka/Labyrintti/lab_finish.png")]
		public static const Labyrintti_maali:Class;
		[Embed(source = "../Grafiikka/Labyrintti/lab_player.png")]
		public static const Labyrintti_pelaaja:Class;
		
		[Embed(source = "../Grafiikka/Labyrintti/Hirvi_kasvokuva.png")]
		public static const Labyrintti_hirvi:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Janis_kasvokuva.png")]
		public static const Labyrintti_janis:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Kettu_kasvokuva.png")]
		public static const Labyrintti_kettu:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Karhu_kasvokuva.png")]
		public static const Labyrintti_karhu:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Ilves_kasvokuva.png")]
		public static const Labyrintti_ilves:Class;
		[Embed(source = "../Grafiikka/Labyrintti/Orava_kasvokuva.png")]
		public static const Labyrintti_orava:Class;
		//********************
		
		// Metsa
		//********************
		[Embed(source = "../Grafiikka/Metsa/metsa_bg.png")]
		public static const Metsa_bg:Class;
		//********************
		
		// Yhdistely
		//********************
		[Embed(source = "../Grafiikka/Yhdistely/yhdistely_tausta.png")]
		public static const Yhdistely_bg:Class;
		[Embed(source = "../Grafiikka/Yhdistely/Yhdistely_kortti_pohja.png")]
		public static const YhdistelyBtn_bg:Class;
		[Embed(source = "../Grafiikka/alkuvalikko/napit/ketju.png")]
		public static const Yhdistely_Null_kuva:Class;
		
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kana.png")]
		public static const Yhdistely_Kana_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_karhu.png")]
		public static const Yhdistely_Karhu_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kettu.png")]
		public static const Yhdistely_Kettu_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_koira.png")]
		public static const Yhdistely_Koira_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kissa.png")]
		public static const Yhdistely_Kissa_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_lepakko.png")]
		public static const Yhdistely_Lepakko_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_lammas.png")]
		public static const Yhdistely_Lammas_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_lehma.png")]
		public static const Yhdistely_Lehmae_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_hevonen.png")]
		public static const Yhdistely_Hevonen_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_vuohi.png")]
		public static const Yhdistely_Vuohi_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_sammakko.png")]
		public static const Yhdistely_Sammakko_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_sika.png")]
		public static const Yhdistely_Sika_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kilpikonna.png")]
		public static const Yhdistely_Kilpikonna_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_undulaatti.png")]
		public static const Yhdistely_Undulaatti_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_rapu.png")]
		public static const Yhdistely_Rapu_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kimalainen.png")]
		public static const Yhdistely_Kimalainen_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_joutsen.png")]
		public static const Yhdistely_Joutsen_kuva:Class;

		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_etana.png")]
		public static const Yhdistely_Etana_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_haarapaasky.png")]
		public static const Yhdistely_Haarapaeaesky_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_harakka.png")]
		public static const Yhdistely_Harakka_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_kultahamsteri.png")]
		public static const Yhdistely_Hamsteri_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_metsajanis.png")]
		public static const Yhdistely_Metsaejaenis_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_perhonen.png")]
		public static const Yhdistely_Perhonen_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_peippo.png")]
		public static const Yhdistely_Peippo_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_sinisorsa.png")]
		public static const Yhdistely_Sorsa_kuva:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kortit/kortti_sisilisko.png")]
		public static const Yhdistely_Sisilisko_kuva:Class;
		
		//********************
		
		// Muu
		//********************
		[Embed(source = "../Grafiikka/Muu/VCAM_zone.png")]
		public static const VCAM_zone:Class;
		[Embed(source = "../Grafiikka/Ohjeet/OhjePohja.png")]
		public static const OhjePohja:Class;
		[Embed(source = "../Grafiikka/Yhdistely/kaiutin_nappi.png")]
		public static const Aani_nappi:Class;
		[Embed(source="../Grafiikka/Muu/ButtonBlocker.png")]
		public static const Button_Blocker:Class;
		[Embed(source="../Grafiikka/alkuvalikko/napit/lopeta_nappi.png")]
		public static const TakaisinNappi:Class;
		[Embed(source="../Grafiikka/Muu/TimerBar.png")]
		public static const TimerBar:Class;
		[Embed(source="../Grafiikka/alkuvalikko/napit/tekijat.png")]
		public static const TekijatBtn:Class;
		[Embed(source="../Grafiikka/alkuvalikko/creditKuva.png")]
		public static const CreditsBG:Class;
		//********************
		
		// Aanet
		//********************
		[Embed(source = "../aanet/lammas.mp3")]
		public static const Aani_lammas:Class;
		
		[Embed(source = "../aanet/menu.mp3")]
		public static const Aani_menu:Class;
		
		[Embed(source = "../aanet/saneltu/karhu.mp3")]
		public static const KarhuAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/lehmä.mp3")]
		public static const LehmaeAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/koira.mp3")]
		public static const KoiraAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kissa.mp3")]
		public static const KissaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/hevonen.mp3")]
		public static const HevonenAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/sika.mp3")]
		public static const SikaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kana.mp3")]
		public static const KanaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/lammas.mp3")]
		public static const LammasAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/vuohi.mp3")]
		public static const VuohiAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/sammakko.mp3")]
		public static const SammakkoAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/undulaatti.mp3")]
		public static const UndulaattiAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kimalainen.mp3")]
		public static const KimalainenAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/joutsen.mp3")]
		public static const JoutsenAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/haarapaasky.mp3")]
		public static const HaarapaeaeskyAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/harakka.mp3")]
		public static const HarakkaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/jänis.mp3")]
		public static const MetsaejaenisAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/peippo.mp3")]
		public static const PeippoAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/sorsa.mp3")]
		public static const SorsaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/ankka.mp3")]
		public static const AnkkaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kukko.mp3")]
		public static const KukkoAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/susi.mp3")]
		public static const SusiAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/käärme.mp3")]
		public static const KaeaermeAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/pöllö.mp3")]
		public static const PoelloeAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/sisilisko.mp3")]
		public static const SisiliskoAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/perhonen.mp3")]
		public static const PerhonenAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/hamsteri.mp3")]
		public static const HamsteriAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/etana.mp3")]
		public static const EtanaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/rapu.mp3")]
		public static const RapuAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kilpikonna.mp3")]
		public static const KilpikonnaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/orava.mp3")]
		public static const OravaAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/kettu.mp3")]
		public static const KettuAaniSaneltu:Class;
		
		
		[Embed(source = "../aanet/saneltu/kiuru.mp3")]
		public static const KiuruAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/naurulokki.mp3")]
		public static const NaurulokkiAaniSaneltu:Class;
		
		[Embed(source = "../aanet/saneltu/vastarakki.mp3")]
		public static const VaestaeraekkiAaniSaneltu:Class;
		//********************
		
		// Global Variables
		//********************
		public static var labHighTime:Time = new Time();
		//********************
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static var BGMusic:Sound = new Sound();
		public static var BGMChannel:SoundChannel = new SoundChannel();
		public static var BGMTransform:SoundTransform = new SoundTransform();
		public static var BGMute:Boolean = false;
		public static var gameStage:Stage;
		
		public static function getTexture(textureName:String):Bitmap
		{
			//[Embed(source = "../Grafiikka/Muistipeli/"+ textureName +".png")]
			
			var bitmap:Bitmap = new Assets[textureName]();
			gameTextures[textureName] = bitmap;
			
			return gameTextures[textureName];
		}
		
		public static function getSound(soundName:String):Sound
		{
			var sound:Sound = new Assets[soundName]();
			
			return sound;
		}
		
		public static function removeChars(char:String, stringToMod:String):String
		{
			var temp:String = "";
			for(var i:int = 0; i < stringToMod.length; i++)
			{
				if(char != stringToMod.charAt(i))
					temp+= stringToMod.charAt(i);
			}
			return temp;
		}
	}
}