/*
 * This file was automatically generated by EvoSuite
 * Sat Nov 17 23:27:12 GMT 2018
 */

package uMer;

import org.junit.Test;
import static org.junit.Assert.*;
import static org.evosuite.shaded.org.mockito.Mockito.*;
import static org.evosuite.runtime.EvoAssertions.*;
import org.evosuite.runtime.EvoRunner;
import org.evosuite.runtime.EvoRunnerParameters;
import org.evosuite.runtime.ViolatedAssumptionAnswer;
import org.junit.runner.RunWith;
import uMer.Client;
import uMer.MoneyComparatorC;

@RunWith(EvoRunner.class) @EvoRunnerParameters(mockJVMNonDeterminism = true, useVFS = true, useVNET = true, resetStaticState = true, separateClassLoader = true, useJEE = true) 
public class MoneyComparatorC_ESTest extends MoneyComparatorC_ESTest_scaffolding {

  @Test(timeout = 4000)
  public void test0()  throws Throwable  {
      MoneyComparatorC moneyComparatorC0 = new MoneyComparatorC();
      Client client0 = mock(Client.class, new ViolatedAssumptionAnswer());
      doReturn((String) null).when(client0).getEmail();
      doReturn(0.0, 0.0).when(client0).getMoney();
      Client client1 = mock(Client.class, new ViolatedAssumptionAnswer());
      doReturn((String) null).when(client1).getEmail();
      doReturn(0.0, 0.0).when(client1).getMoney();
      // Undeclared exception!
      try { 
        moneyComparatorC0.compare(client0, client1);
        fail("Expecting exception: NullPointerException");
      
      } catch(NullPointerException e) {
         //
         // no message in exception (getMessage() returned null)
         //
         verifyException("uMer.MoneyComparatorC", e);
      }
  }

  @Test(timeout = 4000)
  public void test1()  throws Throwable  {
      MoneyComparatorC moneyComparatorC0 = new MoneyComparatorC();
      Client client0 = mock(Client.class, new ViolatedAssumptionAnswer());
      doReturn((-155.53364720331157), (-155.53364720331157), (-2826.3), 0.0).when(client0).getMoney();
      int int0 = moneyComparatorC0.compare(client0, client0);
      assertEquals(1, int0);
  }

  @Test(timeout = 4000)
  public void test2()  throws Throwable  {
      MoneyComparatorC moneyComparatorC0 = new MoneyComparatorC();
      Client client0 = mock(Client.class, new ViolatedAssumptionAnswer());
      doReturn((-869.29235448512), (-3144.39569)).when(client0).getMoney();
      int int0 = moneyComparatorC0.compare(client0, client0);
      assertEquals((-1), int0);
  }

  @Test(timeout = 4000)
  public void test3()  throws Throwable  {
      MoneyComparatorC moneyComparatorC0 = new MoneyComparatorC();
      Client client0 = mock(Client.class, new ViolatedAssumptionAnswer());
      doReturn("", "").when(client0).getEmail();
      doReturn((-1849.5978150816936), 0.0, 2.0, (-1.0)).when(client0).getMoney();
      int int0 = moneyComparatorC0.compare(client0, client0);
      assertEquals(0, int0);
  }
}