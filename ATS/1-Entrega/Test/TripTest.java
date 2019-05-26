package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class TripTest {

    @Test
    public void distance() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);

        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(1,1), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);
        Assert.assertEquals(1.4,t1.distance(),0.1);

        Trip t2 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);
        Assert.assertEquals(0,t2.distance(),0.1);
    }
}