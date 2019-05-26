package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class UserTest {

    @Test
    public void addTrip() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);

        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate0,0,0, true, 1.0, null, 0, 0, 0, "38-42-NA",null,0);

        d1.addTrip(t1);

        Assert.assertEquals(1,d1.getTrips().size());
        Assert.assertEquals(0,d1.getTotalDistance()- (t1.distance()), 0.1);
        Assert.assertEquals(0,d1.getMoney()- (t1.getPrice()), 0.1);
    }
}