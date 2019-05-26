package uMer;

import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Assert;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class DriverTest {

    @Test
    public void addTrip() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);

        Trip t = new Trip (d1.getTrips().size(),  new Point2D.Double(),  new Point2D.Double(1,1), 1.0, 1.5, localDate, "78-92-MA", "ats@uminho.pt", "novo@gmail.com", (int) 4.3, 0.55, new Point2D.Double(0,0), 0, 0,2.0);

        d1.addTrip(t);
        Assert.assertEquals(1,d1.getTrips().size(),0.1);
        Assert.assertEquals(0,d1.getTotalDistance()-t.distance(),0.1);
        Assert.assertEquals(0.2,Math.abs(d1.getExp()-(t.distance()+1)/2),0.1);
        Assert.assertEquals(0,d1.getDeviation()-Math.abs(t.getPrice() - t.getEstimatedPrice()),0.1);
    }

    @Test
    public void addRating() {
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate = MockLocalDate.of(4, month0, 4);
        Driver d1 = new Driver("ats@uminho.pt", "Carlos Monteiro", "syjghbsd", "Rua couteiro", localDate,0,0, true, 1.0, null, 0, 0, 0, "78-92-MA",null,0);

        d1.addRating(1);
        Assert.assertEquals(20,d1.getRating(),0.1);
        d1.setRating(2);
        Assert.assertEquals(2,d1.getRating(),0.1);
    }
}