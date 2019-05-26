package uMer;
import org.evosuite.runtime.mock.java.time.MockLocalDate;
import org.junit.Test;

import java.awt.geom.Point2D;
import java.time.LocalDate;
import java.time.Month;

import static org.junit.Assert.*;

public class VehicleTest {

    @Test
    public void equals() {
        Car v1 = new Car("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        Car v2 = new Car("65-23-GS", 4, new Point2D.Double(), "Carlos Monteiro");
        assertTrue(v1.equals(v2));
        Car v3 = new Car("65-25-GS", 4, new Point2D.Double(), "Paula Monteiro");
        assertFalse(v1.equals(v3));
    }

    @Test
    public void addTrip() {
        Car v1 = new Car("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);
        v1.addTrip(t1);
        assertTrue(v1.getTrips().contains(t1));
        Trip t2 = new Trip(4, new Point2D.Double(), new Point2D.Double(), 0.20, 1.0 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 0.20, new Point2D.Double(), 0.20, 0.20, 1.0);
        assertFalse(v1.getTrips().contains(t2));
    }

    @Test
    public void moneyGeneratedBetween() {
        Car v1 = new Car("65-23-GS", 4, new Point2D.Double(),"Carlos Monteiro") ;
        Month month0 = Month.SEPTEMBER;
        LocalDate localDate0 = MockLocalDate.of(4, month0, 4);
        Trip t1 = new Trip(1, new Point2D.Double(), new Point2D.Double(), 1.20, 4.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 1.20, new Point2D.Double(), 1.20, 1.20, 4.5);
        Trip t2 = new Trip(2, new Point2D.Double(), new Point2D.Double(), 0.20, 5.5 , localDate0, "65-23-GS", "Carlos Monteiro", "Rui Fernades", 4, 0.20, new Point2D.Double(), 0.20, 0.20, 5.5);
        v1.addTrip(t1);
        v1.addTrip(t2);
        assertEquals(10,v1.moneyGeneratedBetween(localDate0, localDate0),0.1);
    }
}