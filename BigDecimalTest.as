package 
{
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	public class BigDecimalTest extends TestCase
	{
		public function BigDecimalTest(methodName:String = null):void {
            super(methodName);
        }

        public static function suite():TestSuite {
            var ts:TestSuite = new TestSuite();
            
            ts.addTest( new BigDecimalTest("testSomme") );
            ts.addTest( new BigDecimalTest("testSubstract") );
            ts.addTest( new BigDecimalTest("testMultiply") );
            ts.addTest( new BigDecimalTest("testDivide") );
            ts.addTest( new BigDecimalTest("testAbs") );
            ts.addTest( new BigDecimalTest("testPow") );
            ts.addTest( new BigDecimalTest("testRoundEquals") );
            
            return ts;
        }
		
		public function testSomme():void
        {
        	var chiffre1:BigDecimal = new BigDecimal("555.50");
        	var chiffre2:BigDecimal = new BigDecimal("45.55");
        	
        	total = chiffre1.add(chiffre2);
        	
        	var string:String = total.toString();
        	assertTrue(string == "601.05");
        	
            var aClass1:BigDecimal = new BigDecimal("0.15015");
            var aClass2:BigDecimal = new BigDecimal("0.34567");
            var aClass3:BigDecimal = new BigDecimal("0.26897");
            
            var total:BigDecimal = aClass1.add(aClass2).add(aClass3);
            
            assertEquals(0.76479, total.numberValue());
            total = total.setScaleRound(3, MathContext.ROUND_HALF_UP);

            assertEquals(0.765, total.numberValue());
        }
        
        public function testSubstract():void
        {
            var chiffre1:BigDecimal = new BigDecimal("555.50");
            var chiffre2:BigDecimal = new BigDecimal("45.55");
            
            var total:BigDecimal = chiffre1.subtract(chiffre2);          
            
            var string:String = total.toString();
            assertTrue(string == "509.95");
            
            var aClass1:BigDecimal = new BigDecimal("0.15015");
            var aClass2:BigDecimal = new BigDecimal("0.34567");
            var aClass3:BigDecimal = new BigDecimal("0.26897");
            
            total = aClass1.subtract(aClass2).subtract(aClass3);
            
            assertEquals(-0.46449, total.numberValue());
        }

        public function testMultiply():void
        {
            var chiffre1:BigDecimal = new BigDecimal("555.50");
            var chiffre2:BigDecimal = new BigDecimal("45.55");
            
            var total:BigDecimal = chiffre1.multiply(chiffre2);          
            
            var string:String = total.toString();
            assertTrue(string == "25303.0250");
            
            var aClass1:BigDecimal = new BigDecimal("0.15015");
            var aClass2:BigDecimal = new BigDecimal("0.34567");
            var aClass3:BigDecimal = new BigDecimal("0.26897");
            

            total = aClass1.multiply(aClass2).multiply(aClass3);
            
            var number:Number = total.numberValue();
            assertEquals(0.013960175213985, number);

            //Test envoyes par NDiaga
            number = new BigDecimal("2.3").multiply(new BigDecimal("0.95")).numberValue();
            assertEquals(2.185, number);
            number = new BigDecimal("2.3").multiply(new BigDecimal("0.18")).numberValue();
            assertEquals(0.414, number);
            number = new BigDecimal("2.3").multiply(new BigDecimal("0.21")).numberValue();
            assertEquals(0.483, number);
            number = new BigDecimal("2.3").multiply(new BigDecimal("0.24")).numberValue();
            assertEquals(0.552, number);
            number = new BigDecimal("2.3").multiply(new BigDecimal("0.29")).numberValue();
            assertEquals(0.667, number);
            number = new BigDecimal("75").multiply(new BigDecimal("95")).numberValue();
            assertEquals(7125, number);
            
            //Tests envoyes par Simon
            number = new BigDecimal("8490.675").multiply(new BigDecimal("100")).numberValue();
            assertEquals(849067.5, number);
        }

        public function testDivide():void
        {
            var chiffre1:BigDecimal = new BigDecimal(555.50);
            var chiffre2:BigDecimal = new BigDecimal("45.55");
            
            var total:BigDecimal = chiffre1.divide(chiffre2);          
            
            var string:String = total.toString();
            assertTrue(string == "12.1953896817");
            
            var aClass1:BigDecimal = new BigDecimal("0.15015");
            aClass1 = aClass1.setScale(31);
            var aClass2:BigDecimal = new BigDecimal("0.34567");
            var aClass3:BigDecimal = new BigDecimal("0.26897");
            
            
            total = aClass1.divide(aClass2).divide(aClass3);
            string = total.toString();
            
            assertEquals(string, "1.6149526889472623986174998258858");
        }

        public function testAbs():void
        {
            var chiffre1:BigDecimal = new BigDecimal("-555.567");
            
            var total:BigDecimal = chiffre1.abs();          
            
            var string:String = total.toString();
            
            assertTrue(string == "555.567");            
        }

        public function testPow():void
        {
            var chiffre1:BigDecimal = new BigDecimal("-55.50");
            var chiffre2:BigDecimal = new BigDecimal("3");
            
            var total:BigDecimal = chiffre1.pow(chiffre2);          
            
            var string:String = total.toString();
            assertTrue(string == "-170953.875000");
            
        }

        public function testRoundEquals():void
        {
			var chiffre1:BigDecimal = (new BigDecimal(5.5)).setScaleRound(0, MathContext.ROUND_HALF_UP);
			assertTrue(chiffre1.equals(new BigDecimal(6)));
			chiffre1 = (new BigDecimal(2.5)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(3)));
			chiffre1 = (new BigDecimal(1.6)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(2)));
			chiffre1 = (new BigDecimal(1.1)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(1)));
			chiffre1 = (new BigDecimal(1.0)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(1)));
			chiffre1 = (new BigDecimal(-1.0)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(-1)));
			chiffre1 = (new BigDecimal(-1.1)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(-1)));
			chiffre1 = (new BigDecimal(-1.6)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(-2)));
			chiffre1 = (new BigDecimal(-2.5)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(-3)));
			chiffre1 = (new BigDecimal(-5.5)).setScaleRound(0, MathContext.ROUND_HALF_UP); 
			assertTrue(chiffre1.equals(new BigDecimal(-6)));
        }
	}
	
    
}