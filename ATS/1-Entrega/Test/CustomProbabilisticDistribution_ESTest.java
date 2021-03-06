/*
 * This file was automatically generated by EvoSuite
 * Sat Nov 17 23:25:52 GMT 2018
 */

package uMer;

import org.junit.Test;
import static org.junit.Assert.*;
import org.evosuite.runtime.EvoRunner;
import org.evosuite.runtime.EvoRunnerParameters;
import org.junit.runner.RunWith;
import uMer.CustomProbabilisticDistribution;

@RunWith(EvoRunner.class) @EvoRunnerParameters(mockJVMNonDeterminism = true, useVFS = true, useVNET = true, resetStaticState = true, separateClassLoader = true, useJEE = true) 
public class CustomProbabilisticDistribution_ESTest extends CustomProbabilisticDistribution_ESTest_scaffolding {

  @Test(timeout = 4000)
  public void test0()  throws Throwable  {
      CustomProbabilisticDistribution customProbabilisticDistribution0 = new CustomProbabilisticDistribution();
      customProbabilisticDistribution0.addValues((-217), (-217));
  }

  @Test(timeout = 4000)
  public void test1()  throws Throwable  {
      CustomProbabilisticDistribution customProbabilisticDistribution0 = new CustomProbabilisticDistribution();
      customProbabilisticDistribution0.addValues(1, 1);
      customProbabilisticDistribution0.pickNumber();
  }

  @Test(timeout = 4000)
  public void test2()  throws Throwable  {
      CustomProbabilisticDistribution customProbabilisticDistribution0 = new CustomProbabilisticDistribution();
      customProbabilisticDistribution0.addValues((-641), 873.22892);
      int int0 = customProbabilisticDistribution0.pickNumber();
      assertEquals((-641), int0);
  }

  @Test(timeout = 4000)
  public void test3()  throws Throwable  {
      CustomProbabilisticDistribution customProbabilisticDistribution0 = new CustomProbabilisticDistribution();
      int int0 = customProbabilisticDistribution0.pickNumber();
      assertEquals(0, int0);
  }
}
