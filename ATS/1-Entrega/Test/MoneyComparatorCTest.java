package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class MoneyComparatorCTest {


    @Test
    public void compare() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);
        Client c1 = new Client("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,new Point2D.Double(),0,null,0,0,false,null);
        Client c2 = new Client("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,new Point2D.Double(),0,null,0,0,false,null);
        Client c3 = new Client("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,new Point2D.Double(),0,null,0,3,false,null);

        MoneyComparatorC moneyComparatorC = new MoneyComparatorC();
        Assert.assertEquals(0,moneyComparatorC.compare(c1,c2),0.1);
        Assert.assertEquals(1,moneyComparatorC.compare(c1,c3),0.1);
        Assert.assertEquals(-1,moneyComparatorC.compare(c3,c2),0.1);
    }
}